import Cocoa

func random(in array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...10)
}

let array: [Int]? = nil
let result = random(in: array)

print("result: \(result)")
