import UIKit

var str = "Hello, playground"
//protocol
protocol classb {
    var marks: Int {get set}
    var result: Bool {get}
    func attendance() -> String
    func marksSecured() -> String
    var present: Bool { get set }
    var subject: String { get set}
    var stname: String { get set}
}

class classc: classb {

    var marks = 96
    let result = true
    var present = false
    var subject = "Swift 4 Protocols"
    var stname = "Protocols"
    func attendance() -> String {
        return "The \(stname) has secured 99% attendance"
    }
    
    func marksSecured() -> String {
        return "\(stname) has scored \(marks)"
    }
   // var flying: classb?

}
//var fly = classc()
//fly.marks
var sub: classb? = classc()
sub?.attendance()

//implicit function
func sayHello(name: String) -> String {
  return "Hello \(name)"
}
sayHello(name: "Nidhi")

