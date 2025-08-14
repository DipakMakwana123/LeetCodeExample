//
//  StackViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 14/08/25.
//

import Foundation

struct StackViewModel {
    private let stack:  DStack
    
    init(stack: DStack = .init()) {
        self.stack = stack
    }
    func minStack() {
        stack.push(-2)
        stack.push(0)
        stack.push(-3)
        
        print("\(stack.getMin())") //  // return -3)
        stack.pop();
        
        print("\(stack.top())") // 0
        print("\(stack.getMin())") //  // return -2)
    }
}
