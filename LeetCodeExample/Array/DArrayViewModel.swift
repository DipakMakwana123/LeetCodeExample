//
//  DArrayViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 14/08/25.
//

import Foundation

struct DArrayViewModel {
    private let dArray: DArray
    
    init(dArray: DArray = .init()) {
        self.dArray = dArray
    }
    
    func productOfArrayExceptSelf() {
        var nums = [1, 2, 3, 4]
        var result = dArray.A1_productOfArrayExceptSelf(nums)
        print("Input: \(nums)") // Expected: [24, 12, 8, 6]
        print("Output: \(result)") // Output: [24, 12, 8, 6]
        
        nums = [-1, 1, 0, -3, 3]
        result = dArray.A1_productOfArrayExceptSelf(nums)
        print("Input: \(nums)") // Expected: [0, 0, 9, 0, 0]
        print("Output: \(result)") // Output: [0, 0, 9, 0, 0]
        
        // Example 3: Single element
        nums = [7]
        result = dArray.A1_productOfArrayExceptSelf(nums)
        print("Input: \(nums)") // Expected: [1] (product of empty set is 1)
        print("Output: \(result)") // Output: [1]
        
        // Example 4: Two elements
        nums = [5, 10]
        result = dArray.A1_productOfArrayExceptSelf(nums)
        print("Input: \(nums)") // Expected: [10, 5]
        print("Output: \(result)") // Output: [10, 5]
    }
    func getSumOfTwoNumber() {
        let nums1 = [2, 7, 11, 15]
        let target1 = 9
        let result1 = dArray.A2_twoSum(nums1, target1)
        print("Nums: \(nums1), Target: \(target1) -> Result: \(result1)") // Expected: [0, 1]
    }
    
    func twoSum() {
        var arr: [Int] = [2,7,11,15]
        var target = 9
        var res = dArray.A2_twoSum(arr, target)
        print("[2,7,11,15]: Expected:[0,1] Current :  \(res)")
        arr = [3,2,4]
        target = 6
        res = dArray.A2_twoSum(arr, target)
        print("[3,2,4] Expected:[1,2]Current: \(res)")
        
        arr = [3,3]
        target = 6
        res = dArray.A2_twoSum(arr, target)
        print("[3,3] Expected:[0,1] Current: \(res)")
    }
    
    
    
    func maxProfit() {
        //   print(leetCode.maxProfit([7,1,5,3,6,4])) // Expected: 5
        
        print(dArray.A3_maxProfit([7,2,10,1,3,6,4])) // Expected: 8
        
        // Example 2: No profit possible (prices always decrease)
        print(dArray.A3_maxProfit([7,6,4,3,1])) // Expected: 0
        
        // Example 3: Prices increase then decrease
        print(dArray.A3_maxProfit([2,4,1]))     // Expected: 2 (Buy at 2, Sell at 4)
        
        // Example 4: Single element
        print(dArray.A3_maxProfit([10]))       // Expected: 0
        
        // Example 5: Empty array
        print(dArray.A3_maxProfit([]))         // Expected: 0
    }
    
    func dailyTemperatures() {
        let arr = [73,74,75,71,69,72,76,73]
        print("[73,74,75,71,69,72,76,73]: \(dArray.A4_dailyTemperatures(arr))")
    }
    func totalFruit() {
        let fruits1 = [1,2,1]
        let result1 = dArray.A5_totalFruit(fruits1)
        print("Fruits: \(fruits1)")
        print("Max Fruits: \(result1)") // Expected: 3
        print("---")
        
        // Example 2: Stop due to third fruit type
        let fruits2 = [0,1,2,2]
        let result2 = dArray.A5_totalFruit(fruits2)
        print("Fruits: \(fruits2)")
        print("Max Fruits: \(result2)") // Expected: 3
        print("---")
        
        //Example 4: All same fruit type
        let fruits4 = [3,3,3,3,3]
        let result4 = dArray.A5_totalFruit(fruits4)
        print("Fruits: \(fruits4)")
        print("Max Fruits: \(result4)") // Expected: 5
        print("---")
        
        // Example 5: Two alternating fruit types
        let fruits5 = [1,0,1,4,1,4,1,2]
        let result5 = dArray.A5_totalFruit(fruits5)
        print("Fruits: \(fruits5)")
        print("Max Fruits: \(result5)") // Expected: 5 (for [1,4,1,4,1])
        print("---")
        
        // Example 6: Empty array (handled by guard statement)
        let fruits6: [Int] = []
        let result6 = dArray.A5_totalFruit(fruits6)
        print("Fruits: \(fruits6)")
        print("Max Fruits: \(result6)") // Expected: 0
        print("---")
        
        // Example 7: Two types, then a new one, then back to two
        let fruits7 = [1,1,2,2,3,3,1,1]
        let result7 = dArray.A5_totalFruit(fruits7)
        print("Fruits: \(fruits7)")
        print("Max Fruits: \(result7)") // Expected: 4 (for [1,1,2,2] or [2,2,3,3] or [3,3,1,1])
        print("---")
    }
    func setBricks() {
        var arr = [7, 15, 10, 8]
        print("[7, 15, 10, 8]: expected 7) : \(dArray.A6_setBricks(&arr))")
        
        arr = [11, 10, 8, 12, 8, 10, 11]
        print("[11, 10, 8, 12, 8, 10, 11]: expected 6 \(dArray.A6_setBricks(&arr))")
        
        arr = [7, 14, 10]
        print("[7, 14, 10]: expected -1 \(dArray.A6_setBricks(&arr))")
    }
    func merge() {
        let nums1_1 = [1,2,3,0,0,0]
        let m1 = 3
        let nums2_1 = [2,5,6]
        let n1 = 3
        
        print(
            "Example 1 Merged: \(dArray.A7_merge(nums1_1, m1, nums2_1, n1))"
        ) // Output: [1, 2, 2, 3, 5, 6]
        
        //        let nums1_4 = [4,5,6]
        //        let m4 = 3
        //        let nums2_4 = [1,2,3,0,0,0]
        //        let n4 = 3
        //        print("Example 4 Merged: \( leetCode.merge(nums1_4, m4, nums2_4, n4))") // Output: [1, 2, 3, 4, 5, 6]
    }
    func maxArea() {
        print("\nHeight: [0,1,0,2,1,0,1,3,2,1,2,1]  Expected 6")
        print(dArray.A8_maxArea([0,1,0,2,1,0,1,3,2,1,2,1])) // Expected 6
        print(dArray.A8_maxArea([0,1,10,2,1,0,1,3,2,1,2,1])) // Expected
        print("\nHeight: [1,2,3,4,5]")
        print("Trapped Water: \(dArray.A8_maxArea([1,2,3,4,5]))") // Expected: 0
        print("\nHeight: [5,4,3,2,1]")
        print("Trapped Water: \(dArray.A8_maxArea([5,4,3,2,1]))") // Expected: 0
        
        // Example 4: Peak in middle
        print("\nHeight: [4,2,0,3,2,5]")
        print("Trapped Water: \(dArray.A8_maxArea([4,2,0,3,2,5]))") // Expected: 9 (2 at index 1, 4 at index 2, 1 at index 4)
        
        //Example 5: No water (too few bars)
        print("\nHeight: [1,2]")
        print("Trapped Water: \(dArray.A8_maxArea([1,2]))") // Expected: 0
        
        // Example 6: Empty array
        print("\nHeight: []")
        print("Trapped Water: \(dArray.A8_maxArea([]))") // Expected: 0
        
        // Example 7: Example from problem with leading/trailing zeros
        print("\nHeight: [0,1,0,2,1,0,1,3,2,1,2,1]")
        print("Trapped Water: \(dArray.A8_maxArea([0,1,0,2,10,0,1,3,2,1,2,1]))") // Expected: 7
    }
    func findMinFuelStationToReachDestination() {
        let target1 = 100
        let startFuel1 = 10
        let capacity1 = 100
        let stations1 = [[10,60],[20,30],[30,30],[60,40]]
        print("Example 1: Min Refuels = Expected Output 2 \(dArray.A9_findMinFuelStationToReachDestination(target: target1, startFuel: startFuel1, capacity: capacity1, gasStations: stations1))")
    }
    
    func solveSudoku() {
        var board: [[Character]] = [
            ["5","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ]
        
        dArray.A11_solveSudoku(&board)
        print(board)
    }
    func firstMissingPositive() {
        print("Expected 3: Current \(dArray.A12_firstMissingPositive([1,2,0]))")        // 3
        print(dArray.A12_firstMissingPositive([3,4,-1,1]))     // 2
        print(dArray.A12_firstMissingPositive([7,8,9,1,12]))  // 1
        print(dArray.A12_firstMissingPositive([1,2,3]))  // 1
    }
    func maxSubArray(){
        print(dArray.A13_maxSubArray([-2,1,-3,4,-1,2,1,-5,4])) // 6  (subarray [4,-1,2,1])
        print(dArray.A13_maxSubArray([1]))                     // 1
        print(dArray.A13_maxSubArray([5,4,-1,7,8]))            // 23
    }
    func maxProduct(){
        print(dArray.A14_maxProduct([2,3,-2,4]))   // 6   (subarray [2,3])
        print(dArray.A14_maxProduct([-2,0,-1]))    // 0   (subarray [0])
        print(dArray.A14_maxProduct([-2,3,-4]))    // 24  (subarray [-2,3,-4])
    }
    func findMin(){
        print(dArray.A15_findMin([3,4,5,1,2]))   // 1
        print(dArray.A15_findMin([4,5,6,7,0,1,2])) // 0
        print(dArray.A15_findMin([11,13,15,17])) // 11
    }
    func A16_search(){
        print(dArray.A16_search([4,5,6,7,0,1,2], 0))  // 4
        print(dArray.A16_search([4,5,6,7,0,1,2], 3))  // -1
        print(dArray.A16_search([1], 0))              // -1
    }
    func A17_twoSum(){
        print(dArray.A17_twoSum([2,7,11,15], 9))   // [1,2]
        print(dArray.A17_twoSum([2,3,4], 6))       // [1,3]
        print(dArray.A17_twoSum([-1,0], -1))       // [1,2]
    }
    func threeSum() {
        print(dArray.A18_threeSum([-1,0,1,2,-1,-4]))
        // [[-1, -1, 2], [-1, 0, 1]]
        print(dArray.A18_threeSum([0,1,1]))  // []
        print(dArray.A18_threeSum([0,0,0]))  // [[0,0,0]]
    }
    func isAlienSorted() {
        print(dArray.A19_isAlienSorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz"))
        // Expected: true

        print(dArray.A19_isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz"))
        // Expected: false

        print(dArray.A19_isAlienSorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz"))
        // Expected: false

        print(dArray.A19_isAlienSorted(["app","apple"], "abcdefghijklmnopqrstuvwxyz"))
        // Expected: true
    }
    func nextPermutation() {
        var arr1 = [1,2,3]
        dArray.A20_nextPermutation(&arr1)
        print(arr1)  // [1,3,2]

        var arr2 = [3,2,1]
        dArray.A20_nextPermutation(&arr2)
        print(arr2)  // [1,2,3]

        var arr3 = [1,1,5]
        dArray.A20_nextPermutation(&arr3)
        print(arr3)  // [1,5,1]
    }
    func removeDuplicate() {
        var arr1 = [1,1,2]
        print(dArray.A21_removeDuplicates(&arr1))  // 2
        print(arr1)  // [1,2,_]

        var arr2 = [0,0,1,1,1,2,2,3,3,4]
        print(dArray.A21_removeDuplicates(&arr2))  // 5
        print(arr2)  // [0,1,2,3,4,_...]
    }
    func searchRange(){
        print(dArray.A22_searchRange([5,7,7,8,8,10], 8))
        // [3,4]
        print(dArray.A22_searchRange([5,7,7,8,8,10], 6))
        // [-1,-1]
        print(dArray.A22_searchRange([], 0))
    }
    func trap(){
        print(dArray.A9_trap([0,1,0,2,1,0,1,3,2,1,2,1]))
        // 6
        print(dArray.A9_trap([4,2,0,3,2,5]))
        // 9
        print(dArray.A9_trap([1,0,2,1,0,1,3]))
        // 5
    }
    func findMedianSortedArrays(){
        print(dArray.A24_findMedianSortedArrays([1,3], [2]))        // 2.0
        print(dArray.A24_findMedianSortedArrays([1,2], [3,4]))      // 2.5
        print(dArray.A24_findMedianSortedArrays([0,0], [0,0]))      // 0.0
        print(dArray.A24_findMedianSortedArrays([], [1]))           // 1.0
        print(dArray.A24_findMedianSortedArrays([2], []))           // 2.0
    }
    func isAnagram(){
        print(dArray.A25_isAnagram("anagram", "nagaram")) // true
        print(dArray.A25_isAnagram("rat", "car"))         // false
    }
    func topKFrequent(){
        print(dArray.A26_topKFrequent([1,1,1,2,2,3], 2)) // [1, 2]
        print(dArray.A26_topKFrequent([1], 1))           // [1]
        print(dArray.A26_topKFrequent([4,4,4,5,5,6], 2)) // [4, 5]
    }
    func isValidSudoku(){
        let board1: [[Character]] = [
            ["5","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ]
        print(dArray.A27_isValidSudoku(board1)) // true

        let board2: [[Character]] = [
            ["8","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ]
        print(dArray.A27_isValidSudoku(board2)) // false
    }
    func longestConsecutive(){
        print(dArray.A28_longestConsecutive([100,4,200,1,3,2])) // 4 (sequence: 1,2,3,4)
        print(dArray.A28_longestConsecutive([0,3,7,2,5,8,4,6,0,1])) // 9 (sequence: 0–8)
    }
    func sortColors() {
        var arr = [2,0,2,1,1,0]
        dArray.A29_sortColors(&arr)
        print(arr)  // [0,0,1,1,2,2]
    }
    func majorityElement(){
        print(dArray.A30_majorityElement([3,2,3]))       // 3
        print(dArray.A30_majorityElement([2,2,1,1,1,2,2])) // 2
    }
    
    
}
