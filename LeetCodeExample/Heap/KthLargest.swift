//
//  KthLargest.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 19/08/25.
//
class KthLargest {
    private let k: Int
    private var heap: [Int] = []
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            let _ = add(num)
        }
    }
    
    func add(_ val: Int) -> Int {
        insert(val)
        if heap.count > k {
            removeMin()
        }
        return heap.first ?? -1
    }
    
    // MARK: - Min Heap Operations
    private func insert(_ val: Int) {
        heap.append(val)
        siftUp(heap.count - 1)
    }
    
    private func removeMin() {
        guard !heap.isEmpty else { return }
        heap[0] = heap[heap.count - 1]
        heap.removeLast()
        siftDown(0)
    }
    
    private func siftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && heap[child] < heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private func siftDown(_ index: Int) {
        var parent = index
        let n = heap.count
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var smallest = parent
            
            if left < n && heap[left] < heap[smallest] {
                smallest = left
            }
            if right < n && heap[right] < heap[smallest] {
                smallest = right
            }
            if smallest == parent { break }
            heap.swapAt(parent, smallest)
            parent = smallest
        }
    }
}

/*
 import Collections

 class KthLargest {

     private var k: Int
     private var heap = Heap<Int>()

     init(_ k: Int, _ nums: [Int]) {
         self.k = k
         
         for num in nums {
             if heap.count >= k {
                 heap.insert(num)
                 heap.popMin()
             } else {
                 heap.insert(num)
             }
         }

         print(heap.count)
     }
     
     func add(_ val: Int) -> Int {
         if heap.count >= k {
             heap.insert(val)
             heap.popMin()
         } else {
             heap.insert(val)
         }
         return heap.min ?? 0
     }
 }

 /**
  * Your KthLargest object will be instantiated and called as such:
  * let obj = KthLargest(k, nums)
  * let ret_1: Int = obj.add(val)
  */
 */
