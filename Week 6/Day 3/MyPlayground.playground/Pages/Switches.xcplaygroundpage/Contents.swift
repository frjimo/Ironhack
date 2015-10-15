//: [Previous](@previous)


//Editor -> Show render markup
/*:

# Switches in Swift

> Three Swedish ......

* examples
* fun
* more fun
* wow, such switches, many code

Reference: [Google](www.google.com)


*/

import Foundation

var str = "Hello, playground"

var Diego = Person(name: "Fran")

let i = 178

switch i{
case let x where x > 100 && x < 199:
    print("1 \(x)")
    
case 2...5:
    print("2")
    
case 10:
    print("10")
    
default:
    break;
    
}

let b = true
switch b {
case true:
    break
case false:
    break
}

let name: String = "Diego Freniche"

switch name {
case let x where x.hasSuffix("Frenihe"):
        print("Hola \(x)")
    case "":
    print("vacia")
default:
    break
}

let schema = "https://"

switch schema {
case let x where x.hasPrefix("http://"):
    print("HTTP")
    
default:
    print("\(schema) Unknow")
}

enum Schemas: String{
    case http = "http://"
    case https = "https://"
    case irc = "irc://"
    case ftp = "ftp://"
}

enum Days: String {
    case mon = "Monday"
    case tue = "Tuesday"
    case wed = "Wednesday"
    case thu = "Thursday"
    case fri = "Friday"
    
    
}

let day = Days.tue

switch day {
case .mon:
    print("Mal")
case .wed, .thu:
    print("Medio mal")
case let name where day.rawValue.hasPrefix("day"):
    print("No tengo ganas de currar")
default:
    print("default")
}

for i in 1...100 where i%2 == 0 {
    print ("\(i)")
}


//: [Next](@next)
