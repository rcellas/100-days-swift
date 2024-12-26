# Day 7
##Basics
### Using closures as parameters when they accept parameters
Aquí es donde los cierres pueden empezar a leerse un poco como ruido de línea: un cierre que pasa a una función también puede aceptar sus propios parámetros.

Hemos estado usando () -> Void"no acepta parámetros y no devuelve nada", pero puedes continuar y completarlo ()con los tipos de parámetros que tu cierre debería aceptar.

Para demostrar esto, podemos escribir una travel()función que acepte un cierre como su único parámetro, y ese cierre a su vez acepta una cadena:

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}
Ahora, cuando llamamos travel()usando la sintaxis de cierre final, nuestro código de cierre debe aceptar una cadena:

travel { (place: String) in
    print("I'm going to \(place) in my car")
}


### Using closures as parameters when they return values
Hemos estado usando () -> Void"no acepta parámetros y no devuelve nada", pero puedes reemplazarlo Voidcon cualquier tipo de datos para forzar el cierre a devolver un valor.

Para demostrar esto, podemos escribir una travel()función que acepte un cierre como su único parámetro, y ese cierre a su vez acepta una cadena y devuelve una cadena:

func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
Ahora, cuando llamamos travel()usando la sintaxis de cierre final, nuestro código de cierre debe aceptar una cadena y devolver una cadena:

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

### Shorthand parameter names
Acabamos de crear una travel()función. Acepta un parámetro, que es un cierre que a su vez acepta un parámetro y devuelve una cadena. Ese cierre se ejecuta entre dos llamadas a print().

Aquí está en código:

func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
Podemos llamar travel()usando algo como esto:

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
Sin embargo, Swift sabe que el parámetro de ese cierre debe ser una cadena, por lo que podemos eliminarlo:

travel { place -> String in
    return "I'm going to \(place) in my car"
}
También sabe que el cierre debe devolver una cadena, por lo que podemos eliminarlo:

travel { place in
    return "I'm going to \(place) in my car"
}
Como el cierre solo tiene una línea de código que debe ser la que devuelva el valor, Swift nos permite eliminar returntambién la palabra clave:

travel { place in
    "I'm going to \(place) in my car"
}
Swift tiene una sintaxis abreviada que permite abreviar aún más. En lugar de escribir, place inpodemos dejar que Swift proporcione nombres automáticos para los parámetros del cierre. Estos se nombran con un signo de dólar y luego con un número que comienza en 0.

travel {
    "I'm going to \($0) in my car"
}

## Advanced
### Closures with multiples parameters
Solo para asegurarnos de que todo esté claro, vamos a escribir otro ejemplo de cierre utilizando dos parámetros.

Esta vez, nuestra travel()función requerirá un cierre que especifique a dónde se dirige alguien y a qué velocidad. Esto significa que debemos usar (String, Int) -> Stringpara el tipo del parámetro:

func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
Vamos a llamarlo usando un cierre final y nombres de parámetros de cierre abreviados. Debido a que esto acepta dos parámetros, obtendremos ambos $0y $1:

travel {
    "I'm going to \($0) at \($1) miles per hour."
}
Algunas personas prefieren no usar nombres de parámetros abreviados $0porque puede resultar confuso, y eso está bien: haz lo que funcione mejor para ti.

### Returning closures from functions
De la misma manera que puedes pasar un cierre a una función, también puedes obtener cierres devueltos por una función.

La sintaxis para esto es un poco confusa al principio, porque se usa ->dos veces: una para especificar el valor de retorno de su función y una segunda para especificar el valor de retorno de su cierre.

Para probar esto, vamos a escribir una travel()función que no acepte parámetros, pero que devuelva un cierre. El cierre que se devuelva debe llamarse con una cadena y no devolverá nada.

Así es como se ve en Swift:

func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
Ahora podemos llamar travel()para recuperar ese cierre y luego llamarlo como una función:

let result = travel()
result("London")
Es técnicamente permisible (aunque realmente no recomendable) llamar al valor de retorno travel()directamente desde:

let result2 = travel()("London")

### Capturing values
Si utiliza valores externos dentro de su cierre, Swift los captura y los almacena junto con el cierre para que puedan modificarse incluso si ya no existen.

En este momento tenemos una travel()función que devuelve un cierre, y el cierre devuelto acepta una cadena como su único parámetro y no devuelve nada:

func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
Podemos llamar travel()para recuperar el cierre, y luego llamar a ese cierre libremente:

let result = travel()
result("London")
La captura de cierres se produce si creamos valores travel()que se utilizan dentro del cierre. Por ejemplo, es posible que queramos realizar un seguimiento de la frecuencia con la que se llama al cierre devuelto:

func travel() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
Aunque esa countervariable se creó dentro de travel(), queda capturada por el cierre, por lo que seguirá activa para ese cierre.

Entonces, si llamamos result("London")varias veces, el contador subirá y subirá:

result("London")
result("London")
result("London")
