import UIKit

//Objectives
/*
 - inout function
 - generics, generic function
 - stack: using a generic type
 
 */
// inout function - allows us to chnage variables outside the scope of the function
// changes a variable outside of it's code
// anything in the body of the function affects the outside because of inout,
// Without inout, this isn't possible
// alows you to swap it in place
func swapTwoInits(int1: inout Int, int2: inout Int) {
    // this function has the capability to swap the values
    let temp = int1// saved the value of int1 to avoid overiding it
    int1 = int2
    int2 = temp
}

var num1 = 4
var num2 = 13

print("Values of ints before swap is \(num1) and \(num2)")
swapTwoInits(int1: &num1, int2: &num2)
print("Values of ints before swap is \(num1) and \(num2)")

// Generic function
// func swapTwoValues<T>(value1: T, value2: T) | The T is convention
func swapTwoValues<AnyValue>(value1: inout AnyValue, value2: inout AnyValue) {
    let temp = value1
    value1 = value2
    value2 = temp
}

var name1 = "Chelsi"
var name2 = "Christmas"
print("Values of names before swap is \(name1) and \(name2)")

swapTwoValues(value1: &name1, value2: &name2)
print("Values of names before swap is \(name1) and \(name2)")

// Any is not type-safe

var arr: [Any] = [45, 7, 0, true, 90.8]
arr.append("fellow")

// implement a Generic Stack using an array

struct IntStack {
    private var elements = [Int]()
}

// generic type
struct Stack<T> {
    private var elements = [T]() // wors with any type
    // mutating must be specified in structs and NOT in classes because structs are reference typews whereas classes are value types
    
    public var peek: T? {
        return elements.last // refers to the last thing that was added
    }
    public mutating func push(item: T) {
        elements.append(item)
    }
    
    public mutating func pop() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast()
    }
}


var cohorts = Stack<Double>()
cohorts.push(item: 1.0)
cohorts.push(item: 2.0)
cohorts.push(item: 3.0)
cohorts.push(item: 4.0)
cohorts.push(item: 5.0)
cohorts.push(item: 6.3)

print(cohorts.peek) // 6.3

cohorts.pop()
cohorts.pop()
print(cohorts.peek) // 4.0

struct Fellow {
    let name: String
    let language: String
}

let ameni = Fellow(name: "Ameni", language: "Swift")
let tom = Fellow(name: "Tom", language: "Kotlin")

var fellows = Stack<Fellow>()
fellows.push(item: tom)
print(fellows) // ["Tom"]
