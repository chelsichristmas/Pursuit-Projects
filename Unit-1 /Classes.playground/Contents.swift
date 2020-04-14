import UIKit



// classes: building block that enable us to create complex "objects" in our program. Those objects are created using properties and methods.

//===========================================
//             class syntax
//===========================================

class MyFirstClass {
    
}

// REVIEW
//Day not has added functionionaluity to the enum
//cases it has e.g here it is 3
enum Day: CaseIterable {
    case monday, tuesday, wednesday
}

//==================================================================
//  inheritance - ONLY classes can inherit from other classes
//==================================================================
class Person {
    var name = ""// stored property
    var age = 0
    
    // instance methods
    func info() {
        print("This is a person")
    }
}


// Fello inherits from Person
// Fellow is a subclass of Person
// Person is the parent/superclass of Fellow
// In Swift we only have single inheritance capability, meaning you can ONLY inherit from one parent

// Object Oriented Programming consists of these concepts:
// - inheritance
// - encapsulation: use private access modifiers on your properties and access them externally through methods
// - polymorphism - changing the form of an object

// The class Fellow inherits from the Person class above
class Fellow: Person { // This reads we have here a class called Fellow  inherits from the class Person
    // func info() - DOES NOT COMPILE because the Parent(has the same method name)
                   // Soooo Feloow needs to use the override function below
    override func info() { //override does change the parent
 print("\(name) is doing amzingly well. Coding rocks!")
        
    }
    
}


class Employee: Person {
    //properties
    var position = "iOS Developer"
    var salary = 85_000
    
    //instance methods
    override func info() {
    print("\(position) is making $\(salary)")
}
}
// creating an instance of Fellow
let brendon = Fellow()
brendon.name = "Brendon"
brendon.info() // This calls the function in class Person

let chelsi = Person()

// Before the Fellow class overrode info() method from the Person class this was the otput from the print statement
// " This person name is Brendon and age is 31"

// after over ridding info() in the Fellow class the print statement comes from the overriden method
//"Brendon is a fellow at Pursuit and is 31 years old"

/* STRUCTS CANNOT INHERIT FROM OTHER STRUCTS
 Protocols can be created by the developer and enums/structs/classes can conform to protocols
 */

//==================================================================
//  polymorphism - changing form of an object
//==================================================================

// instance of a Person
let tom = Person()
tom.name = "Tom"

//instance of an Employee
let john = Employee()
john.name = "John"

// instance of a Fellow
let bienbenido = Fellow()
bienbenido.name = "Bienbenido"

// an array of instances from above
let people = [tom, john, bienbenido]

// if we were to loop over th epeopl array, what would be th e info message for bienbenido
for person in people {
    person.info() //This prints the print statement from each class they are in
}

//==================================================================
//  struct are value-types - meaning when you assing a new variable,
//                           that new variable gets a copy of the
//                           original. Changing th ecopy does not
//                           change the original.
// classes are reference types (when the original changes it changes
// all the children), all objects are pointing toward the same object
// - multiple instances point to the same object meaning object b can
// mutate object a
//==================================================================

//creating an instance of Fellow() named anna
let anna = Fellow()
anna.name = "Anna"
print (anna.name)


//assigning luba the anna object
let luba = anna // both Anna and Luba are pointing to the same object
print(luba.name) //Anna

luba.name = "Luba"
print(luba.name) //Luba

//WHat is anan's name if printed
print(anna.name) //Luba

//==================================================================
//  Swift provides a way to check for object equality of
// identity uding === (object identity syntax)
//==================================================================
if anna === luba { // ONLY available on classes
    print("Both objects are pointing to the same reference")
}

//==================================================================
//
//==================================================================


struct Dog {
    var breed: String
    var age: Int
}
//creating an instance of Dog using the memberwise intializer of the Dog struct
//ONLY structs provide memberwise initializers

var frenchBulldog = Dog(breed: "French Bulldog", age: 7)

//compiler error if class does not provide default values
// for ALL properties
// if there are no default values for the properties, the code will not compile
class Game {
    var name: String
    var noOfPlayers: Int
    
    // initializers
    init(name: String, noOfPlayers: Int){
        self.name = name
        self.noOfPlayers = noOfPlayers
    }
    //instance method
    func info() {
        print("\(name) has \(noOfPlayers) players")
    }
}

let basketball = Game(name: "Basketball", noOfPlayers: 5) // we're instantiating here
let football = Game(name: "Football", noOfPlayers: 11)


//==================================================================
//creating instaces form a dictionary
//==================================================================


class Playlist {
  // properties
  var name: String
  var trackCount: Int
  var description: String
  var isTop100: Bool
  
  // designated initializer initializes all the properties of the class
  init(name: String,
       trackCount: Int,
       description: String,
       isTop100: Bool){
    self.name = name
    self.trackCount = trackCount
    self.description = description
    self.isTop100 = isTop100
  }
  
  // convenience initializer and failable initializer
  convenience init?(dict: [String: Any]) {
    // using guard let to unwrap value from key in dictionary
    // also we are using optional downcasting as? to cast to expected type
    guard let name = dict["name"] as? String,
      let trackCount = dict["trackCount"] as? Int,
      let description = dict["description"] as? String,
      let isTop100 = dict["isTop100"] as? Bool else {
        // return exits the initializer, does not continue
        // through function
        return nil
    }
    // if all values are available in the guard statement
    // then we call our designated initializer
    self.init(name: name,
              trackCount: trackCount,
              description: description,
              isTop100: isTop100)
  }
  
  convenience init() {
    let names = ["Pursuit Coding list",
                 "Zumba rocks",
                 "Study playlist",
                 "90's",
                 "Morning Run"
    ]
    self.init(name: names.randomElement() ?? "Z100",
              trackCount: 200,
              description: "Awesome coding music",
              isTop100: false)
  }
  
  convenience init?(name: String) { // "th"
    if name.count < 3 {
      return nil
    }
    self.init(name: name,
              trackCount: 34,
              description: "Currently trending",
              isTop100: true)
  }
  
  // instance method
  func info() {
    print("\(name) contains \(trackCount) tracks. \(description)")
    if isTop100 {
      print("\(name) is on the top 100 Spotify list")
    }
  }
}

let playlistDict: [String: Any] = ["name": "Best Pop Songs 2019",
                                   "trackCount": 128,
                                   "description": "Awesome playlist",
                                   "isTop100": true
]

// create a playlist instance using the playlistDict above and print the track count of the playlist
// output: 128

// Mr. Eric used optional binding to unwrap the playlist
if let playlist = Playlist(dict: playlistDict) {
  print("The amount of track in this playlist is \(playlist.trackCount)")
}

let otherPlaylist = Playlist(dict: playlistDict)
print("track count is \(otherPlaylist?.trackCount)")

otherPlaylist?.info()

let randomPlaylist = Playlist()
print(randomPlaylist.name)

let randomPlaylist2 = Playlist()
print(randomPlaylist2.name)

if let playlistWithName = Playlist(name: "Re") {
    print("Playlist with \(playlistWithName.name)")
} else {
    print("Playlist not created.")
}

let response = Int("eighty")




//let playlist = getPlaylist(dict: playlistDict)
//pprint(playlist?.info() ?? "playlist does not exist")

var input = "Hello, there"

var output = "HELLO, THERE"

print(input.uppercased())
