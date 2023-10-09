//
//  ContentView.swift
//  WordScramble
//
//  Created by Maksym Bondar on 21.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    @State private var letters = 0

    @State private var allWords = [String]()

    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false

    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .onSubmit(addNewWord)
                }

                Section("User Score") {
                    VStack {
                        HStack {
                            Text("Total guessed words: ")
                            Spacer()
                            Text("\(score)")
                                .font(.largeTitle.bold())
                        }
                        HStack {
                            Text("Total guessed letters: ")
                            Spacer()
                            Text("\(letters)")
                                .font(.largeTitle.bold())
                        }
                    }
                }

                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(word)
                        .accessibilityHint("\(word.count) letters")  
                    }
                }
            }
            .navigationTitle(rootWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
            .toolbar {
                Button("Restart", action: restartGame)
            }
        }
    }
}

private extension ContentView {
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        guard !isShort(word: answer) else {
            wordError(title: "Word is too short", message: "Please, pick longer word!")
             return
        }

        guard !isStart(word: answer) else {
            wordError(title: "Word is identical", message: "Be more original!")
             return
        }

        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell this word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word is not recognized", message: "I do not understand what you wrote here!")
            return
        }

        withAnimation {
            score += 1
            letters += answer.count
            usedWords.insert(answer, at: 0)
            newWord = ""
        }
    }

    func startGame() {
        guard let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") else {
            fatalError("No start.txt file")
        }
        guard let startWords = try? String(contentsOf: startWordsURL) else {
            fatalError("Can't load start.txt words")
        }
        allWords = startWords.components(separatedBy: "\n")
        restartGame()
    }

    func restartGame() {
        withAnimation {
            rootWord = allWords.randomElement() ?? "silkworm"
            newWord = ""
            usedWords = []
            score = 0
            letters = 0
        }
    }

    func isShort(word: String) -> Bool {
        word.count < 3
    }

    func isStart(word: String) -> Bool {
        rootWord == word
    }

    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }

    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }

    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }

    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
