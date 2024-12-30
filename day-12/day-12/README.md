# Day 12
## Handling missing data
Hemos utilizado tipos como Intpara almacenar valores como 5. Pero si quisieras almacenar una agepropiedad para los usuarios, ¿qué harías si no supieras la edad de alguien?

Podrías decir "bueno, guardaré 0", pero entonces confundirías a los recién nacidos con personas cuya edad no conoces. Podrías usar un número especial como 1000 o -1 para representar "desconocido", ambas edades imposibles, pero ¿realmente recordarías ese número en todos los lugares donde se usa?

La solución de Swift se llama opcionales y se pueden crear opcionales de cualquier tipo. Un entero opcional puede tener un número como 0 o 40, pero puede no tener ningún valor; puede que literalmente falte, lo que ocurre nilen Swift.

Para que un tipo sea opcional, agréguele un signo de interrogación. Por ejemplo, podemos hacer que un entero sea opcional de la siguiente manera:

var age: Int? = nil
Eso no contiene ningún número, no contiene nada. Pero si más adelante descubrimos esa edad, podemos usarla:

age = 38

## Unwrapping optionals
Las cadenas opcionales pueden contener una cadena como “Hola” o pueden ser nulas (nada en absoluto).

Considere esta cadena opcional:

var name: String? = nil
¿Qué sucede si usamos name.count? Una cadena real tiene una countpropiedad que almacena cuántas letras tiene, pero esto es nil: es memoria vacía, no una cadena, por lo que no tiene un count.

Por este motivo, intentar leer name.countno es seguro y Swift no lo permitirá. En su lugar, debemos mirar dentro del elemento opcional y ver qué hay allí, un proceso conocido como desenrollado .

Una forma habitual de desenvolver elementos opcionales es mediante if letla sintaxis, que se desenvuelve con una condición. Si había un valor dentro del elemento opcional, se puede utilizar, pero si no lo había, la condición falla.

Por ejemplo:

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}
Si namecontiene una cadena, se colocará dentro unwrappedcomo un valor regular Stringy podremos leer su countpropiedad dentro de la condición. Alternativamente, si nameestá vacío, elsese ejecutará el código.


## Unwrapping with guard
Una alternativa a if letes guard let, que también desenvuelve opcionales. guard letdesenvolverá un opcional para usted, pero si lo encuentra nildentro, espera que salga de la función, el bucle o la condición en la que lo utilizó.

Sin embargo, la principal diferencia entre if lety guard letes que el opcional sin envolver sigue siendo utilizable después del guardcódigo.

Probémoslo con una greet()función. Esta aceptará una cadena opcional como único parámetro e intentará desenrollarla, pero si no hay nada dentro, imprimirá un mensaje y saldrá. Debido a que las cadenas opcionales desenrolladas guard letpermanecen después de que guardfinaliza la función, podemos imprimir la cadena desenrollada al final de la función:

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}
El uso de funciones guard letle permite solucionar los problemas al comienzo de las funciones y luego salir de inmediato. Esto significa que el resto de la función es el camino correcto: el camino que toma el código si todo está correcto.

## Force unwrapping
Los opcionales representan datos que pueden estar o no ahí, pero a veces sabes con certeza que un valor no es nulo. En estos casos, Swift te permite forzar la desintegración del opcional: convertirlo de un tipo opcional a un tipo no opcional.

Por ejemplo, si tienes una cadena que contiene un número, puedes convertirla en un número Intcomo este:

let str = "5"
let num = Int(str)
numEsto lo hace opcional Int porque es posible que hayas intentado convertir una cadena como “Pescado” en lugar de “5”.

Aunque Swift no está seguro de que la conversión funcionará, puedes ver que el código es seguro, por lo que puedes forzar el desenrollado del resultado escribiendo !después Int(str), de esta manera:

let num = Int(str)!
Swift desenvolverá inmediatamente el opcional y creará numuno normal Inten lugar de uno Int?. Pero si te equivocas (si strera algo que no se podía convertir a un entero), tu código fallará.

Como resultado, debes forzar el desenrollado solo cuando estés seguro de que es seguro: hay una razón por la que a menudo se lo llama operador de bloqueo.

## Implicitly unwrapped optionals
Al igual que los opcionales regulares, los opcionales desenrollados implícitamente pueden contener un valor o pueden ser nil. Sin embargo, a diferencia de los opcionales regulares, no es necesario desenrollarlos para usarlos: puede usarlos como si no fueran opcionales en absoluto.

Los opcionales desenvueltos implícitamente se crean agregando un signo de exclamación después del nombre del tipo, de la siguiente manera:

let age: Int! = nil
Dado que se comportan como si ya estuvieran desenrollados, no es necesario if letutilizar guard letelementos opcionales desenrollados de forma implícita. Sin embargo, si intenta utilizarlos y no tienen ningún valor (si es que lo tienen nil), su código falla.

Existen opciones implícitamente desempaquetadas porque, a veces, una variable comienza como nula, pero siempre tendrá un valor antes de que necesites usarla. Como sabes que tendrán un valor cuando las necesites, resulta útil no tener que escribir if lettodo el tiempo.

Dicho esto, si puedes usar opcionales regulares, generalmente es una buena idea.

## Nil coalescing
El operador de fusión nula desenvuelve un elemento opcional y devuelve el valor que contiene, si lo hay. Si no hay ningún valor (si el elemento opcional lo había nil), se utiliza un valor predeterminado en su lugar. De cualquier modo, el resultado no será opcional: será el valor que se encuentra dentro del elemento opcional o el valor predeterminado que se utiliza como respaldo.

Aquí hay una función que acepta un número entero como único parámetro y devuelve una cadena opcional:

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
Si lo llamamos con ID 15 obtendremos un resultado negativo nilporque el usuario no es reconocido, pero con la fusión nula podemos proporcionar un valor predeterminado de “Anónimo” de esta manera:

let user = username(for: 15) ?? "Anonymous"
Esto verificará el resultado que regresa de la username()función: si es una cadena, se desenvolverá y se colocará en user, pero si tiene nildentro, se usará "Anónimo" en su lugar.

## Optional chaining
Swift nos proporciona un atajo al usar opcionales: si desea acceder a algo como a.b.cy bes opcional, puede escribir un signo de interrogación después para habilitar el encadenamiento opcional : a.b?.c.

Cuando se ejecuta ese código, Swift comprobará si btiene un valor y, si lo tiene, nilse ignorará el resto de la línea; Swift retornará nilinmediatamente. Pero si tiene un valor, se desenrollará y la ejecución continuará.

Para probar esto, aquí hay una variedad de nombres:

let names = ["John", "Paul", "George", "Ringo"]
Vamos a utilizar la firstpropiedad de esa matriz, que devolverá el primer nombre si existe o nilsi la matriz está vacía. Luego podemos llamar uppercased()al resultado para convertirlo en una cadena en mayúsculas:

let beatle = names.first?.uppercased()
Ese signo de interrogación es un encadenamiento opcional: si firstretorna nil, Swift no intentará convertirlo a mayúscula y beatlelo establecerá nilinmediatamente.

Hackeando con Swift+
LLEVA TUS HABILIDADES AL SIGUIENTE NIVELSi te gusta Hacking with Swift, te encantará Hacking with Swift+: es mi servicio premium donde puedes aprender Swift y SwiftUI avanzados, programación funcional, algoritmos y más. Además, viene con un montón de beneficios, que incluyen transmisiones en vivo mensuales, proyectos descargables, un 20 % de descuento en todos los libros y más.


¡Patrocina Hacking with Swift y llega a la comunidad Swift más grande del mundo!

Swift derriba las barreras entre las ideas y las aplicaciones, y yo quiero derribar las barreras para aprenderlo. Estoy orgulloso de hacer cientos de tutoriales a los que se puede acceder de forma gratuita, y seguiré haciéndolo pase lo que pase. Pero si esa es una misión que te interesa, por favor, apóyala convirtiéndote en miembro de HWS+. Te traerá muchos beneficios a nivel personal, pero también significa que ayudarás directamente a personas de todo el mundo a aprender Swift al darme la libertad de compartir más de mi conocimiento, pasión y experiencia de forma gratuita. Conviértete en miembro de Hacking with Swift+.
< Anterior: Nil coalescente         Siguiente: Prueba opcional >
¿Te resultó útil esta página? ¡Cuéntanoslo!

Puntuación media: 4,7/5

Gorjeo

Mastodonte

Correo electrónico

Patrocina el sitio

Acerca de             Glosario             Código Licencia             Política de privacidad             Política de reembolso Política             de actualización             Código de conducta

Swift, SwiftUI, el logotipo de Swift, Swift Playgrounds, Xcode, Instruments, Cocoa Touch, Touch ID, AirDrop, iBeacon, iPhone, iPad, Safari, App Store, watchOS, tvOS, Mac y macOS son marcas comerciales de Apple Inc., registradas en los EE. UU. y otros países. Pulp Fiction tiene copyright © 1994 Miramax Films. Hacking with Swift tiene copyright © 2024 Hudson Heavy Industries.

 
Usuario desconocido
No has iniciado sesión

 
Enlace

## Optional try
Cuando hablábamos sobre el lanzamiento de funciones, vimos este código:

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
Esto ejecuta una función de lanzamiento, usando do, tryy catchpara manejar los errores con elegancia.

Hay dos alternativas a try, las cuales tendrán más sentido ahora que comprende los opcionales y el desenrollado forzado.

La primera es try?, y cambia las funciones de lanzamiento por funciones que devuelven un valor opcional. Si la función arroja un error, se enviará nilcomo resultado; de lo contrario, obtendrá el valor de retorno envuelto como un valor opcional.

Usando try?podemos ejecutar checkPassword()así:

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}
La otra alternativa es try!, que puedes usar cuando sabes con seguridad que la función no fallará. Si la función genera un error, tu código fallará.

Usando try!podemos reescribir el código así:

try! checkPassword("sekrit")
print("OK!")

##  Failable initializers
Al hablar sobre el desenrollado forzado, utilicé este código:

let str = "5"
let num = Int(str)
Esto convierte una cadena en un entero, pero como puedes intentar pasar cualquier cadena allí, lo que en realidad obtienes es un entero opcional .

Este es un inicializador que puede fallar : un inicializador que puede funcionar o no. Puede escribirlos en sus propias estructuras y clases utilizando init?()en lugar de init(), y devolverlos nilsi algo sale mal. El valor de retorno será entonces un valor opcional de su tipo, para que pueda desenvolverlo como desee.

Como ejemplo, podríamos codificar una Personestructura que se debe crear utilizando una cadena de identificación de nueve letras. Si se utiliza cualquier otra cadena que no sea de nueve letras, devolveremos nil; de lo contrario, continuaremos de manera normal.

Aquí está eso en Swift:

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

## Typecasting
Swift siempre debe conocer el tipo de cada una de sus variables, pero a veces usted sabe más información que Swift. Por ejemplo, aquí hay tres clases:

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
Podemos crear un par de peces y un par de perros, y ponerlos en una matriz, de esta manera:

let pets = [Fish(), Dog(), Fish(), Dog()]
Swift puede ver ambos Fishy Dogheredar de la Animalclase, por lo que utiliza la inferencia de tipos para crear petsuna matriz de Animal.

Si queremos recorrer la petsmatriz y pedirles a todos los perros que ladren, debemos realizar una conversión de tipos: Swift verificará si cada mascota es un Dogobjeto y, si lo es, podemos llamar a makeNoise().

Esto utiliza una nueva palabra clave llamada as?, que devuelve un opcional: será nilsi la conversión de tipos falló, o un tipo convertido en caso contrario.

Así es como escribimos el bucle en Swift:

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
