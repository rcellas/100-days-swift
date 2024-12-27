//
//  main.swift
//  day-8
//
//  Created by BCN MAC 020 on 27/12/24.
//

// Creando tus propias estructuras
// struct -> es un tipo definido por el usuario que se utiliza para agrupar datos relacionados y definir comportamientos asociados
struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
tennis.name = "Lawn tennis"
print(tennis.name)

// Computed properties
struct Sport2 {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// Property observers
struct Progress {
    var task: String
    var amount: Int
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100
print(progress)

// didSet observa las propiedades
struct Progress2 {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

let  progress2 = Progress2(task: "Lear Swift", amount: 10)
print(progress2.amount)

// Methods

struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
print(london.collectTaxes())

// Mutating  methods
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
print(person.makeAnonymous())

// Properties and methods of strings
let string = "Do or do not, there is no try."
print(string.count)

print(string.hasPrefix("Do"))

print(string.uppercased())

print(string.sorted())

// Properties and methods of arrays
var toys = ["Woody"]

print(toys.count)

toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)




