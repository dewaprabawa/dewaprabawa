import UIKit
import Foundation

struct Place {
    let id:String
    let latitude: Double
    let longitude: Double
}

/*
 /// The Equatable protocol, let specific object to compare its instance, it return bool
 */
extension Place: Equatable {
   static func ==(lhs:Place, rhs:Place) -> Bool {
    return lhs.id == rhs.id && lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

var placeOne = Place(id: "Fenway Park", latitude: 42.3467,
                     longitude: -71.0972)
var placeTwo = Place(id: "Fenway garden", latitude: 42.3467,
longitude: -71.0972)

print(placeOne == placeTwo)



/*
 Generic Functions
 */


/// Swap

var a = 1
var b = 2

//func swapInt(a:inout Int, b: inout Int){
//    let temp = a
//    a = b
//    b = temp
//}
//
//swapInt(a: &a, b: &b)
//
//print(a, b)



protocol MyProtocol {
    associatedtype T
    var items:[T] {get set}
    
    ///Adding single item to items
    mutating func addItems(with item: T)
      ///Checking the count of itme
    mutating func counts() -> T
    ///get single item to items
    mutating func getItem(at index:Int) -> T?
}


struct myIntType: MyProtocol{

    var items:[Int] = []
    
    mutating func addItems(with item: Int) {
        items.append(item)
    }
    
    mutating func counts() -> Int {
        return items.count
    }
    
    mutating func getItem(at index: Int) -> Int? {
        if items.count < index {
            return nil
        }else{
            return items[index]
        }
    }
     
}


struct ListNumber:MyProtocol {
    var items: [Int] = []
    
    func getItem(at index: Int) -> Int? {
        <#code#>
    }
    
    func counts() -> Int {
        <#code#>
    }
    
    func addItems(with item: Int) {
        <#code#>
    }
}


/*
fileprivate class BackendQueue<T>{
    private var items = [T]()

    public init(){}

    private init(_ items: [T]){
        self.items = items
    }

    public func addItem(with item: T){
        items.append(item)
    }

    public func count() -> Int{
        return items.count
    }

    public func getItem() -> T? {
        if items.count > 0{
            return items.remove(at: 0)
        }else {
            return nil
        }
    }

    public func copy() -> BackendQueue<T>? {
        return BackendQueue<T>(items)
    }

}
*/



//fileprivate class BackendQueue<T>{
//    var items:[T] = []
//
//    public init(){}
//
//    private init(_ items: [T]){
//        self.items = items
//    }
//
//    private func addItem(with item: T){
//        items.append(item)
//    }
//
//    private func getItem() ->T? {
//        if items.count > 0{
//           return items.remove(at: 0)
//        }else{
//           return nil
//        }
//    }
//
//    private func count() -> Int {
//        return items.count
//    }
//
//    private func copy() -> BackendQueue<T>?{
//        return BackendQueue<T>(items)
//    }
//}

/*
enum TerrainType{
    case land
    case sea
    case air
}

class Vehicle {
    fileprivate var vehicleTypes = [TerrainType]()
    fileprivate var vehicleAttackTypes = [TerrainType]()
    fileprivate var vehicleMovemnentTypes = [TerrainType]()
    
    fileprivate var landAttackRange = -1
    fileprivate var seaAttackRange = -1
    fileprivate var airAttackRange = -1
    fileprivate var hitPoints = 0
    
    
    func isVehicleType(type:TerrainType) -> Bool{
        return vehicleTypes.contains(type)
    }
    
    func canVehicleAttack(type:TerrainType) -> Bool{
        return vehicleAttackTypes.contains(type)
    }
    
    func canVehicleMove(type:TerrainType)-> Bool{
        return vehicleMovemnentTypes.contains(type)
    }
    
    func doLandAttack(){}
    func doLandMovement(){}
    
    func doSeaAttack(){}
    func doSeaMovement(){}
    
    func doAirAttack(){}
    func doAirMovement(){}
    
    func takeHit(amount:Int){
        hitPoints -= amount
    }
    
    func hitPointRemaining() -> Int {
        return hitPoints
    }
    func isAlive()->Bool{
        return hitPoints > 0 ? true : false
    }
}
*/
/*
enum TerrainType{
    case land
    case sea
    case air
}

class Vehicle{
    fileprivate var vehicleTypes = [TerrainType]()
    fileprivate var vehicleAttackTypes = [TerrainType]()
    fileprivate var vehicleMovemnetTypes = [TerrainType]()
    
    func whatIsVehicleType(with: TerrainType) -> Bool{
        return vehicleTypes.contains(with)
    }
    
    func canVehicleAttack(with: TerrainType) -> Bool{
        return vehicleAttackTypes.contains(with)
    }
    
    func canVehicleMove(with: TerrainType)-> Bool{
        return vehicleMovemnetTypes.contains(with)
    }
    
    fileprivate var landAttackRange = -1
    fileprivate var airAttackRange = -1
    fileprivate var seaAttachRange = -1
    fileprivate var hitPoint = 0
    
    func doLandAttack(){}
    func doLandMovement(){}
    
    func doAirAttack(){}
    func doAirMovement(){}
    
    func doSeaAttack(){}
    func doSeaMovement(){}
    
    func takeHit(amount:Int){
        return hitPoint -= amount
    }
    
    func currentHitPoint() -> Int{
        return hitPoint
    }
    
    func isAlive() -> Bool{
        return hitPoint > 0 ? true : false
    }
    
}



class Tank: Vehicle {
    override init() {
        super.init()
        ///Here is we defien the type of vehicle terrain, by call the override method and super init
        vehicleTypes = [.land]
        
        vehicleMovemnetTypes = [.land]
        /// the land range point is gonna give hit the other  vehicle by 5 point
        landAttackRange = 5
        /// Well, the hitpoint actually here as a lifepoint, it determine the existance of the vehicle in the game
        hitPoint = 68
    }
    
    /*
     these two method the identify if the vehicle move or attack
     */
    override func doLandAttack() {
        print("Tank attacks")
    }
    
    override func doSeaMovement() {
        print("Tank Moves!")
    }
}


class Amphibious: Vehicle {
    override init() {
        super.init()
        vehicleTypes = [.sea,.land]
        vehicleAttackTypes = [.sea,.land]
        vehicleMovemnetTypes = [.sea,.land]
        
        landAttackRange = 1
        seaAttachRange = 1
        
        hitPoint = 25
    }
    
    override func doSeaAttack() {
        print("The amphibious attack in the sea")
    }
    override func doSeaMovement() {
        print("Amphibios move in sea")
    }
    
    override func doLandAttack() {
        print("the amphibios attack on land")
    }
    
    override func doLandMovement() {
        print("the amphibios move on the land")
    }
}


class Transformer: Vehicle{
    override init() {
        super.init()
        
        vehicleTypes = [.air,.land,.sea]
        vehicleAttackTypes = [.air,.land,.sea]
        vehicleMovemnetTypes = [.air,.land,.sea]
        
        landAttackRange = 7
        seaAttachRange = 10
        airAttackRange = 12
        hitPoint = 75
    }
    
    /// The sea mothods
    override func doSeaAttack() {
        print("Transformer is attack in sea")
    }
    override func doSeaMovement() {
         print("Transformer moves in sea")
    }
    
    /// the air methods
    override func doAirAttack() {
        print("Transformer is attack on air")
    }
    override func doAirMovement() {
          print("Transformer moves on air")
    }
    
    /// the land methods
    override func doLandMovement() {
        print("Transformer Transformer moves on sea")
    }
    override func doLandAttack() {
        print("Transformer attacks on land")
    }
    
}



var vehicles = [Vehicle]()

var v1 = Amphibious()
var v2 = Tank()
var v3 = Transformer()

vehicles.append(v1)
vehicles.append(v2)
vehicles.append(v3)


for (index,vehicle) in vehicles.enumerated(){
    if vehicle.whatIsVehicleType(with: .air){
        print("Vehicle at \(index) is air")
        if vehicle.canVehicleAttack(with: .air){
            vehicle.doAirAttack()
        }
        
        if vehicle.canVehicleMove(with: .air){
            vehicle.doAirMovement()
        }
    }
    
    if vehicle.whatIsVehicleType(with:.land){
         print("Vehicle at \(index) is land")
        if vehicle.canVehicleAttack(with: .land){
            vehicle.doLandAttack()
        }
        if vehicle.canVehicleMove(with: .land){
            vehicle.doLandMovement()
        }
    }
    
    if vehicle.whatIsVehicleType(with: .sea){
        print("Vehicle at \(index) is sea")
        if vehicle.canVehicleAttack(with: .sea){
            vehicle.doSeaAttack()
        }
        if vehicle.canVehicleMove(with: .sea){
            vehicle.doSeaMovement()
        }
    }
    
}




protocol Vehicle{
    var hitPoint:Int {get set}
}

extension Vehicle{
    mutating func takeHitPoint(amount:Int){
        return hitPoint -= amount
    }
    
    mutating func checkRemainHitPoint()-> Int{
        return hitPoint
    }
    
    mutating func isAlive() -> Bool{
        return hitPoint > 0 ? true : false
    }
}

protocol landVehicle:Vehicle{
    var landAttack: Bool {get set}
    var landMovement: Bool {get set}
    var landAttackRange: Int {get set}
    
    func doLandAttacK()
    func doLandMovement()
}

protocol seaVehicle:Vehicle{
    var seaAttack: Bool {get set}
    var seaMovement: Bool {get set}
    var seaAttackRange:Int {get set}
    
    func doSeaAttack()
    func doSeaMovement()
}

protocol airVehicle:Vehicle{
    var airAttack: Bool {get set}
    var airMovement: Bool {get set}
    var airAttckRange:Int {get set}
    
    func doAirAttack()
    func doAirMovement()
}


func challange1(with input:String) -> Bool {
    var letter = [Character]()
    
    for i in input {
        if letter.contains(i){
            false
        }
        letter.append(i)
    }
    
    
    return true
}

func challange1b(with input:String) -> Bool {
    return Set(input).count == input.count
}


// mine
func challange2a(with input:String) -> Bool {
    let inputArray = Array(input.lowercased())
    return inputArray.reversed() == Array(input.lowercased())
}

//real example from books
func exampleChallange(with input:String) -> Bool {
    let lowercase = input.lowercased()
    /// when the string manipulate with reversed it then naturely changes to be a array with revesed order
    return input.reversed() == Array(lowercase)
}




challange2a(with: "rotator")
challange2a(with: "Rats live on no evil star")
challange2a(with: "Never odd or even")
challange2a(with: "Hello, world")





func challange3a(letter a: String, letter b:String){
    
}

let students = ["I","Dewa","Gede","Agus","Prabawa"]

if let nameInindex = students.firstIndex(of: "I"){
    print(nameInindex)
}




let name = "abc"
Array(name)

let newIndex = name.index(name.startIndex, offsetBy: 2)

name[newIndex]

*/

func sumFromOne(upto n:Int) -> Int{
    var result = 0
    for i in 1...n{
        print(i)
        result += i
    }
    return result
}


sumFromOne(upto: 2)


func sumFromOneTwo(upto n:Int) -> Int{
    return (1...n).reduce(0,+)
}

//var number = [1,2,3,4,5,6,7,8,9]
//
//for i in 0..<number.count{
//    print(i)
//}
//

var name = "Dewa prabawa"

var range = name.range(of: "De")






