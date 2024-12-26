//
//  main.swift
//  day-7
//
//  Created by BCN MAC 020 on 27/12/24.
//

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}

func travel2(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
// se pueden hacer de diferentes formas

travel2 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

travel2 { place -> String in
    return "I'm going to \(place) in my car"
}

travel2 { place in
    return "I'm going to \(place) in my car"
}

// Closures with multiples parameters
//  no me gusta esta forma, al menos me resulta confuso
func travel3(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel3 {
    "I'm going to \($0) at \($1) miles per hour."
}

// Returning closures from functions
func travel4() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result1 = travel4()
result1("London")


func travel5() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result3 = travel5()
result3("Barcelona")







