//
//  PriorityQueue.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 18/08/25.
//

import Foundation
// Helper: Min-Heap / Priority Queue
struct PriorityQueue {
    private var heap: [ListNode] = []
    
    mutating func push(_ node: ListNode) {
        heap.append(node)
        heap.sort { $0.val < $1.val }
    }
    
    mutating func pop() -> ListNode? {
        guard !heap.isEmpty else { return nil }
        return heap.removeFirst()
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
}
