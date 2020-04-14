import UIKit

// Control Flow, Tuples
/* COntrol flow basically takes info and performs the block of code (if true, execute in the compiler)
 block of code - {code in here}
 
 if (some condition is true) {
 execute this block of code
 } else {
 this block of code gets executed if the if condition is false
 }
 
 anything outside the block gets printed
 
 
 //   EXAMPLES
 
 example 1
 if(some condition is true) [
 execute code
 }
 other code runs normal
 
 // example 2 - if/else statement
 if(some condition is true) {
 execute this block of code
 } else {
 some othe rstatement will get executed
 }
 other code runs as normal
 
 //example 3 - if/else if/else
 
 */

//    Built-in funtions w ehave seen so far include:
/*
 print()
 lowercased()
 round() - e.g 1.345 => 1.35
 */

var day = "Friday".lowercased()  // .lowercased (makes the string all lowercased and cna be helpful  in creating case sensitive passwords

if day == "friday" {
    print("woohoo TGIF 🍾")  // control+command+space brings up the emoji keyboard
}

print("control flow is cool")


//=====================================
//             if/else
//=====================================

day = "Monday".lowercased()

if day == "saturday" {
    print("its a beach day")
}
else{
    print ( "just another day" )
}

print("Today is \(day)")

//======================================
//           if/ else if / else
//======================================

var temperature: Double = 85
if temperature < 45 {
    print("it's cold don't forget your gloves")
    if temperature == 0 {// nested if statement means that it emebedded within a condition
        print("I'm dead")
    }
}else if temperature == 85 {
    print("this is my kind of weather")
}else {
    print("the temperature for today is \(temperature)")
}

//===========================================
//                    Ternary Operator - means 3
/*
 (condition - means evaluates to true or false)
 (condition) ? execute if true : execute if false (only works with true ort false statements)
 vs
 
 if (conditon) {
 code here
 } else {
 
 }
 */


var age = 20
print(age > 20 ? "you can have that drink 🍺" : "go back to Grandma's house")


//==========================================
//               Switch Statements
//=========================================

var cohort = "iOS"

switch cohort {
case "iOS":
    print("iOS is awesome!!!")
    print ("cool let's have a picnic") //more than one thing can be printed for each case
    
//case "iOS": case already has been made, will not run
    print("")
case "android":
    print("droids...")
case "web":
    print("full stack dudes and duddettes")
    fallthrough // executes following case
case "backend":
    print("python is cool")

default:
    print("not part of Pursuit")
}
// format for automatically indentation of codeFfor
// commad + a, to select all code in Playground
// for formatting: control + i
// you can use a switch in hte place of overusing if else statements
// the first true statement is going to print
// fallthrough = telling the compiler to execute the next applicable case
// ** useful when you want to apply more than one case to a variable
// ** is a keyword

//==========================================
//              Ranges
//=========================================

let ageRequirement = 18...35 // closed range includes all values
// ** either ... or ..<

let halfRangeExample = 18..<35

let decimalRange = 3.5...4.7 // decimal numbers can be used 




//=============================================
//               Switch Statements on Ranges
//=============================================

let classNumber = 2.3 // 2.3 from Coalition for Queens (C4Q) prior to changing to Pursuit

switch classNumber {
case 0..<2:  // half-open range
    print("It's 2014, Coalition for Queens was founded, now known as Puruit. Also Swift was announced that year.")
case 2..<3:
    print("It's 2015 and Objective-C is still the leading language to write iOS apps.")
case 3..<4:
    print("2016")
case 4..<5:
    print("2017")
case 5..<6:
    print("2018")
case 6..<7:
    print("It's 2019 and SwiftUI was introduced at WWDC in San Jose")
default:
    print("See you in 2020")

    
    // There's a lot to look for with switch statements  such as the colons, must have a default etc.
}

//=============================================
//           Tuples
//=============================================

/* great tool for printing out coordinates */

let coordinate = (40.7429595, -73.9441102) // you can add as many values as you want
coordinate.0
coordinate.1

let socials = (twitter: "@alexpaul", instagram: "@alexpaul")
socials.twitter
socials.instagram

//=============================================
//           Switch Statements on Tuple
//=============================================

let kim = (age: 19, cohort: 6.1, passion: "music")
let heather = (age: 23, cohort: 6.4, passion: "Immigration Rights")
let nancy = (age: 34, cohort: 6.3, passion: "video games")

let currentFellow = kim
switch currentFellow {
    case(18..<21, _,_):
    print("not allowed to drink at events")
case(_, 6.3,_):
    print("iOS is awesome!!!!")
case(_,_, "videogames"):
    print("see you at Pursuit's Game night, bring the drinks")
default:
    print("not a current fellow")
}
print(kim.age)





var grade1 = 7.0
var grade2 = 9.0
var grade3 = 5.0
var classAverage = ( grade1 + grade2 + grade3 ) / 3

var yourGrade = 7.3
if yourGrade > classAverage {
    print("above average")
} else {
    print("below average")
}

var a = 2
var b = 3
var c = 2

print(a == b || a == c || b == c ? "At least two variables havwe the same value" : "All the values are different")



var apples = 4
if apples == 1 {
print("You don't have a lot of apples")
} else {
    print("You have a lot apples")
}
apples == 1 ? "You don't have a lot of apples" : "You have a lot of apples"

var score = 75
if score >= 50 {
 print("You win!")
}
else {score <= 50
 print("You lose!")
}

//         Example from Check-In      //

// a constant can ONLY be initial;ized once 
var numberOfBagels = 15
let isOverADozen: Bool // variable is getting declared but not initialized
if numberOfBagels > 12 {
    isOverADozen = true
} else {
    isOverADozen = false
}
// isOverADozen = false ; this causes an error because it has already been initalized in the previous if/else statement
if isOverADozen { // isOverADozen is true here
    print("You have more than 12!")
} else {
    print("You have less than 12!")
}


let numberGrade = 65
switch numberGrade {
case 100... :
    print("A+")
case 90...99 :
    print("A")
case 80...89 :
    print("B")
case 70...79 :
    print("C")
case 65...69 :
    print("D")
default :
    print("F")
}


/*let myString = "Apple"
for character in myString.characters {
 print(character)
}
 */

var myString = "abc"
for character in myString {
 for _ in 0...2 {
 print(character, terminator:"")
 }
}

