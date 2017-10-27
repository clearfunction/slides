# Basics

<..>

## Variables

```swift
// string type, explicitly defined
var x: String = "Hello World"

// integer type, implicitly defined
var y = 5

// immutable!
let pi = 3.14159265359
```

Note:
Don't be confused, this *isn't* dynamic typing like in JavaScript; this is more akin to Haskell in that the compiler determines the type at compile time.

Also, immutable types __cannot__ change. Show this off.

<..>

## Collections

```swift
var arr = [1, 2, 3]

let hash = [1: "a", 2: "b", 3: "c"]
```

Note:
Notice the methods that exist on the mutable array versus the immutable array. Same thing with the hash. The compiler will not let you mess up.

<..>

## Control Flow

```swift
for item in ["abc", "def", "ghi"] {
    if item.hasPrefix("d") {
        "Matched on \(item)"
    }
}
```

Note:
The other normal control flow statements exist, too, like while loops.

<..>

## Functions

```swift
func getFirstAndLastName(firstName: String, lastName: String) -> String {
    return "Your name is \(firstName) \(lastName)"
}
getFirstAndLastName(firstName: "David", lastName: "Mohundro")

func noParameterName(_ parm: String) -> String {
    return "Your parm is \(parm)";
}
noParameterName("I didn't have to specify the parameter name!")
```

Note:
Strangely enough, the function format reminds me of VB more than anything (with the return type at the end)
