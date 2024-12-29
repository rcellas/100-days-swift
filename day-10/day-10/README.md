# Day 10
## Creating you own classes
Las clases son similares a las estructuras en el sentido de que permiten crear nuevos tipos con propiedades y métodos, pero tienen cinco diferencias importantes y voy a explicarlas una por una.

La primera diferencia entre clases y estructuras es que las clases nunca vienen con un inicializador miembro por miembro. Esto significa que si tienes propiedades en tu clase, siempre debes crear tu propio inicializador.

Por ejemplo:

class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
La creación de instancias de esa clase se ve exactamente igual que si fuera una estructura:

let poppy = Dog(name: "Poppy", breed: "Poodle")

## Class inheritance
La segunda diferencia entre clases y estructuras es que puedes crear una clase basada en una clase existente: hereda todas las propiedades y métodos de la clase original y puede agregar los suyos propios.

Esto se llama herencia de clase o subclases , la clase de la que hereda se llama clase “padre” o “superclase”, y la nueva clase se llama clase “hija”.

Aquí está la Dogclase que acabamos de crear:

class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
Podríamos crear una nueva clase basada en la anterior llamada Poodle. Heredará las mismas propiedades y el mismo inicializador que Dogpor defecto:

class Poodle: Dog {

}
Sin embargo, también podemos darle Poodlesu propio inicializador. Sabemos que siempre tendrá la raza “Poodle”, por lo que podemos crear un nuevo inicializador que solo necesite una namepropiedad. Mejor aún, podemos hacer que el Poodleinicializador llame al Doginicializador directamente para que se realice la misma configuración:

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}
Por razones de seguridad, Swift siempre te hace llamar super.init()desde las clases secundarias, en caso de que la clase principal realice algún trabajo importante cuando se crea.

## Overriding  methods

Las clases secundarias pueden reemplazar los métodos primarios con sus propias implementaciones, un proceso conocido como anulación . Aquí hay una Dogclase trivial con un makeNoise()método:

class Dog {
    func makeNoise() {
        print("Woof!")
    }
}
Si creamos una nueva Poodleclase que hereda de Dog, heredará el makeNoise()método. Por lo tanto, esto imprimirá “¡Guau!”:

class Poodle: Dog {
}

let poppy = Poodle()
poppy.makeNoise()
La anulación de métodos nos permite cambiar la implementación de makeNoise()la Poodleclase.

Swift requiere que usemos override funcen lugar de solo funccuando anulamos un método: evita que anules un método por accidente y obtendrás un error si intentas anular algo que no existe en la clase principal:

class Poodle: Dog {
    override func makeNoise() {
        print("Yip!")
    }
}
Con ese cambio, poppy.makeNoise()se imprimirá “¡Yip!” en lugar de “¡Woof!”.

## Final classes
Si bien la herencia de clases es muy útil (y, de hecho, gran parte de las plataformas de Apple requieren su uso), a veces es conveniente impedir que otros desarrolladores creen sus propias clases basándose en las suyas.

Swift nos proporciona una finalpalabra clave precisamente para este propósito: cuando declaras que una clase es final, ninguna otra clase puede heredar de ella. Esto significa que no pueden anular tus métodos para cambiar tu comportamiento; necesitan usar tu clase tal como fue escrita.

Para que una clase sea final simplemente ponga la final  palabra clave antes de ella, de esta manera:

final class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

## Copying objects
La tercera diferencia entre clases y estructuras es cómo se copian. Cuando se copia una estructura, tanto el original como la copia son cosas diferentes: cambiar una no cambiará la otra. Cuando se copia una clase , tanto el original como la copia apuntan a lo mismo , por lo que cambiar una sí cambia la otra.

SingerPor ejemplo, aquí hay una clase simple que tiene una namepropiedad con un valor predeterminado:

class Singer {
    var name = "Taylor Swift"
}
Si creamos una instancia de esa clase e imprimimos su nombre, obtendremos “Taylor Swift”:

var singer = Singer()
print(singer.name)
Ahora vamos a crear una segunda variable a partir de la primera y cambiar su nombre:

var singerCopy = singer
singerCopy.name = "Justin Bieber"
Debido a la forma en que funcionan las clases, tanto singery singerCopyapuntan al mismo objeto en la memoria, por lo que cuando imprimimos nuevamente el nombre del cantante veremos "Justin Bieber":

print(singer.name)
Por otro lado, si Singerfuera una estructura, obtendríamos “Taylor Swift” impreso una segunda vez:

struct Singer {
    var name = "Taylor Swift"
}

## Deinitializers
La cuarta diferencia entre clases y estructuras es que las clases pueden tener desinicializadores : código que se ejecuta cuando se destruye una instancia de una clase.

Para demostrar esto, aquí hay una Personclase con una namepropiedad, un inicializador simple y un printGreeting()método que imprime un mensaje:

class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
}
Vamos a crear algunas instancias de la Personclase dentro de un bucle, porque cada vez que el bucle da una vuelta, se creará una nueva persona y luego se destruirá:

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}
Y ahora, el desinicializador. Se llamará cuando Personse destruya la instancia:

deinit {
    print("\(name) is no more!")
}

## Mutability
La última diferencia entre las clases y las estructuras es la forma en que tratan las constantes. Si tienes una estructura constante con una propiedad variable, esa propiedad no se puede cambiar porque la estructura en sí es constante.

Sin embargo, si tienes una clase constante con una propiedad variable, esa propiedad se puede cambiar. Por este motivo, las clases no necesitan la mutatingpalabra clave con métodos que cambian propiedades; eso solo es necesario con estructuras.

Esta diferencia significa que puedes cambiar cualquier propiedad variable en una clase incluso cuando la clase se crea como una constante: este es un código perfectamente válido:

class Singer {
    var name = "Taylor Swift"
}

let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)
Si desea evitar que esto suceda, debe hacer que la propiedad sea constante:

class Singer {
    let name = "Taylor Swift"
}


