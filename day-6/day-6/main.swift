//
//  main.swift
//  day-6
//
//  Created by BCN MAC 020 on 27/12/24.
//

let driving = {
    print("I'm driving in my car")
}

driving()

let driving2 = { (place: String) in
    print("I'm going to \(place) in my car")
}

driving2("London")

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)
