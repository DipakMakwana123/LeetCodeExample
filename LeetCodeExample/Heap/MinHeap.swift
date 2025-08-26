//
//  MinHeap.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 19/08/25.
//

import Foundation
/*struct MinHeap<T: Comparable> {
    private var heap: [T] = []
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var count: Int {
        return heap.count
    }
    
    func peek() -> T? {
        return heap.first
    }
    
    mutating func insert(_ value: T) {
        heap.append(value)
        siftUp(heap.count - 1)
    }
    
    mutating func extractMin() -> T? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 {
            return heap.removeFirst()
        }
        let minValue = heap[0]
        heap[0] = heap.removeLast()
        siftDown(0)
        return minValue
    }
    
    // MARK: - Helpers
    
    private mutating func siftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && heap[child] < heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func siftDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var smallest = parent
            
            if left < heap.count && heap[left] < heap[smallest] {
                smallest = left
            }
            if right < heap.count && heap[right] < heap[smallest] {
                smallest = right
            }
            if smallest == parent { return }
            heap.swapAt(parent, smallest)
            parent = smallest
        }
    }
}*/
struct MinHeap {
    private var heap: [Int] = []
    
    var count: Int { heap.count }
    var peek: Int? { heap.first }
    
    mutating func insert(_ val: Int) {
        heap.append(val)
        siftUp(heap.count - 1)
    }
    
    mutating func removeMin() -> Int? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        let minVal = heap[0]
        heap[0] = heap.removeLast()
        siftDown(0)
        return minVal
    }
    
    private mutating func siftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && heap[child] < heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func siftDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var smallest = parent
            
            if left < heap.count && heap[left] < heap[smallest] {
                smallest = left
            }
            if right < heap.count && heap[right] < heap[smallest] {
                smallest = right
            }
            if smallest == parent { break }
            heap.swapAt(parent, smallest)
            parent = smallest
        }
    }
    
}
