//
//  BinarySearchViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 27/08/25.
//

import Foundation

struct SearchViewModel {
    private var binarySearch: BinarySearch
    
    init(binarySearch: BinarySearch = .init()) {
        self.binarySearch = binarySearch
    }
    
    func search() {
        let nums = [-1,0,3,5,9,12], target = 9
        print(binarySearch.s1_704_search(nums, target))
    }
    func searchMatrix() {
        print(binarySearch.s2_74_searchMatrix([
            [1,3,5,7],
            [10,11,16,20],
            [23,30,34,60]
        ], 3))   // true
        
        print(binarySearch.s2_74_searchMatrix([
            [1,3,5,7],
            [10,11,16,20],
            [23,30,34,60]
        ], 13))  // false
        
        print(binarySearch.s2_74_searchMatrix([[1]], 1))   // true
        
        print(binarySearch.s2_74_searchMatrix([[1,2,3,4,5]], 4))   // true
        
        print(binarySearch.s2_74_searchMatrix([[1],[3],[5],[7]], 6))   // false
        
    }
    func searchMatrixWithRecursion() {
        print(binarySearch.s2_74_searchMatrixWithRecursion([
            [1,3,5,7],
            [10,11,16,20],
            [23,30,34,60]
        ], 3))   // true
        
        print(binarySearch.s2_74_searchMatrixWithRecursion([
            [1,3,5,7],
            [10,11,16,20],
            [23,30,34,60]
        ], 13))  // false
        
        print(binarySearch.s2_74_searchMatrixWithRecursion([[1]], 1))   // true
        
        print(binarySearch.s2_74_searchMatrixWithRecursion([[1,2,3,4,5]], 4))   // true
        
        print(binarySearch.s2_74_searchMatrixWithRecursion([[1],[3],[5],[7]], 6))   // false
        
    }
    func minEatingSpeed() {
        let piles = [3,6,7,11], h = 8
        print(binarySearch.s3_875_minEatingSpeed(piles, h))   // false
    }
    func timeBasedKeyValueStore() {
        binarySearch.s4_981_timeBasedKeyValueStore()
    }
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if nums[mid] > nums[right] {
                // minimum is in the right half
                left = mid + 1
            } else {
                // minimum is in the left half
                right = mid
            }
        }
        
        return nums[left]
    }
    
}
