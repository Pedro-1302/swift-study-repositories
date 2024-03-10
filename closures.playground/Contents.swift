import UIKit

//                      CLOSURES

        // Basic Closure Expression Syntax
        //  { (parameters) -> return type in
        //      statements
        //  }



// Creating some functions
func add(no1: Int, no2: Int) -> Int { return no1 + no2 }
func multiply(no1: Int, no2: Int) -> Int { return no1 * no2 }

// Functions who receives other functions as parameters
func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

// Passing functions as parameters
calculator(n1: 2, n2: 3, operation: add)
calculator(n1: 3, n2: 3, operation: multiply)






// How can i decreasing a function structure to a closure?
let closureForm1 = calculator(n1: 2, n2: 3, operation: { (no1: Int, no2: Int) -> Int in
    return no1 * no2
}) 
print(closureForm1)

let closureForm2 = calculator(n1: 2, n2: 3, operation: { (no1, no2) in
    no1 * no2
}) 
print(closureForm2)

let closureForm3 = calculator(n1: 2, n2: 3, operation: { $0 * $1 })
print(closureForm3)






// Using closure with .map
let array = [1, 2, 3, 4, 6, 8]

func addOne(n1: Int) -> Int {
    return n1 + 1
}

// Passing as a function
let arrayClosureForm1 = array.map(addOne)
print(arrayClosureForm1)

// Passing the basic closure syntax
let arrayClosureForm2 = array.map({ (n1: Int) -> Int in
    return n1 + 1
})
print(arrayClosureForm2)

// Reduced closure syntax
let arrayClosureForm3 = array.map{$0 + 1}
print(arrayClosureForm3)

// Another closure use
let newArray = array.map{"\($0)"}
print(newArray)






struct Student {
    let name: String
    var testScore: Int
}

let students = [ 
    Student(name: "Roger", testScore: 10),
    Student(name: "Marciel", testScore: 7),
    Student(name: "Joverson", testScore: 5),
    Student(name: "Rodrigo", testScore: 8)
]

// Func
func topStudentFilterF(student: Student) -> Bool {
    return student.testScore > 70
}
// Closure
var topStudentFilter: (Student) -> Bool = { student in
    return student.testScore > 70
}

// Basic closure syntax
let topStudents = students.filter{ student in
    return student.testScore > 80
}

// Reduced closure syntax
let topStudents2 = students.filter{ $0.testScore > 80 }

// Basic closure syntax
let studentRanking = topStudents2.sorted { student1, student2 in
    return student1.testScore > student2.testScore
}

// Reduced closure syntax
let studentRanking2 = topStudents2.sorted { $0.testScore > $1.testScore }






class Service {
    func returningInTheSameBlock(callback: () -> Void) {
        for i in 0...50 {
           print(i)
        }
        callback()
    }
    
    func returningAfter(callback: @escaping () -> Void) {
        for i in 0...50 {
            print(i)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            callback()
        }
    }
}

let service = Service()

// Async
service.returningInTheSameBlock(callback: {
    print("Sucesso")
})

// Not Async, uses @escaping
service.returningAfter (callback: {
    print("Sucess")
})





// Closures can be passed to a variable and this variable works as a function
func greetUser() { print("Hi there!") }
greetUser()
var greetCopy = greetUser
greetCopy()






let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

// Function
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

// Passing a function
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// Passing basic closure syntax
let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeam2)

// Passing a reduced closure syntax
let captainFirstTeam3 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}
print(captainFirstTeam3)

// Passing a more reduced closure syntax
let captainFirstTeam4 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}
print(captainFirstTeam4)

// Oneline cosure
let captainFirstTeam5 = team.sorted { $0 == "Suzanne" ? true : $1 == "Suzanne" ? false : $0 < $1 }
print(captainFirstTeam5)

// Using closure with filter
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// Using closure with map (again)
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
