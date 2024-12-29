//
//  main.swift
//  day-10
//
//  Created by BCN MAC 020 on 29/12/24.
//

//  creando clases propias
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")
print(poppy.name)

// Herencia
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

// Anulación de metodos
class Dog2 {
    func makeNoise() {
        print("Woof!")
    }
}

class Poodle2: Dog2 {
    override func makeNoise() {
        print("Yip!")
    }
}

let poppyAnulacion = Poodle2()
poppyAnulacion.makeNoise()


// clases finales
// las clases finales nos ayuda a que esa clase no pueda ser hederada
final class Dog3 {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// copiar objetos
// nos ayudará poder reutilizar siempre que queramos esos valores
class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Matthew James Bellamy"
print(singer.name)

// Desinicializadores
// sirve para ejecutarlo cuando se destruye una instancia de una clase (esto es igual que lo que hacía en react al desmontar el componente)

class Person {
    var namePerson = "John Doe"

    init() {
        print("\(namePerson) is alive!")
    }
    
    //  esto es lo que  destruye toda la clase person
    deinit  {
        print("\(namePerson) is no more!")
    }

    func printGreeting() {
        print("Hello, I'm \(namePerson)")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

//  Mutability
class Singer2{
    //  si  ponemos var lo hace que el nombre de dentro cambie, para evitarlo tendriamos que poner let
    var name  = "Taylor Swift"
}

let taylor = Singer2()
taylor.name = "Bizzarap"
print(taylor.name)




