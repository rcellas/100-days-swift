# Day 9
## Initializers
Los inicializadores son métodos especiales que ofrecen distintas formas de crear tu estructura. Todas las estructuras vienen con uno de forma predeterminada, llamado inicializador miembro por miembro , que te pide que proporciones un valor para cada propiedad cuando creas la estructura.

Puedes ver esto si creamos una Userestructura que tiene una propiedad:

struct User {
    var username: String
}
Cuando creamos una de esas estructuras, debemos proporcionar un nombre de usuario:

var user = User(username: "twostraws")
Podemos proporcionar nuestro propio inicializador para reemplazar el predeterminado. Por ejemplo, podríamos querer crear todos los usuarios nuevos como “Anónimos” e imprimir un mensaje como este:

struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
No escribes antes de funclos inicializadores, pero sí debes asegurarte de que todas las propiedades tengan un valor antes de que finalice el inicializador.

Ahora nuestro inicializador no acepta parámetros, necesitamos crear la estructura de esta manera:

var user = User()
user.username = "twostraws"

## Referring to the current instance
Dentro de los métodos, se obtiene una constante especial llamada self, que apunta a la instancia de la estructura que se está utilizando actualmente. Este self valor es particularmente útil cuando se crean inicializadores que tienen los mismos nombres de parámetros que la propiedad.

Por ejemplo, si crea una Personestructura con una name propiedad y luego intenta escribir un inicializador que acepte un name parámetro, selfesto le ayudará a distinguir entre la propiedad y el parámetro:  self.name se refiere a la propiedad, mientras que name se refiere al parámetro.

Aquí está en código:

struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

## Lazy properties
Como optimización del rendimiento, Swift permite crear algunas propiedades solo cuando son necesarias. Como ejemplo, considere esta FamilyTree estructura: no hace mucho, pero en teoría, crear un árbol genealógico para alguien lleva mucho tiempo:

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}
Podríamos usar esa FamilyTree estructura como una propiedad dentro de una Person estructura, de esta manera:

struct Person {
    var name: String
    var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")
Pero ¿qué sucede si no siempre necesitamos el árbol genealógico de una persona en particular? Si agregamos la lazy palabra clave a la familyTree propiedad, Swift solo creará la FamilyTree estructura cuando se acceda a ella por primera vez:

lazy var familyTree = FamilyTree()
Entonces, si quieres ver el mensaje “¡Creando árbol genealógico!”, necesitas acceder a la propiedad al menos una vez:

ed.familyTree

## Static properties and methods
Todas las propiedades y métodos que hemos creado hasta ahora han pertenecido a instancias individuales de estructuras, lo que significa que si tuviéramos una Student estructura podríamos crear varias instancias de estudiantes, cada una con sus propias propiedades y métodos:

struct Student {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")
También puedes pedirle a Swift que comparta propiedades y métodos específicos en todas las instancias de la estructura declarándolos como estáticos .

Para probar esto, agregaremos una propiedad estática a la Student estructura para almacenar cuántos estudiantes hay en la clase. Cada vez que creamos un nuevo estudiante, le agregaremos uno:

struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
Dado que la classSize propiedad pertenece a la estructura misma en lugar de a instancias de la estructura, debemos leerla usando Student.classSize:

print(Student.classSize)

## Access control
El control de acceso le permite restringir qué código puede usar propiedades y métodos. Esto es importante porque es posible que desee evitar que la gente lea una propiedad directamente, por ejemplo.

Podríamos crear una Person estructura que tenga una id propiedad para almacenar su número de seguro social:

struct Person {
    var id: String

    init(id: String) {
        self.id = id
    }
}

let ed = Person(id: "12345")
Una vez que se haya creado esa persona, podemos hacer que id sea privada para que no pueda leerla desde fuera de la estructura; intentar escribirla ed.id simplemente no funcionará.

Simplemente use la privatepalabra clave, así:

struct Person {
    private var id: String

    init(id: String) {
        self.id = id
    }
}
Ahora, solo los métodos internos Person pueden leer la id propiedad. Por ejemplo:

struct Person {
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}
Otra opción común es public, que permite que todo el resto del código utilice la propiedad o el método.

