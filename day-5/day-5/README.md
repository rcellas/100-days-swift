## Functions
Las funciones nos permiten reutilizar código, lo que significa que podemos escribir una función para hacer algo interesante y luego ejecutar esa función desde muchos lugares. Repetir código es generalmente una mala idea y las funciones nos ayudan a evitarlo.

Para empezar, vamos a escribir una función que imprima información de ayuda para los usuarios de nuestra aplicación. Es posible que la necesitemos en cualquier parte de nuestra aplicación, por lo que tenerla como función es una buena idea.

Las funciones Swift comienzan con la func palabra clave, luego el nombre de la función y luego los paréntesis de apertura y cierre. Todo el cuerpo de la función (el código que se debe ejecutar cuando se solicita la función) se coloca entre llaves.

Escribamos la printHelp()función ahora:

func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}
Ahora podemos ejecutarlo usando printHelp() solo:

printHelp()
A la ejecución de una función a menudo se la denomina llamar a una función.

## Accepting parameters
Las funciones se vuelven más poderosas cuando se pueden personalizar cada vez que se ejecutan. Swift le permite enviar valores a una función que luego se pueden usar dentro de la función para cambiar la forma en que se comporta. Ya hemos usado esto: hemos estado enviando cadenas y números enteros a la print()función, de esta manera:

print("Hello, world!")
Los valores enviados a las funciones de esta manera se denominan parámetros .

Para que tus propias funciones acepten parámetros, dale un nombre a cada parámetro, luego dos puntos y luego dile a Swift el tipo de datos que debe contener. Todo esto va dentro de los paréntesis después del nombre de tu función.

Por ejemplo, podemos escribir una función para imprimir el cuadrado de cualquier número:

func square(number: Int) {
    print(number * number)
}
Esto le indica a Swift que esperamos recibir un Int, y que se lo debe llamar number. Este nombre se usa tanto dentro de la función cuando se desea hacer referencia al parámetro, como también cuando se ejecuta la función, de esta manera:

square(number: 8)

## Returning values
Además de recibir datos, las funciones también pueden devolverlos. Para ello, escriba un guion y luego un corchete angular derecho después de la lista de parámetros de la función y luego indique a Swift qué tipo de datos se devolverán.

Dentro de la función, se utiliza la returnpalabra clave para enviar un valor de vuelta, si es que hay uno. La función sale inmediatamente y envía ese valor de vuelta; no se ejecutará ningún otro código de esa función.

Podríamos reescribir nuestra square()función para devolver un valor en lugar de imprimirlo directamente:

func square(number: Int) -> Int {
    return number * number
}
Ahora podemos tomar ese valor de retorno cuando se ejecuta la función e imprimirlo allí:

let result = square(number: 8)
print(result)
Si necesita devolver múltiples valores, este es un ejemplo perfecto de cuándo usar tuplas.

## Parameter labels
Escribimos nuestra square()función así:

func square(number: Int) -> Int {
    return number * number
}
Esto nombra su parámetro number, por lo que podemos usarlo numberdentro de la función para referirnos a él, pero también debemos usar el nombre al ejecutar la función, de esta manera:

let result = square(number: 8)
Swift nos permite proporcionar dos nombres para cada parámetro: uno que se utilizará externamente al llamar a la función y otro que se utilizará internamente dentro de la función. Esto es tan sencillo como escribir dos nombres separados por un espacio.

Para demostrar esto, aquí hay una función que usa dos nombres para su parámetro de cadena:

func sayHello(to name: String) {
    print("Hello, \(name)!")
}
El parámetro se llama to name, lo que significa que externamente se llama to, pero internamente se llama name. Esto le da a las variables un nombre sensato dentro de la función, pero significa que al llamar a la función se lee de manera natural:

sayHello(to: "Taylor")


## Omitting parameter labels
Es posible que hayas notado que en realidad no enviamos ningún nombre de parámetro cuando llamamos print(); decimos print("Hello")en lugar de print(message: "Hello").

Puede obtener este mismo comportamiento en sus propias funciones utilizando un guión bajo, _, para el nombre de su parámetro externo, de esta manera:

func greet(_ person: String) {
    print("Hello, \(person)!")
}
Ahora puedes llamar greet()sin tener que usar el personnombre del parámetro:

greet("Taylor")
Esto puede hacer que algunos códigos sean más fáciles de leer, pero generalmente es mejor darles a los parámetros nombres externos para evitar confusiones. Por ejemplo, si digo que setAlarm(5)es difícil saber qué significa eso, ¿establece una alarma para las cinco en punto, establece una alarma para dentro de cinco horas o activa la alarma preconfigurada número 5?

## Default parameters
La print()función imprime algo en la pantalla, pero siempre agrega una nueva línea al final de lo que imprimió, de modo que las llamadas múltiples print()no aparecen todas en la misma línea.

Si lo desea, puede cambiar ese comportamiento para poder usar espacios en lugar de saltos de línea. Sin embargo, la mayoría de las veces, la gente quiere líneas nuevas, por lo que print()tiene un terminatorparámetro que usa la nueva línea como valor predeterminado.

Puedes darle a tus propios parámetros un valor predeterminado simplemente escribiendo un =después de su tipo seguido del valor predeterminado que deseas darle. Por lo tanto, podríamos escribir una greet()función que pueda imprimir saludos agradables de manera opcional:

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
Esto se puede llamar de dos maneras:

greet("Taylor")
greet("Taylor", nicely: false)


## Variadic functions
Algunas funciones son variádicas , lo que es una forma elegante de decir que aceptan cualquier cantidad de parámetros del mismo tipo. La print()función es, en realidad, variádica: si pasas muchos parámetros, todos se imprimen en una línea con espacios entre ellos:

print("Haters", "gonna", "hate")
Puedes hacer que cualquier parámetro sea variádico escribiéndolo ...después de su tipo. Por lo tanto, un Intparámetro es un solo número entero, mientras que Int...es cero o más números enteros, potencialmente cientos.

Dentro de la función, Swift convierte los valores que se pasaron en una matriz de números enteros, de modo que pueda recorrerlos según sea necesario.

Para probar esto, escribamos una square()función que pueda elevar al cuadrado muchos números:

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
Ahora podemos ejecutar esto con muchos números simplemente pasándolos separados por comas:

square(numbers: 1, 2, 3, 4, 5)

## Writing throwing functions
A veces, las funciones fallan porque tienen una entrada incorrecta o porque algo salió mal internamente. Swift nos permite arrojar errores desde las funciones marcándolas como throws antes de su tipo de retorno y luego usar la throw palabra clave cuando algo sale mal.

Primero, debemos definir una función enumque describa los errores que podemos generar. Estos siempre deben basarse en el Errortipo existente de Swift. Vamos a escribir una función que verifique si una contraseña es correcta, por lo que generaremos un error si el usuario intenta una contraseña obvia:

enum PasswordError: Error {
    case obvious
}
Ahora escribiremos una checkPassword()función que arrojará ese error si algo sale mal. Esto significa usar la throwspalabra clave antes del valor de retorno de la función y luego usar throw PasswordError.obvioussi su contraseña es "contraseña".

Aquí está eso en Swift:

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

## Running throwing functions
A Swift no le gusta que se produzcan errores cuando se ejecuta su programa, lo que significa que no le permitirá ejecutar una función que genere errores por accidente.

En lugar de ello, debe llamar a estas funciones utilizando tres nuevas palabras clave: do inicia una sección de código que podría causar problemas, try se utiliza antes de cada función que podría generar un error y catch le permite manejar los errores con elegancia.

Si se produce algún error dentro del do bloque, la ejecución salta inmediatamente al catch bloque. Probemos a llamar checkPassword()con un parámetro que genere un error:

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
Cuando se ejecuta ese código, se imprime “No puedes usar esa contraseña”, pero no “Esa contraseña es buena”: nunca se alcanzará ese código porque se genera el error.

## Inout parameters
Todos los parámetros que se pasan a una función Swift son constantes , por lo que no se pueden cambiar. Si lo desea, puede pasar uno o más parámetros como inout, lo que significa que se pueden cambiar dentro de la función y esos cambios se reflejan en el valor original fuera de la función.

Por ejemplo, si desea duplicar un número en el lugar (es decir, cambiar el valor directamente en lugar de devolver uno nuevo), puede escribir una función como esta:

func doubleInPlace(number: inout Int) {
    number *= 2
}
Para utilizarlo, primero debes crear un entero variable (no puedes usar enteros constantes con inout, porque pueden cambiar). También debes pasar el parámetro a doubleInPlace usando un ampersand, &, antes de su nombre, lo que es un reconocimiento explícito de que sabes que se está usando como inout.

En código, escribirías esto:

var myNum = 10 
doubleInPlace(number: &myNum)


