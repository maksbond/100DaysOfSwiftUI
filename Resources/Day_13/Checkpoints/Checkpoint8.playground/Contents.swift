import Cocoa

protocol Building {
    var roomsCount: Int { get set }
    var cost: Int { get set }
    var agentName: String { get }
    func printSummary()
}

extension Building {
    func printSummary() {
        print("This building is managed by \(agentName)!")
        print("It contains \(roomsCount) rooms and costs \(cost.formatted(.currency(code: "CAD")))")
    }
}

struct House: Building {
    var roomsCount: Int = 4
    var cost: Int = 300_000
    var agentName: String {
        "Anna"
    }
}

struct Office: Building {
    var roomsCount: Int = 100
    var cost: Int = 3_000_000
    var agentName: String {
        "Real Estate Inc."
    }
}

var building: Building = House()
building.printSummary()
building = Office()
building.printSummary()
