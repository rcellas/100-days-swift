//
//  main.swift
//  day-1
//
//  Created by BCN MAC 020 on 24/12/24.
//
var str0 = "Hello, playground"
str0 = "Goodbye"
print(str0)

var age = 38
print(age)


var population = 8_000_000
print(population)

var str1 = """
This goes
over multiple
lines
"""

print(str1)

var str2 = """
This goes \
over multiple \
lines
"""

print(str2)

var pi = 3.141
print(pi)

var awesome = true
print(awesome)

//  esto  sería simila a cuando lo hacemos en js de la siguiente forma ${}
var score = 85
var str = "Your score was \(score)"

var results = "The test results are here: \(str)"
print(results)

// igual que js var(aunque deprecado) para variables fijas y let para variables mutables
let taylor = "swift"

// la estructura es muy parecida a ts
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true
