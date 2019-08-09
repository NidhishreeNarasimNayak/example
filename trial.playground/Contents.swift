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

//closure
var obj4 = {(name1: String) -> String in
return "Hello \(name1)"
}
obj4("Nidhishree")

//get each character from an array
var str1 = ["Nitin","Cheeku","Jeevan"]
for (inde, valu) in str1.enumerated() {
    print("Index : \(inde)  Value : \(valu)")
//    str1.append("Bindu")
//    print(str1)
    str1.insert("s", at: str1.endIndex)
    print(str1)
}

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: "there", at: welcome.index(before: welcome.endIndex))
