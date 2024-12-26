//
//  main.swift
//  day-5
//
//  Created by BCN MAC 020 on 26/12/24.
//

func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}
printHelp()

func square(number: Int) {
    print(number * number)
}

square(number: 8)

let result = square(number: 8)
print(result)

func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")

func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor")

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet("Taylor")
greet("Taylor", nicely: false)

// lo que hace aquí es meter cualquier cantidad de parámetros del mismo tipo, es por ello que para que sea variádicco se hace con ...
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)

// marcar errores, los marcamos los errores con los throws
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

// do -> para iniciar una sección de código que podría causar problemas
// try -> se utiliza antes de cada función que podría generar un error
// catch -> maneja los errores
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

// inout  -> es una palabra clave que se utiliza para declarar parámetros de una función que pueden ser modificados dentro de la función y cuyos cambios se reflejan fuera de ella
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
// & -> Esta función puede cambiar el valor de esta variable directamente
doubleInPlace(number: &myNum)


