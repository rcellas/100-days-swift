# Day 11
## Protocolos
Los protocolos son una forma de describir qué propiedades y métodos debe tener algo. Luego, le indicas a Swift qué tipos usan ese protocolo, un proceso conocido como adoptar o cumplir con un protocolo.

Por ejemplo, podemos escribir una función que acepte algo con una idpropiedad, pero no nos importa exactamente qué tipo de datos se utilizan. Comenzaremos creando un Identifiableprotocolo, que requerirá que todos los tipos que cumplan con los requisitos tengan una idcadena que se pueda leer (“obtener”) o escribir (“establecer”):

protocol Identifiable {
    var id: String { get set }
}
No podemos crear instancias de ese protocolo: es una descripción de lo que queremos, en lugar de algo que podamos crear y usar directamente. Pero podemos crear una estructura que se ajuste a él:

struct User: Identifiable {
    var id: String
}
Finalmente, escribiremos una displayID()función que acepte cualquier Identifiableobjeto:

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

## Herencia de protocolos
Un protocolo puede heredar de otro en un proceso conocido como herencia de protocolo . A diferencia de las clases, puedes heredar de varios protocolos al mismo tiempo antes de agregar tus propias personalizaciones.

Vamos a definir tres protocolos: Payablerequiere que los tipos conformes implementen un calculateWages()método, NeedsTrainingrequiere que los tipos conformes implementen un study()método y HasVacationrequiere que los tipos conformes implementen un takeVacation()método:

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}
Ahora podemos crear un único Employeeprotocolo que los reúna en un solo protocolo. No necesitamos agregar nada encima, así que simplemente escribiremos llaves de apertura y cierre:

protocol Employee: Payable, NeedsTraining, HasVacation { }
Ahora podemos hacer que los nuevos tipos se ajusten a ese único protocolo en lugar de a cada uno de los tres individualmente.

## Extension
Las extensiones le permiten agregar métodos a tipos existentes, para que hagan cosas para las que no fueron diseñados originalmente.

Por ejemplo, podríamos agregar una extensión al Inttipo para que tenga un squared()método que devuelva el número actual multiplicado por sí mismo:

extension Int {
    func squared() -> Int {
        return self * self
    }
}
Para probarlo, simplemente crea un entero y verás que ahora tiene un squared()método:

let number = 8
number.squared()
Swift no permite agregar propiedades almacenadas en extensiones, por lo que debe usar propiedades calculadas en su lugar. Por ejemplo, podríamos agregar una nueva isEvenpropiedad calculada a números enteros que devuelva verdadero si contiene un número par:

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

## Extension de protocolos
Los protocolos te permiten describir qué métodos debería tener algo, pero no proporcionan el código que contienen. Las extensiones te permiten proporcionar el código dentro de tus métodos, pero solo afectan a un tipo de datos; no puedes agregar el método a muchos tipos al mismo tiempo.

Las extensiones de protocolo resuelven ambos problemas: son como extensiones normales, excepto que en lugar de extender un tipo específico como Intse extiende un protocolo completo, todos los tipos conformes obtienen sus cambios.

Por ejemplo, aquí hay una matriz y un conjunto que contienen algunos nombres:

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])
Tanto las matrices como los conjuntos de Swift se ajustan a un protocolo llamado Collection, por lo que podemos escribir una extensión a ese protocolo para agregar un summarize()método para imprimir la colección de forma ordenada.

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}
Ambos ahora Arraytendrán Setese método, por lo que podemos probarlo:

pythons.summarize()
beatles.summarize()

## Programación orientada a protocolos
Las extensiones de protocolo pueden proporcionar implementaciones predeterminadas para nuestros propios métodos de protocolo. Esto facilita que los tipos se ajusten a un protocolo y permite una técnica llamada "programación orientada a protocolos": crear su código en torno a protocolos y extensiones de protocolos.

Primero, aquí hay un protocolo llamado Identifiableque requiere que cualquier tipo conforme tenga una idpropiedad y un identify()método:

protocol Identifiable {
    var id: String { get set }
    func identify()
}
Podríamos hacer que cada tipo conforme escriba su propio identify()método, pero las extensiones de protocolo nos permiten proporcionar un valor predeterminado:

extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}
Ahora, cuando creamos un tipo que se ajusta a Identifiableél, obtiene identify()automáticamente:

struct User: Identifiable {
    var id: String
}

let twostraws = User(id: "twostraws")
twostraws.identify()
