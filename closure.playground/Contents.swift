import UIKit

var str = "Hello, playground"

//closure
let block = {
    print("Hi I am new")
}

func new(block: ()-> Void) {
 print("hi")
}
new {
    print("Hello")
}

//sorting using closure
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
print(reversedNames)

reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})
