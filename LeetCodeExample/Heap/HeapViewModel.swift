//
//  MinHeapViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 19/08/25.
//

import Foundation

struct HeapViewModel {
    
    func minHeapOperation() {
        var minHeap = MinHeap<Int>()
        minHeap.insert(10)
        minHeap.insert(4)
        minHeap.insert(15)
        minHeap.insert(20)
        minHeap.insert(1)
        
        print(minHeap.peek()!)       // 1 (minimum element)
        print(minHeap.extractMin()!) // 1
        print(minHeap.extractMin()!) // 4
        print(minHeap.extractMin()!) // 10
    }
    func lastStoneWeight() {
        let maxHeap = MaxHeap()
        print(maxHeap.lastStoneWeight([2,7,4,1,8,1])) // Output: 1
    }
    func findKthLargest() {
        let sol = Heap1()
        print(sol.H3_findKthLargest([3,2,1,5,6,4], 2))  // Output: 5
        print(sol.H3_findKthLargest([3,2,3,1,2,4,5,5,6], 4)) // Output: 4
    }
    func kClosest() {
        let sol = Heap1()
        print(sol.H1_kClosest([[1,3],[-2,2]], 1))   // Output: [[-2,2]]
        print(sol.H1_kClosest([[3,3],[5,-1],[-2,4]], 2)) // Output: [[3,3],[-2,4]]
    }
    
    func leastInterval(){
        
    }
    func highFive() {
        
    }
    func employeeFreeTime(){
        
    }
    func findMedian() {
        let median = MedianFinder()
    }
}
