//: [Previous](@previous)

import Foundation

var unsortedArray = [0,1,1,2,3,5,8,13,21,34]
// It returns the success or failure state and the number of compares it made

struct BinarySearcher {
    
    private var internalCount = 0
    public var count : Int {
        return internalCount
    }
    
    private mutating func incrementCount() {
        internalCount = internalCount + 1
    }
    
    mutating func binarySearch<T: Comparable>(inArray array: [T], forValue value: T) -> Bool {
        
        if (array.count == 1) {
            incrementCount()
            if value == array[0] {
                return true
            }
            else {
                return false
            }
            
        } else {
            let splitIndex = Int(array.count/2)-1
            
            let leftSplit = array[0...splitIndex]
            let rightSplit = array[(splitIndex+1)...(array.count-1)]
            incrementCount()
            if leftSplit[leftSplit.count-1] < value {
                return binarySearch(inArray: Array(rightSplit), forValue: value)
            } else {
                return binarySearch(inArray: Array(leftSplit), forValue: value)
            }
        }
    }
}

var sortedArray = unsortedArray.sorted() // First we need to sort the array so we can apply the binary search
var binarySearcher = BinarySearcher()
binarySearcher.binarySearch(inArray: sortedArray, forValue: 1)
binarySearcher.count

//: [Next](@next)