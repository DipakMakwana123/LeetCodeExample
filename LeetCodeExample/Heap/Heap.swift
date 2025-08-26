struct Heap1 {
    func H1_kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        // dist, x, y
        var ans = [(Int, Int, Int)]()
        for p in points {
            let dist = p[0] * p[0] + p[1] * p[1]
            ans.append((dist, p[0], p[1]))
        }
        ans.sort(by: { $0.0 < $1.0 })
        return ans.prefix(k).map { [$0.1, $0.2]}
    }
    func H2_kClosest1(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var points = points.sorted { ($0[0] * $0[0] + $0[1] * $0[1]) < ($1[0] * $1[0] + $1[1] * $1[1]) }
        return Array(points[0..<k])
    }
    func H3_findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = MinHeap()
        
        for num in nums {
            heap.insert(num)
            if heap.count > k {
                _ = heap.removeMin()
            }
        }
        return heap.peek!
    }
    func H4_621_leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var frequencyHash: [Character: Int] = [:]
        let totalJobs = tasks.count
        
        tasks.forEach { task in
            frequencyHash[task, default: 0] += 1
        }
        
        let maxFrequency = frequencyHash.max(by: { $0.value < $1.value })!.value
        
        let jobsWithMaxFrequency = frequencyHash.filter { $1 == maxFrequency }.count
        
        let fullCycleLength = (maxFrequency - 1) * (n + 1) + jobsWithMaxFrequency
        
        return max(fullCycleLength, totalJobs)
    }
    
    func highFive(_ items: [[Int]]) -> [[Int]] {
        // Dictionary: studentId -> MinHeap of scores
        var map = [Int: [Int]]()
        
        for item in items {
            let id = item[0], score = item[1]
            if map[id] == nil { map[id] = [] }
            map[id]!.append(score)
        }
        
        var result: [[Int]] = []
        
        for (id, scores) in map {
            // keep top 5 using sorting (since scores count is small, often <= 5)
            let topFive = scores.sorted(by: >).prefix(5)
            let avg = topFive.reduce(0, +) / topFive.count
            result.append([id, avg])
        }
        
        // sort by studentId ascending
        return result.sorted { $0[0] < $1[0] }
    }
    
    public class Interval {
        public var start: Int
        public var end: Int
        public init(_ start: Int, _ end: Int) {
            self.start = start
            self.end = end
        }
    }
    func employeeFreeTime(_ schedule: [[Interval]]) -> [Interval] {
        var allIntervals: [Interval] = []
        
        // 1. Flatten all schedules
        for employee in schedule {
            allIntervals.append(contentsOf: employee)
        }
        
        // 2. Sort by start
        allIntervals.sort { $0.start < $1.start }
        
        // 3. Merge intervals
        var merged: [Interval] = []
        var current = allIntervals[0]
        
        for i in 1..<allIntervals.count {
            let interval = allIntervals[i]
            if interval.start <= current.end {
                current.end = max(current.end, interval.end)
            } else {
                merged.append(current)
                current = interval
            }
        }
        merged.append(current)
        
        // 4. Find gaps (free time)
        var result: [Interval] = []
        for i in 1..<merged.count {
            let prev = merged[i-1]
            let next = merged[i]
            if prev.end < next.start {
                result.append(Interval(prev.end, next.start))
            }
        }
        
        return result
    }
    
    
    
}

//
//  Heap.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 18/08/25.
//

import Foundation

//struct MinHeap<T: Comparable> {
//    private var elements: [T] = []
//    
//    var isEmpty: Bool { elements.isEmpty }
//    var count: Int { elements.count }
//    func peek() -> T? { elements.first }
//    
//    mutating func insert(_ value: T) {
//        elements.append(value)
//        siftUp(elements.count - 1)
//    }
//    
//    mutating func remove() -> T? {
//        guard !elements.isEmpty else { return nil }
//        elements.swapAt(0, elements.count - 1)
//        let val = elements.removeLast()
//        siftDown(0)
//        return val
//    }
//    
//    private mutating func siftUp(_ index: Int) {
//        var child = index
//        var parent = (child - 1) / 2
//        while child > 0 && elements[child] < elements[parent] {
//            elements.swapAt(child, parent)
//            child = parent
//            parent = (child - 1) / 2
//        }
//    }
//    
//    private mutating func siftDown(_ index: Int) {
//        var parent = index
//        while true {
//            let left = 2 * parent + 1
//            let right = 2 * parent + 2
//            var candidate = parent
//            
//            if left < count && elements[left] < elements[candidate] {
//                candidate = left
//            }
//            if right < count && elements[right] < elements[candidate] {
//                candidate = right
//            }
//            if candidate == parent { return }
//            elements.swapAt(parent, candidate)
//            parent = candidate
//        }
//    }
//}

struct Heap<T> {
    var elements: [T]
    let priority: (T, T) -> Bool
    
    init(priority: @escaping (T, T) -> Bool) {
        self.elements = []
        self.priority = priority
    }
    
    var isEmpty: Bool { elements.isEmpty }
    
    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(elements.count - 1)
    }
    
    mutating func extract() -> T? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let value = elements.removeLast()
        siftDown(0)
        return value
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
            
            if left < elements.count && priority(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < elements.count && priority(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
