import UIKit

var str = "Hello, playground"

//stored property
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 6, length: 0)
rangeOfThreeItems.firstValue = 7
print(rangeOfThreeItems)

//assiggning constant properties during initialization
class SurveyQuestion {
    let text: String
    var response: String?
    init(text:String){
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets"

// Lazy property

class SleepingBeauty{
    init() {
        print("zzz...sleeping...")
        print("sleeping beauty is ready")
    }
}

class Castle {
  lazy var princess = SleepingBeauty()
    init() {
        print("castle is ready")
    }
}
print("a new castle ")
let castle =  Castle()
castle.princess

//Computed property
class Square {
    var side: Double = 10
    var area :Double {
        get{
            return side*side
        }
        set(newvalue)
        {
            side = sqrt(newvalue)
        }    }
}
var obj = Square()
print(obj.area)
obj.area = 16
print(obj.side)
print(obj.area)

//methods

class Counter {
    var count = 0
    func increment() {
        count += 1
        print(count)
    }
    func increment(_ amount: Int){
        count += amount
        print(count)
    }
    func reset() {
        count = 0
    }
    
}
var counter = Counter()
print(counter.increment())
counter.increment(6)

//subscript
struct StringAssign
{
    
var string = "hello"
subscript (index: Int) -> Character {
    get{
        return string[string.index(string.startIndex, offsetBy: index)]
    }
}

}
var store = StringAssign()
print(store[2])

//inheritance
class Fruits {
    var color: String = "Orange"
    var seedCount: Int
    init(_ color: String,_ seedCount: Int) {
        self.color = color
        self.seedCount = seedCount
        print("These fruits are \(color) in color and has \(seedCount) seeds")
        
        
    }
    
}
var obj3 = Fruits("Orange",5)

//subclass
class Apple: Fruits {
    var name: String?
    init(_ name: String) {
        super.init("red", 5)
        self.name = "Apple"
        print("These fruits are \(color) in color and has \(seedCount) seeds")
    }
}
var obj4 = Apple("Yo")
print(obj4)



