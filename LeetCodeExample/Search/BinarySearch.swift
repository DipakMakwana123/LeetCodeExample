//
//  BinarySearch.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 27/08/25.
//

import Foundation

struct BinarySearch {
    // 704. Binary Search
    func s1_704_search(_ nums: [Int], _ target: Int) -> Int {
        func binarySearch(_ nums: [Int], _ target: Int, _ left: Int, _ right: Int) -> Int {
            if left > right {
                return -1
            }
            
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                return binarySearch(nums, target, mid + 1, right)
            } else {
                return binarySearch(nums, target, left, mid - 1)
            }
        }
        return binarySearch(nums, target, 0, nums.count - 1)
    }
    //74. Search a 2D Matrix
    func s2_74_searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        var left = 0
        var right = m * n - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            let row = mid / n
            let col = mid % n
            let midVal = matrix[row][col]
            
            if midVal == target {
                return true
            } else if midVal < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return false
    }
    
    
    func s2_74_searchMatrixWithRecursion(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        return binarySearch(matrix, target, 0, m * n - 1, n)
    }
    
    private func binarySearch(_ matrix: [[Int]], _ target: Int, _ left: Int, _ right: Int, _ n: Int) -> Bool {
        if left > right {
            return false
        }
        
        let mid = left + (right - left) / 2
        let row = mid / n
        let col = mid % n
        let midVal = matrix[row][col]
        
        if midVal == target {
            return true
        } else if midVal < target {
            return binarySearch(matrix, target, mid + 1, right, n)
        } else {
            return binarySearch(matrix, target, left, mid - 1, n)
        }
    }
    // 875. Koko Eating Bananas
    // min k such that hours < = h
    func s3_875_minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var left = 1
        var right = 1
        var res = 0
        for pile in piles {
            right = max(right, pile)
        }
        
        while left <= right {
            let mid = left + (right - left) / 2
            // calcaulate the hours
            var hours = 0
            for pile in piles {
                hours += (pile + mid - 1) / mid
                
                
            }
            if(hours <= h) {
                res = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return res
    }
    // 981. Time Based Key-Value Store
    
    func s4_981_timeBasedKeyValueStore() {
        let obj = TimeMap()

        // Case 1: Simple set/get
        obj.set("foo", "bar", 1)
        print(obj.get("foo", 1))  // "bar"
        print(obj.get("foo", 3))  // "bar"

        // Case 2: Updating value at later timestamp
        obj.set("foo", "bar2", 4)
        print(obj.get("foo", 4))  // "bar2"
        print(obj.get("foo", 5))  // "bar2"

        // Case 3: Query before any timestamp exists
        print(obj.get("foo", 0))  // ""

        // Case 4: Multiple keys
        obj.set("apple", "red", 2)
        obj.set("apple", "green", 5)
        print(obj.get("apple", 4))  // "red"
        print(obj.get("apple", 5))  // "green"
        print(obj.get("apple", 6))  // "green"

        // Case 5: No such key
        print(obj.get("banana", 10)) // ""

    }
    
    
    class TimeMap {
        private var store = [String: [(String, Int)]]()
        init() {
            
        }
        
        func set(_ key: String, _ value: String, _ timestamp: Int) {
            store[key, default: []].append((value, timestamp))
        }
        
        func get(_ key: String, _ timestamp: Int) -> String {
            guard let values = store[key] else { return "" }
            var left = 0
            var right = values.count - 1

            var value = ""

            while left <= right {
                let mid = left + (right - left) / 2
                let (midValue, midTimetamp) = values[mid]
                
                if midTimetamp == timestamp {
                    return midValue
                } else if timestamp > midTimetamp {
                    value = midValue
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }

            return value
        }
    }
}



