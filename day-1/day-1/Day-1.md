## Variables

Cuando inicies Xcode, te preguntará qué deseas hacer y me gustaría que elijas “Comenzar con un Playground”: este es un espacio aislado donde puedes escribir código Swift y ver resultados inmediatos.

El valor predeterminado es un área de juegos en blanco para iOS, lo cual está bien, así que haga clic en Siguiente y luego en Crear para guardarlo en su escritorio.

En este vídeo quiero presentarles las variables, que son lugares donde se pueden almacenar datos del programa. Se llaman variables porque pueden variar : se pueden cambiar sus valores libremente.

Los patios de juegos comienzan con una línea de código que crea una variable para nosotros:

var str = "Hello, playground"
Esto crea una nueva variable llamada str, a la que se le asigna el valor “Hola, zona de juegos”. A la derecha de la zona de juegos, puedes ver “Hola, zona de juegos” en el área de salida; Xcode nos muestra que se estableció el valor.

Como str es una variable podemos cambiarla:

str = "Goodbye"
No necesitamos varla segunda vez porque la variable ya ha sido creada; sólo la estamos cambiando.

## Strings y  integers
Swift es lo que se conoce como un lenguaje de tipo seguro, lo que significa que cada variable debe ser de un tipo específico. La str variable que Xcode creó para nosotros contiene una cadena de letras que forman la palabra "Hola, patio de juegos", por lo que Swift le asigna el tipo String.

Por otro lado, si queremos almacenar la edad de alguien podríamos crear una variable como esta:

var age = 38
Esto contiene un número entero, por lo que Swift asigna el tipo Int(abreviatura de “entero”).

Si tiene números grandes, Swift le permite usar guiones bajos como separadores de miles: no cambian el número, pero sí lo hacen más fácil de leer. Por ejemplo:

var population = 8_000_000
Las cadenas y los números enteros son tipos diferentes y no se pueden mezclar. Por lo tanto, si bien es seguro cambiar str  a "Adiós", no puedo convertirlo en 38 porque Intno es un String.

##Multi-line string
Las cadenas Swift estándar usan comillas dobles, pero no se pueden incluir saltos de línea en ellas.

Si desea cadenas de varias líneas, necesitará una sintaxis ligeramente diferente: comenzar y terminar con tres comillas dobles, como esto:

var str1 = """
This goes
over multiple
lines
"""
Swift es muy particular en cuanto a cómo se escriben esas comillas: los triples de apertura y cierre deben estar en su propia línea, pero los saltos de línea de apertura y cierre no se incluirán en la cadena final.

Si solo desea cadenas de varias líneas para formatear su código de manera ordenada y no desea que esos saltos de línea estén realmente en su cadena, finalice cada línea con un \, de esta manera:

var str2 = """
This goes \
over multiple \
lines
"""
## Doubles and booleans
Otros dos tipos básicos de datos en Swift son los dobles y los booleanos, y los usarás mucho.

“Doble” es la abreviatura de “número de punto flotante de doble precisión” y es una forma elegante de decir que contiene valores fraccionarios como 38,1 o 3,141592654.

Siempre que creas una variable con un número fraccionario, Swift le asigna automáticamente el tipo a esa variable Double. Por ejemplo:

var pi = 3.141
Los números dobles son diferentes de los números enteros y no se pueden mezclar por accidente.

En cuanto a los valores booleanos, son mucho más simples: simplemente contienen verdadero o falso, y Swift asignará automáticamente el tipo booleano a cualquier variable a la que se le asigne verdadero o falso como su valor.

Por ejemplo:

var awesome = true

## String Interpolation
Has visto cómo puedes escribir valores para cadenas directamente en tu código, pero Swift también tiene una característica llamada interpolación de cadenas: la capacidad de colocar variables dentro de tus cadenas para hacerlas más útiles.

Puedes colocar cualquier tipo de variable dentro de tu cadena: todo lo que tienes que hacer es escribir una barra invertida, \, seguida del nombre de tu variable entre paréntesis. Por ejemplo:

var score = 85
var str = "Your score was \(score)"
Como puedes ver en la salida del patio de juegos, eso establece la strvariable como "Tu puntuación fue 85".

Puedes hacer esto tantas veces como necesites, haciendo cuerdas con cuerdas si lo deseas:

var results = "The test results are here: \(str)"
Como verás más adelante, la interpolación de cadenas no se limita solo a colocar variables: en realidad puedes ejecutar código dentro de ellas.

## Contants

Ya he dicho que las variables tienen ese nombre porque sus valores pueden cambiar con el tiempo, y eso suele ser útil. Sin embargo, muy a menudo se desea establecer un valor una sola vez y no cambiarlo nunca, por lo que tenemos una alternativa a la varpalabra clave llamada let.

La letpalabra clave crea constantes , que son valores que se pueden configurar una vez y nunca más. Por ejemplo:

let taylor = "swift"
Si intentas cambiar eso, Xcode se negará a ejecutar tu código. Es una forma de seguridad: cuando usas constantes, ya no puedes cambiar algo por accidente.

Cuando escribas tu propio código Swift, siempre debes usar " leta menos que quieras cambiar específicamente un valor". De hecho, Xcode te advertirá si usas var"entonces no cambies la variable".

##Type annotations

Swift asigna a cada variable y constante un tipo en función del valor que se le asigna cuando se crea. Por lo tanto, cuando escribes código como este, Swift puede ver que contiene una cadena:

let str = "Hello, playground"
Esto creará str una cadena, por lo que no podrá intentar asignarle un entero o un valor booleano más adelante. Esto se llama inferencia de tipos : Swift puede inferir el tipo de algo en función de cómo lo creó.

Si lo desea, puede ser explícito acerca del tipo de sus datos en lugar de confiar en la inferencia de tipos de Swift, de esta manera:

let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true

Tenga en cuenta que los valores booleanos tienen el nombre de tipo corto Bool, de la misma manera que los números enteros tienen el nombre de tipo corto Int.
