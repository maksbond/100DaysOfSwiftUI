import Cocoa

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        currentGear = 1
    }
    
    mutating func changeGear(up: Bool) -> Bool {
        if up, (1...10).contains(currentGear + 1) {
            currentGear += 1
            return true
        } else if (1...10).contains(currentGear - 1) {
            currentGear -= 1
            return true
        }
        return false
    }
}

var ferrari = Car(model: "Ferrari", numberOfSeats: 4)
print(ferrari.changeGear(up: false))
print(ferrari.currentGear)
print(ferrari.changeGear(up: true))
print(ferrari.currentGear)
