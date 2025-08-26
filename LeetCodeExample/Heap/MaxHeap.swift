//
//  MaxHeap.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 19/08/25.
//

import Foundation
class MaxHeap {
    private var heap: [Int] = []
    
    var isEmpty: Bool { heap.isEmpty }
    var count: Int { heap.count }
    
    func peek() -> Int? { heap.first }
    
    func insert(_ val: Int) {
        heap.append(val)
        siftUp(heap.count - 1)
    }
    
    func removeMax() -> Int? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        let maxVal = heap[0]
        heap[0] = heap.removeLast()
        siftDown(0)
        return maxVal
    }
    
    private func siftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && heap[child] > heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private func siftDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var largest = parent
            
            if left < heap.count && heap[left] > heap[largest] {
                largest = left
            }
            if right < heap.count && heap[right] > heap[largest] {
                largest = right
            }
            if largest == parent { break }
            heap.swapAt(parent, largest)
            parent = largest
        }
    }
    func lastStoneWeight(_ stones: [Int]) -> Int {
        let heap = MaxHeap()
        
        // Insert all stones
        for stone in stones {
            heap.insert(stone)
        }
        
        // Smash until one or zero left
        while heap.count > 1 {
            let first = heap.removeMax()!
            let second = heap.removeMax()!
            
            if first != second {
                heap.insert(first - second)
            }
        }
        
        return heap.peek() ?? 0
    }
}
