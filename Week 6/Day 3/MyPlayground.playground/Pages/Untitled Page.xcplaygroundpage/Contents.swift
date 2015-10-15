//: Playground - noun: a place where people can play

import Swift //Por defecto ya está
import UIKit

var str = "Hello, playground"

print("Hola Mundo")
print("Adios")

var name: String = "Fran"

var i = 10.0
i = 7
i = 14.6
if i < 10 {
    print("i vale mayor que 10")
} else {
    print("i vale menos que 10")
}

for i in 1...10 {
    print("i vale \(i*2) y el doble es \(i/2)")
}

func suma(a: Int, b: Int) -> Int {
    return a + b
}

suma (10, b: 20)

func addPinToMap(map: String, andNoseque: String){
    
}

addPinToMap("", andNoseque: "")

let 👍🏻 = true
let 👎🏻 = false

func divide(n: Float, d: Float) -> (value: Float, hasError: Bool) {
    if  d == 0 {
        return (0.0, false)
    }
    return (n / d, 👍🏻);
}

var result = divide(10.0, d: 0)

result.0
result.1

result.value
result.hasError

class Coordinate {
    var latitude: Float?
    var longitude: Float?
    
    init(latitude: Float, longitude: Float){
        self.latitude = latitude
        self.longitude = longitude
    }
    
    
}

class Person {
    var name: String = "John Doe"
    var address: String = "C/ María Martillo"
    
    init(name:String){
        self.name = name
    }
}

let alejandro = Person(name: "Alejandro")

let gonzalo = Person(name: "Gonzalo")






/*
class Slave: Person {
    var master: Person
}
*/
