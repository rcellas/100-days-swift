## Arrays
Las matrices son conjuntos de valores que se almacenan como un único valor. Por ejemplo, John, Paul, George y Ringo son nombres, pero las matrices permiten agruparlos en un único valor llamado The Beatles.

En código, escribimos esto:

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
Esa última línea forma la matriz: comienza y termina con corchetes, y cada elemento de la matriz está separado por una coma.

Puedes leer valores de una matriz escribiendo un número dentro de corchetes. Las posiciones de la matriz cuentan desde 0, por lo que si quieres leer “Paul McCartney”, deberás escribir esto:

beatles[1]
Tenga cuidado: Swift se bloquea si lee un elemento que no existe. Por ejemplo, intentar leer beatles[9]es una mala idea.

Nota: Si está utilizando anotaciones de tipo, las matrices se escriben entre corchetes: [String], [Int], [Double]y [Bool].


##Sets

Los conjuntos son colecciones de valores al igual que las matrices, excepto que tienen dos diferencias:

Los elementos no se almacenan en ningún orden, sino en lo que es efectivamente un orden aleatorio.
Ningún artículo puede aparecer dos veces en un conjunto; todos los artículos deben ser únicos.
Puedes crear conjuntos directamente a partir de matrices, de esta manera:

let colors = Set(["red", "green", "blue"])
Cuando miras el valor colors dentro de la salida del área de juegos, verás que no coincide con el orden que usamos para crearlo. En realidad, no es un orden aleatorio , solo que no está ordenado . Swift no ofrece garantías sobre su orden. Debido a que no están ordenados, no puedes leer valores de un conjunto usando posiciones numéricas como puedes hacerlo con matrices.

Si intentas insertar un elemento duplicado en un conjunto, los duplicados se ignoran. Por ejemplo:

let colors2 = Set(["red", "green", "blue", "red", "blue"])
El conjunto final colors2 solo incluirá rojo, verde y azul una vez.

## Tuples
Las tuplas permiten almacenar varios valores juntos en un único valor. Puede parecer algo similar a las matrices, pero las tuplas son diferentes:

No puedes agregar ni eliminar elementos de una tupla; tienen un tamaño fijo.
No puedes cambiar el tipo de elementos en una tupla; siempre tienen los mismos tipos con los que fueron creados.
Puede acceder a los elementos de una tupla usando posiciones numéricas o nombrándolos, pero Swift no le permitirá leer números o nombres que no existen.
Las tuplas se crean colocando varios elementos entre paréntesis, de la siguiente manera:

var name = (first: "Taylor", last: "Swift")
A continuación, puede acceder a los elementos utilizando posiciones numéricas a partir de 0:

name.0
O puedes acceder a los elementos utilizando sus nombres:

name.first
Recuerda que puedes cambiar los valores dentro de una tupla después de crearla, pero no los tipos de valores. Por lo tanto, si intentaras cambiarlos name, (first: "Justin", age: 25)obtendrías un error.


## Arrays vs sets vs tuples
Las matrices, los conjuntos y las tuplas pueden parecer similares a primera vista, pero tienen usos distintos. Para ayudarte a saber cuál usar, aquí tienes algunas reglas.

Si necesita una colección específica y fija de valores relacionados donde cada elemento tenga una posición o nombre preciso, debe utilizar una tupla:

let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
Si necesita una colección de valores que deben ser únicos o necesita poder verificar extremadamente rápido si un elemento específico está allí, debe usar un conjunto:

let set = Set(["aardvark", "astronaut", "azalea"])
Si necesita una colección de valores que puedan contener duplicados, o si el orden de los elementos es importante, debe utilizar una matriz:

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
Las matrices son, con diferencia, los tipos más comunes de los tres.


## Dictionaries
Los diccionarios son colecciones de valores, al igual que las matrices, pero en lugar de almacenar cosas con una posición entera, puedes acceder a ellas utilizando cualquier cosa que desees.

La forma más común de almacenar datos de diccionarios es mediante cadenas. Por ejemplo, podríamos crear un diccionario que almacene la altura de los cantantes a partir de su nombre:

let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
Al igual que las matrices, los diccionarios comienzan y terminan con corchetes y cada elemento se separa con una coma. Sin embargo, también usamos dos puntos para separar el valor que desea almacenar (por ejemplo, 1,78) del identificador con el que desea almacenarlo (por ejemplo, “Taylor Swift”).

Estos identificadores se denominan claves y puedes usarlos para leer datos del diccionario:

heights["Taylor Swift"]
Nota: Al utilizar anotaciones de tipo, los diccionarios se escriben entre corchetes con dos puntos entre el identificador y los tipos de valor. Por ejemplo, [String: Double]y [String: String].

## Dictionary default values
Si intentas leer un valor de un diccionario utilizando una clave que no existe, Swift te devolverá el resultado nil: nada en absoluto. Si bien esto puede ser lo que quieres, existe una alternativa: podemos proporcionar al diccionario un valor predeterminado para utilizar si solicitamos una clave faltante.

Para demostrarlo, creemos un diccionario de helados favoritos para dos personas:

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
Podemos leer el helado favorito de Paul así:

favoriteIceCream["Paul"]
Pero si intentáramos leer el helado favorito de Charlotte, obtendríamos cero, lo que significa que Swift no tiene un valor para esa clave:

favoriteIceCream["Charlotte"]
Podemos solucionar esto dándole al diccionario un valor predeterminado de “Desconocido”, de modo que cuando no se encuentre ningún helado para Charlotte, obtengamos “Desconocido” en lugar de nulo:

favoriteIceCream["Charlotte", default: "Unknown"]

## Creating empty collections
Las matrices, conjuntos y diccionarios se denominan colecciones porque recopilan valores en un solo lugar.

Si desea crear una colección vacía , simplemente escriba su tipo seguido de paréntesis de apertura y cierre. Por ejemplo, podemos crear un diccionario vacío con cadenas para claves y valores como este:

var teams = [String: String]()
Luego podremos añadir entradas más adelante, de esta manera:

teams["Paul"] = "Red"
De manera similar, puedes crear una matriz vacía para almacenar números enteros como este:

var results = [Int]()
La excepción es la creación de un conjunto vacío, que se hace de manera diferente:

var words = Set<String>()
var numbers = Set<Int>()
Esto se debe a que Swift tiene una sintaxis especial solo para diccionarios y matrices; otros tipos deben usar la sintaxis de corchetes angulares como los conjuntos.

Si quisiera, podría crear matrices y diccionarios con una sintaxis similar:

var scores = Dictionary<String, Int>()
var results = Array<Int>()

## Enumerations
Las enumeraciones, generalmente llamadas simplemente enums , son una forma de definir grupos de valores relacionados de manera tal que sean más fáciles de usar.

Por ejemplo, si quisieras escribir algún código para representar el éxito o el fracaso de algún trabajo que estás realizando, podrías representarlo como cadenas:

let result = "failure"
¿Pero qué pasa si alguien utiliza un nombre diferente por accidente?

let result2 = "failed"
let result3 = "fail"
Esas tres son cadenas diferentes, por lo que significan cosas diferentes.

Con enumeraciones podemos definir un Resulttipo que puede ser successo failure, de esta manera:

enum Result {
    case success
    case failure
}
Y ahora cuando lo usemos debemos elegir uno de esos dos valores:

let result4 = Result.failure
Esto evita que utilices accidentalmente cadenas diferentes cada vez.

## Enum associated values
Además de almacenar un valor simple, las enumeraciones también pueden almacenar valores asociados a cada caso. Esto le permite adjuntar información adicional a sus enumeraciones para que puedan representar datos más matizados.

Por ejemplo, podríamos definir una enumeración que almacene varios tipos de actividades:

enum Activity {
    case bored
    case running
    case talking
    case singing
}
Eso nos permite decir que alguien está hablando, pero no sabemos de qué está hablando , o podemos saber que alguien está corriendo, pero no sabemos hacia dónde está corriendo .

Los valores asociados a la enumeración nos permiten agregar esos detalles adicionales:

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
Ahora podemos ser más precisos: podemos decir que alguien está hablando de fútbol:

let talking = Activity.talking(topic: "football")

## Enum raw values
A veces, es necesario poder asignar valores a las enumeraciones para que tengan significado. Esto permite crearlas de forma dinámica y también utilizarlas de distintas maneras.

Por ejemplo, puede crear una Planet enumeración que almacene valores enteros para cada uno de sus casos:

enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}
Swift asignará automáticamente a cada uno de ellos un número que comience desde 0, y usted puede usar ese número para crear una instancia del caso de enumeración apropiado. Por ejemplo, earthse le asignará el número 2, por lo que puede escribir esto:

let earth = Planet(rawValue: 2)
Si lo desea, puede asignar a uno o más casos un valor específico y Swift generará el resto. No nos resulta muy natural pensar en la Tierra como el segundo planeta, por lo que podría escribir esto:

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
Ahora Swift asignará 1 mercury y contará hacia arriba desde allí, lo que significa que earthahora es el tercer planeta.
