//
//  MaxStack.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 19/08/25.
//

class MaxStack {
    private var stack: [Int]
    private var maxStack: [Int]
    
    init() {
        stack = []
        maxStack = []
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if let last = maxStack.last {
            maxStack.append(max(x, last))
        } else {
            maxStack.append(x)
        }
    }
    
    func pop() -> Int {
        maxStack.removeLast()
        return stack.removeLast()
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func peekMax() -> Int {
        return maxStack.last!
    }
    
    func popMax() -> Int {
        let maxVal = peekMax()
        var buffer: [Int] = []
        
        // Pop until we find the max
        while let last = stack.last, last != maxVal {
            buffer.append(pop())
        }
        
        // Remove the maximum
        _ = pop()
        
        // Push back buffer elements
        while !buffer.isEmpty {
            push(buffer.removeLast())
        }
        
        return maxVal
    }
}
