//: [Previous](@previous)

import Foundation

// Bubble Sort

// 1st Iteration
// 9,5,6,1,2
// 5,6,1,2,9

// 2nd Iteration
// 5,1,2,6,9

// 3rd
// 1,2,5,6,9

// FIN
// Never use this crap 💩
// It has a big O complexity O(n^2) (worst case)
// Just take look at the example below, its evil 👹

enum SwapError : Error {
    case OutOfBounds
}

extension Array where Element : Comparable {
    
    var maxIndex: Int {
        return self.count - 1
    }
    
    mutating func swap(objectAtIndex index1: Int, withObjectAtIndex index2: Int) throws {
        guard  (index1 < self.count.hashValue || index2 < self.count.hashValue) else {
            throw SwapError.OutOfBounds
        }
        
        guard index1 != index2 else {
            return
        }
        
        (self[index1],self[index2]) = (self[index2],self[index1])
    }
    
    // Return Swap Count
    mutating func bubbleSort() throws -> Int {
        var swapCount = 0
        for rightBounds in [Int](1...maxIndex).reversed() {
            for index in 0...rightBounds {
                guard index + 1 < self.count else { break }
                if self[index] > self[index+1] {
                    try swap(objectAtIndex: index, withObjectAtIndex: index + 1)
                    swapCount = swapCount + 1
                }
            }
        }
        
        return swapCount
    }
}


// Testing Swap extension

var array = [1,2,3]
try! array.swap(objectAtIndex: 0, withObjectAtIndex: 2)
array

// Lets sort some arrays
// We create 50 arrays which are sorted the wrong direction
// Lets see how much swaps we need at each of them?

var swaps = 0
for length in 2...50 {
    var intArray: [Int] = (0...length).map({ $0 })
    var reversedArray = Array(intArray.reversed())
    swaps = try reversedArray.bubbleSort()
    print(reversedArray)
}


//: [Next](@next)
