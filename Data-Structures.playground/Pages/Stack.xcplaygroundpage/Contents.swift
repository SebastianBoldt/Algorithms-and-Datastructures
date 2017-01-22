//: [Previous](@previous)

import Foundation

// LIFO

public struct Stack<T> {
    
    private var managedArray : [T]  = [T]()
    
    public var count : Int {
        return self.managedArray.count
    }
    
    public var isEmpty : Bool {
        return self.managedArray.isEmpty
    }
    
    public mutating func push(element: T) {
        managedArray.append(element)
    }
    
    public mutating func pop() -> T? {
        return managedArray.popLast()
    }
}

var stack = Stack<Int>()

for pushedValue in 0...20 {
    print("Pushes: \(pushedValue)")
    stack.push(element: pushedValue)
}

for index in 0...stack.count {
    guard let value = stack.pop() else {
        print("Stack is empty now")
        break
    }
    print("Popped \(value)")
}


