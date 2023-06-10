import Cocoa

for i in 1...100 {
    var output = ""
    if i.isMultiple(of: 3) {
        output += "Fizz"
    }
    if i.isMultiple(of: 5) {
        output += "Buzz"
    }
    if output.isEmpty {
        output += String(i)
    }
    print(output)
}
