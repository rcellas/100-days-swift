//
//  main.swift
//  day-9
//
//  Created by BCN MAC 020 on 27/12/24.
//
import Foundation

// Initializers
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "twostraws"

// referring to the current instance self
// self ->apunta a la instancia  de la estructura  que  se está utilizando actualmente, es útil para cuando creamos inicializadores que tienen los mismos nombres  de  parámetros que la propiedad
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person2(name: "Ed")
//lazy var familyTree = FamilyTree()
//ed.familyTree

// Static properties and methods

struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed2 = Student(name: "Ed")
let taylor = Student(name: "Taylor")
//printf(ed2.name)
print(taylor)

print(Student.classSize)

// Access control
struct Person3 {
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let ed3 = Person3(id: "12345")
print(ed3.identify())


