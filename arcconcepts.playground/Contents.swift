import UIKit

var str = "Hello, playground"

// how does arc work
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
   weak var gadget: Gadget?
    deinit {
        print("\(name) is being deinitialized")
    }
}
class Gadget {
    let model: String
    init(model: String) {
        self.model = model
        print("\(model) is being initialized")
    }
    var owner: Person?
    deinit {
        print("\(model) is being deinitialized")
    }
}
var reference1: Person?
var reference2: Gadget?
//reference1 = Person(name: "hitha")
//reference1 = nil
//reference2 = Gadget(model: "Iphone")
//reference2 = nil
//reference1?.gadget = reference2
//reference1?.gadget = nil
//print(reference1?.gadget ?? "It is nil")
reference2?.owner = reference1
reference1?.gadget = reference2
reference1 = Person(name: "Nidhi")

class Student {
    var degree: String = "Btech"
    
}
class Course {
    var courseTitle = "B.Tech"
}
let nidhi = Student()
let courseName = nidhi.degree

