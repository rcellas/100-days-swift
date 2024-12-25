## For Loops
Swift tiene algunas formas de escribir bucles, pero su mecanismo subyacente es el mismo: ejecutar un código repetidamente hasta que una condición se evalúe como falsa.

El bucle más común en Swift es un forbucle: recorrerá matrices y rangos, y cada vez que el bucle dé una vuelta, extraerá un elemento y lo asignará a una constante.

Por ejemplo, aquí hay un rango de números:

let count = 1...10
Podemos usar un forbucle para imprimir cada elemento de esta manera:

for number in count {
    print("Number is \(number)")
}
Podemos hacer lo mismo con las matrices:

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}
Si no usa la constante que forle proporcionan los bucles, debe utilizar un guión bajo en su lugar para que Swift no cree valores innecesarios:

print("Players gonna ")

for _ in 1...5 {
    print("play")
}

##  While Loops
Una segunda forma de escribir bucles es usando while: dale una condición para verificar, y su código de bucle girará una y otra vez hasta que la condición falle.

Por ejemplo, podríamos usar un whilebucle para simular a un niño contando en un juego de escondidas: empezamos en uno, contamos hasta 20 inclusive mientras imprimimos cada número, luego después del bucle imprimimos "Listo o no".

Así es como se ve en Swift:

var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")


## Repeat loops
La tercera forma de escribir bucles no se usa comúnmente, pero es tan simple de aprender que podríamos cubrirla: se llama bucle repeaty es idéntica a un whilebucle excepto que la condición a verificar viene al final.

Entonces, podríamos reescribir nuestro ejemplo del escondite de esta manera:

var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")
Debido a que la condición viene al final del repeatbucle, el código dentro del bucle siempre se ejecutará al menos una vez, mientras que whilelos bucles verifican su condición antes de su primera ejecución.

Por ejemplo, esta print()función nunca se ejecutará, porque falsesiempre es falsa:

while false {
    print("This is false")
}
Xcode incluso nos advertirá que la print()línea nunca se ejecutará.

Por otro lado, esta print()función se ejecutará una vez, porque repeatsolo falla la condición después de que se ejecuta el bucle:

repeat {
    print("This is false")
} while false

## Exiting loops
Puedes salir de un bucle en cualquier momento utilizando la break palabra clave. Para probar esto, comencemos con un while bucle normal que realiza una cuenta regresiva para el lanzamiento de un cohete:

var countDown = 10

while countDown >= 0 {
    print(countDown)
    countDown -= 1
}

print("Blast off!")
En este caso, el astronauta al mando se aburre a mitad de la cuenta regresiva y decide saltarse el resto y lanzarse directamente:

while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}
Con ese cambio, tan pronto como countDown llegue a 4 se imprimirá el mensaje del astronauta y se omitirá el resto del bucle.

## Exiting multiple loops
Si colocas un bucle dentro de un bucle, se llama bucle anidado , y no es raro querer salir tanto del bucle interno como del bucle externo al mismo tiempo.

A modo de ejemplo, podríamos escribir un código para calcular las tablas de multiplicar del 1 al 10 de la siguiente manera:

for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
    }
}
Si queremos salir a mitad de camino, debemos hacer dos cosas. Primero, le damos una etiqueta al bucle externo, como esta:

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
    }
}
En segundo lugar, agregamos nuestra condición dentro del bucle interno y luego usamos break outerLooppara salir de ambos bucles al mismo tiempo:

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}
Con un break, solo se saldría del bucle interno; el bucle externo continuaría donde lo dejó.

##Skipping items
Como has visto, la break palabra clave sale de un bucle. Pero si solo quieres omitir el elemento actual y continuar con el siguiente, debes usar continue en su lugar.

Para probar esto, podemos escribir un bucle del 1 al 10 y luego usar el operador de resto de Swift para omitir cualquier número que sea impar:

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}
Recuerda, el operador de resto calcula cuántas veces cabe 2 en cada número de nuestro bucle y luego devuelve lo que sobra. Por lo tanto, si sobra 1, significa que el número es impar, por lo que podemos usar continue para omitirlo.

## Infinite loops
Es habitual utilizar while bucles para crear bucles infinitos : bucles que no tienen fin o que solo terminan cuando estás listo. Todas las aplicaciones de tu iPhone utilizan bucles infinitos, porque comienzan a ejecutarse y luego observan continuamente los eventos hasta que decides salir de ellas.

Para crear un bucle infinito, solo tienes que usar truecomo condición true que siempre sea verdadera, por lo que el bucle se repetirá para siempre. Advertencia: asegúrate de tener una comprobación que salga del bucle, de lo contrario, nunca terminará.

Como ejemplo, vamos a utilizar while truepara imprimir la música de la pieza 4'33” de John Cage – por si no lo sabías es famosa porque son 4 minutos y 33 segundos de completo silencio.

Podemos escribir la “música” para esta pieza usando while true, con una condición que salga del bucle cuando hayamos dado suficientes vueltas:

var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}
