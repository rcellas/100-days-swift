# Day 8
## Creating  your own structs
Swift te permite diseñar tus propios tipos de dos formas, de las cuales las más comunes se denominan estructuras o simplemente structs . A las estructuras se les pueden dar sus propias variables y constantes, y sus propias funciones, para luego crearlas y usarlas como quieras.

Comencemos con un ejemplo sencillo: vamos a crear una Sport estructura que almacene su nombre como una cadena. Las variables dentro de las estructuras se denominan propiedades , por lo que esta es una estructura con una propiedad:

struct Sport {
    var name: String
}
Eso define el tipo, por lo que ahora podemos crear y usar una instancia de él:

var tennis = Sport(name: "Tennis")
print(tennis.name)
Creamos ambas namevariables tennis, por lo que podemos cambiarlas como si fueran variables regulares:

tennis.name = "Lawn tennis"
Las propiedades pueden tener valores predeterminados al igual que las variables regulares, y generalmente puedes confiar en la inferencia de tipos de Swift.

## Computed properties
Acabamos de crear una Sportestructura como esta:

struct Sport {
    var name: String
}
Tiene una propiedad de nombre que almacena un valor String. Se denominan propiedades almacenadas , porque Swift tiene un tipo de propiedad diferente llamada propiedad calculada , una propiedad que ejecuta código para averiguar su valor.

Vamos a agregar otra propiedad almacenada a la Sportestructura y luego una propiedad calculada. Así es como se ve:

struct Sport {
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
Como puedes ver, olympicStatusparece un . normal String, pero devuelve valores diferentes dependiendo de las otras propiedades.

Podemos probarlo creando una nueva instancia de Sport:

let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

## Property observers
Los observadores de propiedades permiten ejecutar código antes o después de cualquier cambio de propiedad. Para demostrarlo, escribiremos una Progress estructura que realiza un seguimiento de una tarea y un porcentaje de finalización:

struct Progress {
    var task: String
    var amount: Int
}
Ahora podemos crear una instancia de esa estructura y ajustar su progreso a lo largo del tiempo:

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100
Lo que queremos que suceda es que Swift imprima un mensaje cada vez que amount se produzcan cambios, y para ello podemos usar un didSet observador de propiedades. Esto ejecutará un código cada vez que amount se produzcan cambios:

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
También puedes usarlo willSetpara tomar medidas antes de que cambie una propiedad, pero eso rara vez se usa.


## Methods
Las estructuras pueden tener funciones dentro de ellas, y esas funciones pueden usar las propiedades de la estructura según sea necesario. Las funciones dentro de las estructuras se denominan métodos , pero siguen usando la misma funcpalabra clave.

Podemos demostrar esto con una Cityestructura. Esta tendrá una populationpropiedad que almacena cuántas personas hay en la ciudad, además de un collectTaxes()método que devuelve el recuento de la población multiplicado por 1000. Debido a que el método pertenece a Cityella, puede leer la populationpropiedad de la ciudad actual.

Aquí está el código:

struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
Ese método pertenece a la estructura, por lo que lo llamamos en instancias de la estructura de esta manera:

let london = City(population: 9_000_000)
london.collectTaxes()

## Mutating methods
Si una estructura tiene una propiedad variable pero la instancia de la estructura se creó como una constante, esa propiedad no se puede cambiar: la estructura es constante, por lo que todas sus propiedades también son constantes independientemente de cómo se crearon.

El problema es que cuando creas la estructura, Swift no tiene idea de si la usarás con constantes o variables, por lo que, de manera predeterminada, adopta el enfoque seguro: Swift no te permitirá escribir métodos que cambien propiedades a menos que lo solicites específicamente.

Cuando quieres cambiar una propiedad dentro de un método, debes marcarla usando la mutatingpalabra clave, de esta manera:

struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
Debido a que cambia la propiedad, Swift solo permitirá que se llame a ese método en Personinstancias que sean variables:

var person = Person(name: "Ed")
person.makeAnonymous()

## Properties and methods of strings
Hemos utilizado muchas cadenas hasta ahora y resulta que son estructuras: tienen sus propios métodos y propiedades que podemos usar para consultar y manipular la cadena.

Primero, creemos una cadena de prueba:

let string = "Do or do not, there is no try."
Puede leer el número de caracteres en una cadena usando su countpropiedad:

print(string.count)
Tienen un hasPrefix()método que devuelve verdadero si la cadena comienza con letras específicas:

print(string.hasPrefix("Do"))
Puedes poner una cadena en mayúsculas llamando a su uppercased()método:

print(string.uppercased())
Incluso puedes hacer que Swift ordene las letras de la cadena en una matriz:

print(string.sorted())
Las cadenas tienen muchas más propiedades y métodos: intente escribir string.para que aparezcan las opciones de completar código de Xcode.

## Properties and methods of arrays
Las matrices también son estructuras, lo que significa que también tienen sus propios métodos y propiedades que podemos usar para consultar y manipular la matriz.

Aquí hay una matriz simple para comenzar:

var toys = ["Woody"]
Puede leer el número de elementos en una matriz usando su countpropiedad:

print(toys.count)
Si desea agregar un nuevo elemento, utilice el append()método siguiente:

toys.append("Buzz")
Puedes localizar cualquier elemento dentro de una matriz usando su firstIndex()método, de esta manera:

toys.firstIndex(of: "Buzz")
Esto devolverá 1 porque las matrices cuentan desde 0.

Al igual que con las cadenas, puedes hacer que Swift ordene los elementos de la matriz alfabéticamente:

print(toys.sorted())
Por último, si deseas eliminar un elemento, utiliza el remove()método de la siguiente manera:

toys.remove(at: 0)
Las matrices tienen muchas más propiedades y métodos: intente escribir toys.para que aparezcan las opciones de completar código de Xcode.
