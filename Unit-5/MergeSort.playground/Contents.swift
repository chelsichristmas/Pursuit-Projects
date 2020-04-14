import UIKit

// MERGE SORT
// woret, best and average sort time is O(n log n)
// uses divide and co`nquer
// splits the arrya in two using the middle index
// uses recursion until abse case count isn't 1
// then merges individual arrays back together

func mergeSort(_ arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    let middleIndex = arr.count / 2
    
    //left array includes beginning array up to but not including the middle index
    let leftArray = mergeSort(Array(arr[..<middleIndex]))
    
    let rightArray = mergeSort(Array(arr[middleIndex...]))
    
    return merge(leftArray, rightArray)
}

//combine two sorted arrays

func merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T] {
  var leftIndex = 0
  var rightIndex = 0  
  var resultsArray = [T]()
  
  while leftIndex < leftArray.count && rightIndex < rightArray.count {
    let leftElement = leftArray[leftIndex]
    let rightElement = rightArray[rightIndex]
    
    // compare
    if leftElement < rightElement {
      resultsArray.append(leftElement)
      leftIndex += 1
    } else if leftElement > rightElement {
      resultsArray.append(rightElement)
      rightIndex += 1
    } else { // both equal, append both to the results array
      resultsArray.append(leftElement)
      leftIndex += 1
      resultsArray.append(rightElement)
      rightIndex += 1
    }
  }
  
  // out here append elements remaining in left, right arrays
  if leftIndex < leftArray.count {
    resultsArray.append(contentsOf: leftArray[leftIndex...])
  }
  
  if rightIndex < rightArray.count {
    resultsArray.append(contentsOf: rightArray[rightIndex...])
  }
  
  return resultsArray
}

let list = [12, 8, 29, -100, 0, 234]
let sortedList = mergeSort(list)
print(sortedList)

