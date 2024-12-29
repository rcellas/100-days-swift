//
//  main.swift
//  day-3
//
//  Created by Rcellas on 25/12/24.
//

let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore

print(total)
print(difference)
print(product)
print(divided)
print(remainder)


let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

print(action)

var score = 95
score -= 5

print(score)

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

print(quote)

print(firstScore == secondScore)
print(firstScore != secondScore)
print(firstScore < secondScore)
print(firstScore >= secondScore)
print("Taylor" <= "Swift")

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
}else{
    print("Regular cards")
}

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}


print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

let weather = "sunny"

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

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    // sirve para que continue la acción
    fallthrough
default:
    print("Enjoy your day!")
}

let score2 = 85

switch score2 {
    // el contenido iria  del 0 al 49 en caso de querer también al 50 deberíamos ponerlo así ...
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}





