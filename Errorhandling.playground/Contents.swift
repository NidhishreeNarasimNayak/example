import UIKit
//
//var str = "Hello, playground"
//
//enum VendingMachineError: Error {
//    case invalidSelection
//    case insufficientFunds(coinsNeeded:Int)
//    case outOfStock
//}
////throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
//
//func home() throws -> Int
//{
//    throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
//}
//
//
//struct Item {
//    var price: Int
//    var count: Int
//}
//
//class VendingMachine {
//    var inventory = [
//        "Candy Bar": Item(price: 12, count: 7),
//        "Chips": Item(price: 10, count: 4),
//        "Pretzels": Item(price: 7, count: 11)
//    ]
//    var coinsDeposited = 0
//
//    func vend(itemNamed name: String) throws {
//        guard let item = inventory[name] else {
//            throw VendingMachineError.invalidSelection
//        }
//
//        guard item.count > 0 else {
//            throw VendingMachineError.outOfStock
//        }
//
//        guard item.price <= coinsDeposited else {
//            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
//        }
//
//        coinsDeposited -= item.price
//
//        var newItem = item
//        newItem.count -= 1
//        inventory[name] = newItem
//
//        print("Dispensing \(name)")
//    }
//}
//
////enum PasswordError: Error {
////    case obvious
////}
////func checkPassword(_ password: String) throws -> Bool {
////    if password == "password" {
////        throw PasswordError.obvious
////    }
////    return true
////}
////do {
////    try checkPassword("password")
////} catch {
////    print(error)
////}
//
//// optional binding
//class Person {
//    var residence: Residence?
//}
//
//class Residence {
//    var numberOfRooms = 1
//}
//
//let john = Person()
//
////let roomCount = john.residence!.numberOfRooms   // we get a run time error because we are forcefully unwrapping a value which is nil
//
//
//if let roomcount = john.residence?.numberOfRooms {
//    print("John's residence has \(roomcount) rooms")
//}
//    else{
//        print("Unable to retrieve the number of rooms")
//    }
//
//john.residence = Residence()

//protocol

protocol FullNameable {
    var fullName: String { get }
}

struct Lecturer: FullNameable {
    var fullName: String
    
    
}
let lecturer = Lecturer(fullName: "gift")
