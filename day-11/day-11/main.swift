//
//  main.swift
//  day-11
//
//  Created by BCN MAC 020 on 29/12/24.
//

// Protocolos
// los protocolos son un tipo que define un conjunto de métodos, propiedades y otros requisitos que una clase, estructura o enumeración puede implementar. Son similares a las interfaces en otros lenguajes de programación, como Java o TypeScript
protocol Identifiable {
    var id: String { get set }
}

// no podemos crear instancias de este protocolo pero podemos crear estructuras que se ajusten a él
struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

// Herencia en los protocolos
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

// Extensiones
// nos permiten agregar metodos a tipos existentes para que hagan cosas para las que no fueron diseñados originalmente
extension Int {
    func squared() -> Int {
        return self * self
    }
    var isEven: Bool {
        return self % 2 == 0
    }
}

let number = 8
let squaredNumber = number.squared()
print("Squared: \(squaredNumber)")

let isEven = number.isEven
print("Is even: \(isEven)")

// extension de protocolos
// las extensiones de protocolos permiten agregar implementaciones predeterminadas a los métodos y propiedades definidos en un protocolo
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()

// Programación orientada a protocolos
// crear su código en torno a protocolos y extensiones de protocolos

protocol Identifiable2 {
    var id: String { get set }
    func identify()
}

extension Identifiable2 {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User2: Identifiable2 {
    var id: String
}

let twostraws = User2(id: "twostraws")
twostraws.identify()


