import Cocoa

let arrayOfStrings = ["one", "two", "three", "three", "five", "five", "seven"]

print("Number of elements in array: \(arrayOfStrings.count)")
print("Number of unique elements in array: \(Set(arrayOfStrings).count)")
