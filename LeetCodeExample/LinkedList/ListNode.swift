//
//  ListNode.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 18/08/25.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode? // next is an Optional, meaning it can be nil
    public init() {
        self.val = 0;
        self.next = nil;
    }
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
    }
}

// Definition for a Node.
public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
