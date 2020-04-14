import UIKit


// structs classes and initialization

//differences between class and structs

/*
 - structs have a memberwise initializer \, classes do not
 - classe shave to provide an initializer if ANY of its prooperties do not have a default value
 - classes have inheritance and structs do not
 - due to the nature of the immutanility o f a struct, if you're in a function that modifies one of its properties, that method needs to be explicitly marked "mutating" in classes this is not a fact because classes are passed by reference which makes it mutable by default
 - classes have deinitializers and structs do not 
 */

/*
 Similarities
 - both classes and structs can have type properties/methods called by "static"
 */

struct  Fellow {
    
    // properties
    
    //type properties
    
    static let currentYear = 2019 // Fellow.currentYear
    // yulia.currentYear would be a compiler ERROR
    
    //instance properties
    var age: Int // e.g yulia.age but NOT Fellow.age
    var cohort: Double
    var currentlyEmployed: Bool // true or false
    
    //initializers if any
    
    // type methods
    static func programInfo() {
        print("This is a 10-month intensive program.")
    }
    
    
    // instance methods
    
     mutating func employed(isEmployed: Bool) {
        currentlyEmployed = isEmployed
    }
    
}

print("Pursuit fellows current year is \(Fellow.currentYear)")

print(Int.max)
// Int.max is known as accesssing a type property
// e.g .max ONLY works on ((data type)) Int, NOT an insatnce of Int

// instance of Int
let someInt = 0
// someInt.max - DOES NOT COMPILE because this is an instance of an Int not just the data type Int


//making use of a struct's meberwise intializer
    var yulia = Fellow(age: 21, cohort: 6.3, currentlyEmployed: false)
if yulia.currentlyEmployed {
    print ("When are you taking me out to lunch")
} else {
    print("Lunch is on me today")
}

//accessing a type method programInfo()
Fellow.programInfo()

class Animal {
    var age:Int
    var breed: String
    var color = "white"
    init(age:Int, breed: String) {
        self.age = age
        self.breed = breed
    }
    
    //instance method
    func info() {
        print ("The \(breed) is \(age) old and color is \(color)")
    }
}
// Dog is inheriting Animal
// subclass in Dog, parent class in Animal
class Dog: Animal {
    
}

// created an instance of Dog called French Bulldog
let frenchBulldog = Dog(age: 11, breed: "French Bulldog")
