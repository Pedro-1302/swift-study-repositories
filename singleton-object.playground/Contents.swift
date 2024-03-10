import UIKit

// All are Singletons
let defaults = UserDefaults.standard
let sharedURLSession = URLSession.shared

// Common Behavior
class Car {
    var colour = "Red"
}

let myCar = Car()
myCar.colour = "Blue"

let yourCar = Car()
print(yourCar.colour)

// Singleton Behavior = Always, goes to be the same copy
class SingletonCar {
    var colour = "Red"
    
    static let singletonCar = SingletonCar()
}

let myCarSg = SingletonCar.singletonCar
myCarSg.colour = "Blue"

let yourCarSg = SingletonCar.singletonCar
print(yourCarSg.colour)

class A {
    init() {
        SingletonCar.singletonCar.colour = "Brown"
    }
}

class B {
    init() {
        print(SingletonCar.singletonCar.colour)
    }
}

let a = A()
let b = B()



