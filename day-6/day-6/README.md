## Day 6
### Creating basic closures
Swift nos permite usar funciones como cualquier otro tipo, como cadenas y números enteros. Esto significa que puedes crear una función y asignarla a una variable, llamar a esa función usando esa variable e incluso pasar esa función a otras funciones como parámetros.

Las funciones utilizadas de esta manera se denominan cierres y, aunque funcionan como funciones, se escriben de forma un poco diferente.

Comencemos con un ejemplo sencillo que imprime un mensaje:

let driving = {
    print("I'm driving in my car")
}
Esto crea efectivamente una función sin nombre y asigna esa función a driving. Ahora puedes llamarla driving()como si fuera una función normal, de esta manera:

driving()
### Accepting parameters in a closure
Cuando creas cierres, estos no tienen un nombre ni un espacio para escribir parámetros. Eso no significa que no puedan aceptar parámetros, solo que lo hacen de una manera diferente: se enumeran dentro de las llaves abiertas.

Para hacer que un cierre acepte parámetros, enumérelos dentro de paréntesis justo después de la llave de apertura, luego escriba in de modo que Swift sepa que el cuerpo principal del cierre está comenzando.

Por ejemplo, podríamos crear un cierre que acepte una cadena de nombre de lugar como su único parámetro de esta manera:

let driving = { (place: String) in
    print("I'm going to \(place) in my car")
}
Una de las diferencias entre funciones y cierres es que no se utilizan etiquetas de parámetros al ejecutar cierres. Por lo tanto, para llamar driving()ahora escribiríamos esto:

driving("London")

### Returning values from a closure
Los cierres también pueden devolver valores y se escriben de manera similar a los parámetros: se escriben dentro del cierre, directamente antes de la in palabra clave.

Para demostrarlo, vamos a tomar nuestro driving() cierre y hacer que devuelva su valor en lugar de imprimirlo directamente. Aquí está el original:

let driving = { (place: String) in
    print("I'm going to \(place) in my car")
}
Queremos un cierre que devuelva una cadena en lugar de imprimir el mensaje directamente, por lo que debemos usar -> String before in y then return como una función normal:

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
Ahora podemos ejecutar ese cierre e imprimir su valor de retorno:

let message = drivingWithReturn("London")
print(message)

### Closures as parameters

Dado que los cierres se pueden utilizar al igual que las cadenas y los números enteros, puedes pasarlos a funciones. La sintaxis para esto puede resultar un poco complicada al principio, así que vamos a ir despacio.

Primero, aquí está nuevamente nuestro driving() cierre básico.

let driving = {
    print("I'm driving in my car")
}
Si quisiéramos pasar ese cierre a una función para que se pueda ejecutar dentro de esa función, especificaríamos el tipo de parámetro como () -> Void. Eso significa “no acepta parámetros y devuelve Void”, la forma que tiene Swift de decir “nada”.

Entonces, podemos escribir una travel() función que acepte diferentes tipos de acciones de viaje e imprima un mensaje antes y después:

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
Ahora podemos llamar a esto usando nuestro drivingcierre, de esta manera:

travel(action: driving)

