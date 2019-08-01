import UIKit

var str = "Hello, playground"
func add(num1:Int, num2:Int)-> Int
{
    let sum = num1 + num2

    return sum

}
print(add(num1:8,num2:4))


var str1 = "Meenu Uta"
let mseeage = str1.index(str1.startIndex,offsetBy: 2)
print(str1[mseeage])

//for loop
let fruits = ["apple","orange","banana"]
for fruit in fruits{
    print ("\(fruit)")
}

//func with no return value
func noret() {
    print("Function")
}
noret()

//function with multiple parameters and multiple return type
func greet(name: String, age years:Int) -> (String,Int)
{
    let mseg = "Good morning" + name
    var userage = years
    if userage < 0
    {
        userage = 0
    }
    return(mseg,userage)
}
let mseg = greet(name: "Cheeku", age: -1)
print(mseg)

//array
let array = [1,2,3,4,5,6]
var newArr: [Int] = []
for value in array {
    newArr.append(value)
}
print(newArr)

//binary search

//var array1 = [2,4,6,8,10]
//
//
//func binarysearch(array1:[Int] , ele: Int)
//{
//    var low = 0
//    var high = array1.count - 1
//    var mid = 0
//    while low<=high {
//        mid = (low+high)/2
//        print("\(mid)")
//        if ele == array1[mid]
//        {
//            print("Element found at \(mid) position")
//        }
//        else if ele<array1[mid]
//        {
//            high = mid - 1
//        }
//        else
//        {
//            low = mid + 1
//        }
//                       }
//    print("Elements not found")
//}
//binarysearch(array1:array1, ele: 8)

//Dictionaries
var airports : [String:Float] = ["XYZ":4,"DUB":9.0]
print("The airport dictionary contains \(airports.count)")
airports["LON"] = 5
print("The airport dictionary contains \(airports.count)")

//switch statement
enum Compasspoint {
    case north
    case south
    case east
    case west
}
var directiontohead = Compasspoint.east

switch directiontohead {
case .north:
    print("Your heading north")
case .east:
    print("Your heading east")

default:
    print("Your heading south")
}

//classes and structures

struct vegetables
{
    var width:Int = 0
    var len = " "
    var height = 0
}
var copy = vegetables()
print(copy.height)

class college
{
    var id = 123
    var name = "Bidan"
    
}
//var copy1 = college()
print(college().id)

