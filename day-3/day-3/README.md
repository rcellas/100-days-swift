##  Operadores aritmeticos
Ahora que ya conoces todos los tipos básicos de Swift, podemos empezar a combinarlos mediante operadores. Los operadores son esos pequeños símbolos matemáticos como +y -, y Swift tiene una amplia gama de ellos.

Aquí hay un par de variables de prueba con las que podemos trabajar:

let firstScore = 12
let secondScore = 4
Podemos sumar y restar usando +y -:

let total = firstScore + secondScore
let difference = firstScore - secondScore
Y podemos multiplicar y dividir usando *y /:

let product = firstScore * secondScore
let divided = firstScore / secondScore
Swift tiene un operador especial para calcular los restos después de una división: %. Calcula cuántas veces cabe un número dentro de otro y luego devuelve el valor que sobra.

Por ejemplo, lo establecemos secondScoreen 4, entonces si decimos 13 % secondScoreque obtendremos uno, porque 4 cabe en 13 tres veces con resto uno:

let remainder = 13 % secondScore

## Operator overloading
Swift admite la sobrecarga de operadores, que es una forma elegante de decir que lo que hace un operador depende de los valores con los que lo uses. Por ejemplo, +suma números enteros de esta manera:

let meaningOfLife = 42
let doubleMeaning = 42 + 42
Pero +también une cadenas, como esto:

let fakers = "Fakers gonna "
let action = fakers + "fake"
Incluso puedes usarlo +para unir matrices, de esta manera:

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf
Recuerda que Swift es un lenguaje de tipos seguros, lo que significa que no te permitirá mezclar tipos. Por ejemplo, no puedes agregar un número entero a una cadena porque no tiene sentido.

## Compound assigment operators
Swift tiene operadores abreviados que combinan un operador con una asignación, de modo que puedes cambiar una variable en el lugar. Estos se parecen a los operadores existentes que conoces –  +, -, *y /, pero tienen un =al final porque asignan el resultado a la variable que estabas usando.

Por ejemplo, si alguien obtuvo 95 puntos en un examen pero necesita una penalización de 5 puntos, podría escribir esto:

var score = 95
score -= 5
De manera similar, puedes agregar una cadena a otra usando +=:

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"


## Operadores de comparación
Swift tiene varios operadores que realizan comparaciones y funcionan más o menos como se esperaría en matemáticas.

Comencemos con un par de variables de ejemplo para que tengamos algo con qué trabajar:

let firstScore = 6
let secondScore = 4
Hay dos operadores que comprueban la igualdad: ==comprueba que dos valores sean iguales y !=(se pronuncia “no igual”) comprueba que dos valores no sean iguales:

firstScore == secondScore
firstScore != secondScore
Existen cuatro operadores para comparar si un valor es mayor, menor o igual que otro. Son iguales que en matemáticas:

firstScore < secondScore
firstScore >= secondScore
Cada uno de estos también funciona con cadenas, porque las cadenas tienen un orden alfabético natural:

"Taylor" <= "Swift"

## Conditions
Ahora que conoce algunos operadores, puede escribir condiciones mediante ifinstrucciones. Le da a Swift una condición y, si esa condición es verdadera, ejecutará el código que elija.

Para probar esto, quiero usar una función Swift llamada print(): la ejecutas con algún texto y se imprimirá.

Podemos utilizar condiciones para comprobar si tenemos una mano ganadora en Blackjack:

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
}
El código entre llaves –  {y }– se ejecutará si la condición es verdadera. Si lo desea, puede proporcionar un código alternativo para ejecutar si la condición es falsa , utilizando else:

if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}
También puedes encadenar condiciones usando else if:

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

## Combining conditions
Swift tiene dos operadores especiales que nos permiten combinar condiciones entre sí: son &&(se pronuncia “y”) y ||(se pronuncia “o”).

Por ejemplo, podríamos comprobar que la edad de dos personas es superior a un valor determinado de la siguiente manera:

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}
Esa print()llamada solo se realizará si ambas edades son mayores de 18 años, lo cual no es el caso. De hecho, Swift ni siquiera se molestará en verificar el valor de age2 porque puede ver que age1 ya falló la prueba.

La alternativa a &&  es ||, que se evalúa como verdadera si cualquiera de los elementos pasa la prueba. Por ejemplo, podríamos imprimir un mensaje si cualquiera de los elementos tiene más de 18 años:

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}
Puedes usar && and || más de una vez en una sola condición, pero no compliques demasiado las cosas porque puede resultar difícil de leer.

## The ternary operator
Swift tiene un operador que rara vez se utiliza, llamado operador ternario. Funciona con tres valores a la vez, de ahí su nombre: comprueba una condición especificada en el primer valor y, si es verdadera, devuelve el segundo valor; pero, si es falsa, devuelve el tercer valor.

El operador ternario es una condición más bloques de verdadero o falso, todo en uno, separados por un signo de interrogación y dos puntos, lo que dificulta bastante su lectura. A continuación se muestra un ejemplo:

let firstCard = 11
let secondCard = 10
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")
Esto comprueba si las dos cartas son iguales y luego imprime “Las cartas son iguales” si la condición es verdadera o “Las cartas son diferentes” si es falsa. Podríamos escribir el mismo código usando una condición regular:

if firstCard == secondCard {
    print("Cards are the same")
} else {
    print("Cards are different")
}

## Switch statements
Si tiene varias condiciones que utilizan ify else if, suele ser más claro utilizar un constructo diferente conocido como switch case. Con este enfoque, escribe su condición una vez y luego enumera todos los resultados posibles y lo que debería suceder para cada uno de ellos.

Para probar esto, aquí hay una constante meteorológica que contiene la cadena sunny:

let weather = "sunny"
Podemos usar un switchbloque para imprimir uno de cuatro mensajes diferentes:

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}
En ese ejemplo, el último caso – default– es obligatorio porque Swift se asegura de cubrir todos los casos posibles para que no se pase por alto ninguna eventualidad. Si el clima no es lluvioso, nieva o hace sol, defaultse ejecutará el caso.

Swift solo ejecutará el código dentro de cada caso. Si desea que la ejecución continúe en el siguiente caso, utilice la fallthroughpalabra clave de la siguiente manera:

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}

## Range operators
Swift nos ofrece dos formas de crear rangos: los operadores ..<y .... El operador de rango semiabierto, ..<, crea rangos hasta el valor final, pero sin incluirlo, y el operador de rango cerrado, , ...crea rangos hasta el valor final, incluido .

Por ejemplo, el rango 1..<5contiene los números 1, 2, 3 y 4, mientras que el rango 1...5contiene los números 1, 2, 3, 4 y 5.

Los rangos son útiles con switch los bloques, porque puedes usarlos para cada uno de tus casos. Por ejemplo, si alguien rindió un examen, podríamos imprimir diferentes mensajes según su puntaje:

let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
Como antes, el default caso debe estar allí para garantizar que se cubran todos los valores posibles.

