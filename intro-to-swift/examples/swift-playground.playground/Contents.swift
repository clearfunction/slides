// Playground - noun: a place where people can play

// ------- variables --------

// implicit typing
var x = "Hello World!"
var y = 1

// explicit typing
var explicitString: String = "hello world"
var explicitInt: Int = 1

// immutable variables (think constants, except more powerful)
let immutable = "I can't change after this"
let pi = 3.14159265359


















// ------- collections --------
let arr = [1, 2, 3]
let strArr = ["hello", "world", "!"]
arr[0]
strArr[1]

let hash = [1: "a", 2: "b", 3: "c"]
let strHash = ["firstName": "David", "lastName": "Mohundro"]
hash[1]
strHash["lastName"]


















// ------- control flow --------
for item in ["abc", "def", "ghi"] {
    if item.hasPrefix("d") {
        "Matched on \(item)"
    }
}

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}


















// ------- functions --------
func noParams() {
    "Hello"
}
noParams()


func sayHello(name: String) {
    "Hello \(name)"
}
sayHello(name: "Mo")


func getFirstAndLastName(firstName: String, lastName: String) -> String {
    return "Your name is \(firstName) \(lastName)"
}
getFirstAndLastName(firstName: "David", lastName: "Mohundro")



















// ------- classes --------
class Person {
    var firstName: String
    var lastName: String
    var age: Int

    var fullName: String {
        return "\(self.firstName) \(self.lastName)"
    }

    private var myFavoriteFood: String?

    public var favoriteFood: String {
        get {
            if let fav = myFavoriteFood {
                return fav
            }
            return "Nothing :sad:"
        }
        set(newFavoriteFood) {
            myFavoriteFood = newFavoriteFood
        }
    }

    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }

    func eat(food: String, withDrink: String) {
        print("\(self.fullName) is about to eat \(food) and enjoy \(withDrink) to drink")

        if let fav = myFavoriteFood {
            if food == fav {
                print("Yay, his/her favorite food!")
            }
        }
    }
}

// type this out... let them see how intellisense behaves differently
// it's an Obj-C thing
var person = Person(firstName: "David", lastName: "Mohundro", age: 33)
person.fullName
person.favoriteFood = "Pizza"

person.eat(food: "Pizza", withDrink: "Coke")




















// ------- protocols --------
protocol CoolCat {
    func greetings() -> String
}

class CoolChecker {
    func isCool(_ cat: CoolCat) -> Bool {
        cat.greetings()
        return true
    }

    func isCool(_ cat: Any) -> Bool {
        "sad trombone"
        return false
    }
}

class TheFonz: CoolCat {
    func greetings() -> String {
        return "Heyyyy"
    }
}

class Bubba {
}

var checker = CoolChecker()
checker.isCool(TheFonz())
checker.isCool(Bubba())




















// ------- enums --------
enum AwesomenessLevel {
    case lame, normal, awesome
}

let level = AwesomenessLevel.awesome

enum IntAwesomenessLevel: Int {
    case lame = 0           // initial value is optional
    case normal
    case awesome
}
let intLevel = IntAwesomenessLevel.awesome
intLevel.rawValue // provided because of inheriting from Int

enum StringEnumExample: String {
    case none = "None"
    case all = "All"
    //case some
    // Will result in error: "Enum case must declare a raw value when
    // the preceding raw value is not an integer"
}
let strEnum = StringEnumExample.none
StringEnumExample(rawValue: "All") == StringEnumExample.all




















// ------- extensions --------
extension Int {
    func double() -> Int {
        return self * 2
    }

    mutating func doubleSelf() {
        self *= 2
    }
}
2.double()
var extensionExample = 4
extensionExample.doubleSelf()




















// ------- generics --------
var genericArray = [Int]()
genericArray.append(5)




















// ------- functional aspects --------
// really wordy... ("in" is part of the parameter statement)
[1, 2, 3].filter({ (x: Int) -> Bool in
    return x % 2 == 0
})

// exclude the return type (implicit!) and return keyword!
[1, 2, 3].filter({ x in
    x % 2 == 0
})

// or even omit the parameters completely and use $0, $1, etc.
[1, 2, 3].filter({
    $0 % 2 == 0
})

// or finally, exclude the parens if it is the final statement (feels like Ruby blocks now)
[1, 2, 3].filter { $0 % 2 == 0 }

// a little more full-featured example
let results = ["abc", "def", "ghi"]
    .filter { $0.hasPrefix("d") }
    .map { $0.uppercased() }
results
