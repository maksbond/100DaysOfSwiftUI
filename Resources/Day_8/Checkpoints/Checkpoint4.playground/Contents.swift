import Cocoa

enum SqrtError: Error {
    case outOfBounds
    case noRoot
}

func mySqrt(_ number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw SqrtError.outOfBounds
    }
    for sqrtNumber in 1...100 {
        if number == sqrtNumber * sqrtNumber {
            return sqrtNumber
        }
    }
    throw SqrtError.noRoot
}

let number = 9
do {
    let result = try mySqrt(number)
    print("SQRT of \(number) is \(result)")
} catch SqrtError.outOfBounds {
    print("\(number) is out of bounds 1 to 10000")
} catch SqrtError.noRoot {
    print("No int root for \(number)")
} catch {
    print("Unknown error")
}
