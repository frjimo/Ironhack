import Foundation
import UIKit

var j: Float = 0.0

for i in 0...100 {
    j = (Float(i) * 4.0) * sin(Float(i))
}
j

let url: NSURL = NSURL(string: "http://i.ytimg.com/vi/bS5P_LAqiVg/maxresdefault.jpg")!

let url2:NSURL? = NSURL(string: "http://www.telize.com/geoip/90.90.90.90")
let dataJson = NSData(contentsOfURL: url2!)

do {
    let json = try NSJSONSerialization.JSONObjectWithData(dataJson!, options: NSJSONReadingOptions.AllowFragments)
} catch {
    
}

let v: UIView = UIView(frame: CGRectMake(10, 10, 10, 10))
v.backgroundColor = UIColor.redColor()
v.layer.cornerRadius = 100.0
v

UIView.animateWithDuration(1) { () -> Void in
    v.backgroundColor = UIColor.blueColor()
}
v

extension UIColor {
    static func 🐤() -> UIColor {
        return UIColor.yellowColor()
    }
}


let subView = UIView(frame: CGRectMake(0, 0, 60, 60))
subView.backgroundColor = UIColor.🐤()

subView

subView

v.addSubview(subView)

v


let redView = UIView(frame: CGRectMake(10, 10, 20, 20))
redView.backgroundColor = UIColor.redColor()

subView.addSubview(redView)

v
7721