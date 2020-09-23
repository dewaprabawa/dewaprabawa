import UIKit
import Foundation

/*
let numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450]

print(numbers.count)

let middleIndex = numbers.count/2

print(middleIndex)

func naiveContains(_ value:Int, array:[Int]) ->Bool {
    for element in array {
        if element == value {
            return true
        }
    }
    return false
}


func naiveContains1(_ value:Int, array:[Int]) -> Bool {
    guard !array.isEmpty else { return false }
    
    let middleIndex = array.count/2
    
    if value <= array[middleIndex]{
        for index in 0...middleIndex{
            if array[index] == value {
                return true
            }
        }
    }else{
        for index in middleIndex..<array.count{
            if array[index] == value {
                return true
            }
        }
    }
    return false
}



public class Node<Value>{
    public var value:Value
    public var next:Node?
    
    public init(value:Value, next:Node? = nil){
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else{
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + ""
    }
}

var node1 = Node(value: 1)
var node2 = Node(value: 2)
var node3 = Node(value: 3)

node1.next = node2
node2.next = node3


public struct LinkedList<Value>{
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init(){}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    
    public mutating func push(_ value: Value){
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
}


extension LinkedList: CustomStringConvertible {
    
    public var description: String{
        guard let head = head else {
            return "Empty List"
        }
        
        return String(describing: head)
    }
}

var list = LinkedList<Int>()

list.push(1)
list.push(2)
list.push(3)

print(list)


var array = [1, 2, 3]
for number in array {
  print(number)
  array = [4, 5, 6]
}
print(array)


let user = ("Dewa","Prabawa",27,"Soon IOS Developer")

user.0
user.1
user.2
user.3

let newUser = (firstName:"Dewa",lastName:"Prabawa",age: 28,job:"Soon IOS Developer")

newUser.firstName + " " + newUser.lastName
newUser.age
newUser.job


typealias cityCoordinate = (lat:String, long:String)
typealias cityInfo = (city: String, country: String, zipcode: Int)


typealias UseCases = (theCityInfo: ((cityCoordinate)-> cityInfo),())


var useCase:UseCases?


func createCity(lat:String, long:String) -> (city: String, country: String,zipcode:Int ){
    return ("gianyar","bali",2123)
}

var s = useCase?.theCityInfo(("adada","sdasdas"))
s?.city
s?.country
*/



let numbers = [1,3,56,66,68,80,99,105,450] ///
print("check number count :\(numbers.count)")
var num = numbers[4]
print("------:\(num)") /// this loop result 68

func naiveContains(_ value: Int, in array: [Int]) -> Bool {
    guard !array.isEmpty else {return false}
    let middleIndex = array.count/2
      print("middel:\(middleIndex)")
       // value 10
    if value <= array[middleIndex]{//68
        for index in 0...middleIndex{ //count to 0 1 2 3
            print("check index:\(index)")
            if array[index] == value {
                return true
            }
        }
    }else{
        //value 70
        for index in middleIndex..<array.count { ///middle index = 4
            print("check index: \(index)")
            if array[index] == value {
                return true
            }
        }
    }
    return false
}

naiveContains(80, in: numbers)

var digit = [1,2,3,4,5,6,7,8,9]
print(digit[10])

for i in digit{
    var num = i + 1
    print(i)
}



