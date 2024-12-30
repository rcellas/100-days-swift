//
//  main.swift
//  day-12
//
//  Created by Rcellas on 30/12/24.
//

//  manejo de datos
var age: Int? = nil

age = 38


// Desempaquetando elementos opcionales
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

// Desembalaje con protección
// el guard lo que hará es que el código siga funcionando después de su acción
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

// Forzar el desenrollado

let str = "5"
let num = Int(str)!

print(num)

// Opcional implicitamente desenvuelto
// let age: Int! = nil

// Nil Coalescente
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"

print(user)

// Encadenamiento opcional
let names = ["John", "Paul", "George", "Ringo"]

let beatle = names.first?.uppercased()
print(beatle)

// Prueba opcional
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

//Inicializadores que fallan
struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

// Encasillamiento
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
