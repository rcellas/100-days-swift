//
//  main.swift
//  day-2
//
//  Created by Rcellas on 24/12/24.
//

// colección de valores que puedan contener duplicados, o si el orden de los elementos es importante
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
print(beatles)

print(beatles[1])

let colors = Set(["red", "green", "blue"])
print(colors)

// para valores unicos
// no salen los repetidos pq lo que hace Set es que todos los valores son unicos, por tanto solo apareceran una única vez
let colors2 = Set(["red", "green", "blue", "red", "blue"])
print(colors2)


// colección específica y fija de valores relacionados donde cada elemento tenga una posición o nombre preciso
var name = (first: "Taylor", last: "Swift")
// se puede acceder a los valores de las siguientes formas
print(name.0)
print(name.first)


// diccionaries
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

//print(heights["Taylor Swift"])

// diccionario valores defectos
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

print(favoriteIceCream["Paul"])

// obtenemos 0 pq no existe
print(favoriteIceCream["Charlotte"])

// le especificamos el valor que tendrá
print(favoriteIceCream["Charlotte", default: "Unknown"])

// colecciones
//vacias
var teams = [String: String]()
print(teams)

//añadimos valores
teams["Paul"] = "Red"

print(teams)

// para almacenar valores vacios
var results = [Int]()

//conjuntos vacios
var words = Set<String>()
var numbers = Set<Int>()

// para dicccionarios
var scores = Dictionary<String, Int>()
var results2 = Array<Int>()

// enums
let result = "failure"
let result2 = "failed"
let result3 = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure
print(result4)



enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")
print(talking)

enum Planet: Int {
    case mercury=1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)
print(earth)


