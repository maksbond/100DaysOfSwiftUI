import Cocoa

class Animal {
    let legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }

    func speak() {
        print("Bark! Bark!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Corgi barks!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poodle barks!")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("Meow! Meow!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Persian meow!")
    }
}

class Lion: Cat {
    override func speak() {
        print("Not regular cat meow!")
    }
}

var animal = Animal(legs: 2)
print("Animal legs: \(animal.legs)")

var dog = Dog()
print("Dog legs: \(dog.legs)")
print("Dog speak:")
dog.speak()
dog = Corgi()
print("Corgi legs: \(dog.legs)")
print("Corgi speak:")
dog.speak()
dog = Poodle()
print("Poodle legs: \(dog.legs)")
print("Poodle speak:")
dog.speak()

var cat = Cat(isTame: true)
print("Cat legs: \(cat.legs)")
print("Cat is tame: \(cat.isTame)")
print("Cat speak:")
cat.speak()
cat = Persian(isTame: true)
print("Persian legs: \(cat.legs)")
print("Persian is tame: \(cat.isTame)")
print("Persian speak:")
cat.speak()
cat = Lion(isTame: false)
print("Lion legs: \(cat.legs)")
print("Lion is tame: \(cat.isTame)")
print("Lion speak:")
cat.speak()
