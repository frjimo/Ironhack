import Foundation

public class Person {
    public var name: String = "John Doe"
    public var address: String = "C/ María Martillo"
    public var homeCoordinate: Coordinate?
    
    public init(name:String){
        self.name = name
    }
}

public class Coordinate {
    var latitude: Float?
    var longitude: Float?
    
    init(latitude: Float, longitude: Float){
        self.latitude = latitude
        self.longitude = longitude
    }
    
}