//
//  MedianFinder 2.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 19/08/25.
//


import Foundation

// MinHeap using Swift's built-in PriorityQueue (Array + heapify)

class MedianFinder {
    struct Heap<T> {
        var elements: [T]
        let priority: (T, T) -> Bool
        
        init(priority: @escaping (T, T) -> Bool) {
            self.elements = []
            self.priority = priority
        }
        
        var isEmpty: Bool { elements.isEmpty }
        var count: Int { elements.count }
        
        func peek() -> T? { elements.first }
        
        mutating func push(_ value: T) {
            elements.append(value)
            siftUp(elements.count - 1)
        }
        
        mutating func pop() -> T? {
            guard !elements.isEmpty else { return nil }
            elements.swapAt(0, elements.count - 1)
            let item = elements.removeLast()
            siftDown(0)
            return item
        }
        
        private mutating func siftUp(_ index: Int) {
            var child = index
            var parent = (child - 1) / 2
            while child > 0 && priority(elements[child], elements[parent]) {
                elements.swapAt(child, parent)
                child = parent
                parent = (child - 1) / 2
            }
        }
        
        private mutating func siftDown(_ index: Int) {
            var parent = index
            while true {
                let left = 2 * parent + 1
                let right = 2 * parent + 2
                var candidate = parent
                
                if left < count && priority(elements[left], elements[candidate]) {
                    candidate = left
                }
                if right < count && priority(elements[right], elements[candidate]) {
                    candidate = right
                }
                if candidate == parent { return }
                elements.swapAt(parent, candidate)
                parent = candidate
            }
        }
    }
    private var maxHeap = Heap<Int>(priority: >)  // left side (smaller half)
    private var minHeap = Heap<Int>(priority: <)  // right side (larger half)
    
    init() {}
    
    func addNum(_ num: Int) {
        if maxHeap.isEmpty || num <= maxHeap.peek()! {
            maxHeap.push(num)
        } else {
            minHeap.push(num)
        }
        
        // Balance heaps
        if maxHeap.count > minHeap.count + 1 {
            if let val = maxHeap.pop() {
                minHeap.push(val)
            }
        } else if minHeap.count > maxHeap.count {
            if let val = minHeap.pop() {
                maxHeap.push(val)
            }
        }
    }
    
    func findMedian() -> Double {
        if maxHeap.count == minHeap.count {
            return (Double(maxHeap.peek()! + minHeap.peek()!)) / 2.0
        } else {
            return Double(maxHeap.peek()!)
        }
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
