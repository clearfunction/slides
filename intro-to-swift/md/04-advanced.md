# Advanced Features

<..>

## Classes

```swift
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
    }
}
```

<..>

## Protocols

```swift
protocol CoolCat {
    func greetings() -> String
}
```

<..>

## Enums

```swift
enum AwesomenessLevel {
    case lame, normal, awesome
}

let level = AwesomenessLevel.awesome
```

<..>

## Extensions

```swift
extension Int {
    func double() -> Int {
        return self * 2
    }

    mutating func doubleSelf() {
        self *= 2
    }
}
```

<..>

## Generics

```swift
// shorthand for Array<Int>()
var genericArray = [Int]()
genericArray.append(5)
```

<..>

## Functional

```swift
let results = ["abc", "def", "ghi"]
    .filter { $0.hasPrefix("d") }
    .map { $0.uppercased() }
```

Note:
Really begins to feel like a next-gen language with this.
