//: [Previous](@previous)

import Foundation

// FIFO

public struct Queue<T> {
    
    private var managedArray : [T]  = [T]()
    
    public var count : Int {
        return self.managedArray.count
    }
    
    public var isEmpty : Bool {
        return self.managedArray.isEmpty
    }
    
    public mutating func enqueue(element: T) {
        managedArray.insert(element, at: 0)
    }
    
    public mutating func dequeue() -> T? {
        return managedArray.popLast()
    }
}

var stack = Queue<Int>()

for pushedValue in 0...20 {
    print("Pushes: \(pushedValue)")
    stack.enqueue(element: pushedValue)
}

for index in 0...stack.count {
    guard let value = stack.dequeue() else {
        print("Stack is empty now")
        break
    }
    print("Enqueued \(value)")
}

//: [Next](@next)
