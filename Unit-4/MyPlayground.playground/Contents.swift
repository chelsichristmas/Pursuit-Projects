import UIKit


//Determine if a given string is a palindrome (the same backwards and forwards) ignoring capitalization and punctuation.
func checkPalindrome(str: String) -> Bool {
    
    var arr = Array(str)
    
    var reversed = ""
    
    guard !arr.isEmpty else {
        return false
    }
    
    for _ in arr {
    
        reversed += String(arr.last ?? "a")  // unwrapping issue**
        arr.removeLast()
    }
    
    if str == reversed {
        return true
    }
    
    else {
         return false
    }
        
   
}
checkPalindrome(str: "race")


