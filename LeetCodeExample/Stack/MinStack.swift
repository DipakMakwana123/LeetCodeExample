//
//  MinStack.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 18/07/25.
//

import Foundation
class MinStack {
    
    var myStack: [Int]

    init() {
        myStack = [Int]()
    }
    
    func push(_ val: Int) {
        myStack.append(val)
    }
    
    func pop() {
        guard !myStack.isEmpty else { return }
        myStack.removeLast()
    }
    
    func top() -> Int {
        guard !myStack.isEmpty else { return 0}
        let top = myStack.count - 1 
        return myStack[top]
    }
    
    func getMin() -> Int {
        guard !myStack.isEmpty else { return 0}
        var  minValue = myStack[0]
        for ind in 1..<myStack.count {
            minValue = min(minValue,myStack[ind])
        }
        return minValue
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
