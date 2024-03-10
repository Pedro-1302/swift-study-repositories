import UIKit
import Foundation

var greeting = "Hello, playground"

class Animal {
    var name: String
    
    init(n: String) {
        name = n
    }
}

class Human: Animal {
    func code() {
        print("Coding hard java exercices =)=")
    }
}

class Fish: Animal {
    func breatheUnderWater() {
        print("Breathing under water.")
    }
}

let jairo = Human(n: "Jairo Camargo Neves")
let pedro = Human(n: "Pedro Franco")
let nemo = Fish(n: "Nemo")

// Array of type animal
let neighbours = [jairo, pedro, nemo]

// This dont come back to Human (jairo type)
let neighbour1 = neighbours[0]

let neighbour2 = neighbours[1] as! Human

// Type Checking
if neighbours[0] is Human { print("This worked.") }

func findNemo(from animals: [Animal]) {
    for animal in animals {
        if animal is Fish {
            print(animal.name)
            
            // Down Casting
            if let fish = animal as? Fish {
                fish.breatheUnderWater()
            }
        }
    }
}

struct Car {
    func drive() {
        print("Vrun vrun vrun")
    }
}



findNemo(from: neighbours)

if let fish = neighbours[0] as? Fish {
    fish.breatheUnderWater()
} else {
    print("\(neighbours[0].name) isn't a fish.")
}

// as -> Upcasting
// let newCell = messageCell as UITableViewCell

// Any, AnyObject

// Any type of data
let any: [Any] = [jairo, pedro, nemo, 3]

// For objects
let porsche = Car()
let anyObject: [AnyObject] = [jairo, porsche, nemo]

// Only classes in Foundation
let num: NSNumber = 12
let word: NSString = "abc"
let nsObject: [NSObject] = [num, word]
