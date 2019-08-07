import UIKit

var str = "Hello, playground"
enum College: Int  {
    case principle
    case teachers
    case students = 2
    
    static let fgg = 34
    func details() {
        print("This gives the details")
    }
}
let r = College.teachers.rawValue
print(r)
//r.details()

let o = College.fgg
print(o)


// to get the raw value of enum
enum City: Int {
    case Melbourne = 1
}
let city = City.Melbourne.rawValue
print(city)
print(type(of: City.Melbourne))

//classes and how to obtain the value using object
class Operation{
    var num1: Int
    var num2: Int
    
    init(_ num1: Int ,_ num2: Int) {
       self.num1 = num1
       self.num2 = num2
        print("The first number is \(num1) and the second number is \(num2)")
    }
        func addition() {
            let num3 = num1 + num2
            print(num3)
        }
}
let obj = Operation(4,5)
obj.addition()

extension Operation {
    func multiply() {
        let num4 = num1 * num2
        print(num4)
    }
}
let obj1 = Operation(3,4)
obj1.multiply()

//Optional chaining
class Student {
    var teach: Teacher?
}
class Teacher {
    var name = "Suresh Desai"
}
var stu = Student()
if let stuname = stu.teach?.name {
    print("Name: \(stuname)")
}
else {
    print("Unable to retrieve name")
}

//optional chaining
var x: Int? = 10
print(x as Any)

//enum inside enum
enum Animal: String {
    case breed
    enum Dog {
        case features
        func Character()
        {
            print("These are the features of the dog")
        }
    }
}
let obj5 = Animal.Dog.features
print(obj5.Character())

//Automatic reference counting
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var reference1: Person?
var reference2: Person?
//var reference3: Person?
reference1 = Person(name: "Nidhishree")

reference2 = reference1
reference1 = nil
reference2 = nil

//strong reference

class Person1 {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    var gadget: Gadget?
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
    var owner: Person1?
    deinit {
        print("\(model) is being deinitialized")
    }
}
let obj6 = Person1(name: "Orange")

//how does arc work
class Person2 {
    let name: String
    init(name: String){
        self.name = name
        print("\(name) is being initialized")
        
    }
   weak var gadget: Gadget1?
    deinit {
        print("\(name) is being deinitialized")
    }
}
class Gadget1{
    let model: String
    init(model: String) {
        self.model = model
        print("\(model) is being initialized")
        
    }
  weak var owner: Person2?
    deinit {
        print("\(model) is being deinitialized")
    }
}

var obj7: Person2?
obj7 = Person2(name: "Hitha")
//obj7 = nil
var obj8: Gadget1?
obj8 = Gadget1(model: "Iphone")
obj8?.owner = obj7
obj7?.gadget = obj8
//obj7 = nil
//obj8 = nil
//obj7?.gadget = nil
obj8?.owner = nil

