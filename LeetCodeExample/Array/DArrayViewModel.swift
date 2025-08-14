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
        var result = dArray.productOfArrayExceptSelf(nums)
        print("Input: \(nums)") // Expected: [24, 12, 8, 6]
        print("Output: \(result)") // Output: [24, 12, 8, 6]
        
        nums = [-1, 1, 0, -3, 3]
        result = dArray.productOfArrayExceptSelf(nums)
        print("Input: \(nums)") // Expected: [0, 0, 9, 0, 0]
        print("Output: \(result)") // Output: [0, 0, 9, 0, 0]
        
        // Example 3: Single element
        nums = [7]
        result = dArray.productOfArrayExceptSelf(nums)
        print("Input: \(nums)") // Expected: [1] (product of empty set is 1)
        print("Output: \(result)") // Output: [1]
        
        // Example 4: Two elements
        nums = [5, 10]
        result = dArray.productOfArrayExceptSelf(nums)
        print("Input: \(nums)") // Expected: [10, 5]
        print("Output: \(result)") // Output: [10, 5]
    }
    func getSumOfTwoNumber() {
        let nums1 = [2, 7, 11, 15]
        let target1 = 9
        let result1 = dArray.twoSum(nums1, target1)
        print("Nums: \(nums1), Target: \(target1) -> Result: \(result1)") // Expected: [0, 1]
    }
    
    func twoSum() {
        var arr: [Int] = [2,7,11,15]
        var target = 9
        var res = dArray.twoSum(arr, target)
        print("[2,7,11,15]: Expected:[0,1] Current :  \(res)")
        arr = [3,2,4]
        target = 6
        res = dArray.twoSum(arr, target)
        print("[3,2,4] Expected:[1,2]Current: \(res)")
        
        arr = [3,3]
        target = 6
        res = dArray.twoSum(arr, target)
        print("[3,3] Expected:[0,1] Current: \(res)")
    }
    
    
   
    func maxProfit() {
        //   print(leetCode.maxProfit([7,1,5,3,6,4])) // Expected: 5
        
        print(dArray.maxProfit([7,2,10,1,3,6,4])) // Expected: 8
        
        // Example 2: No profit possible (prices always decrease)
        print(dArray.maxProfit([7,6,4,3,1])) // Expected: 0
        
        // Example 3: Prices increase then decrease
        print(dArray.maxProfit([2,4,1]))     // Expected: 2 (Buy at 2, Sell at 4)
        
        // Example 4: Single element
        print(dArray.maxProfit([10]))       // Expected: 0
        
        // Example 5: Empty array
        print(dArray.maxProfit([]))         // Expected: 0
    }
    
    func dailyTemperatures() {
        let arr = [73,74,75,71,69,72,76,73]
        print("[73,74,75,71,69,72,76,73]: \(dArray.dailyTemperatures(arr))")
    }
    func totalFruit() {
        let fruits1 = [1,2,1]
        let result1 = dArray.totalFruit(fruits1)
        print("Fruits: \(fruits1)")
        print("Max Fruits: \(result1)") // Expected: 3
        print("---")
        
        // Example 2: Stop due to third fruit type
        let fruits2 = [0,1,2,2]
        let result2 = dArray.totalFruit(fruits2)
        print("Fruits: \(fruits2)")
        print("Max Fruits: \(result2)") // Expected: 3
        print("---")
        
         //Example 4: All same fruit type
        let fruits4 = [3,3,3,3,3]
        let result4 = dArray.totalFruit(fruits4)
        print("Fruits: \(fruits4)")
        print("Max Fruits: \(result4)") // Expected: 5
        print("---")

        // Example 5: Two alternating fruit types
        let fruits5 = [1,0,1,4,1,4,1,2]
        let result5 = dArray.totalFruit(fruits5)
        print("Fruits: \(fruits5)")
        print("Max Fruits: \(result5)") // Expected: 5 (for [1,4,1,4,1])
        print("---")

        // Example 6: Empty array (handled by guard statement)
        let fruits6: [Int] = []
        let result6 = dArray.totalFruit(fruits6)
        print("Fruits: \(fruits6)")
        print("Max Fruits: \(result6)") // Expected: 0
        print("---")

        // Example 7: Two types, then a new one, then back to two
        let fruits7 = [1,1,2,2,3,3,1,1]
        let result7 = dArray.totalFruit(fruits7)
        print("Fruits: \(fruits7)")
        print("Max Fruits: \(result7)") // Expected: 4 (for [1,1,2,2] or [2,2,3,3] or [3,3,1,1])
        print("---")
    }
    func setBricks() {
        var arr = [7, 15, 10, 8]
       print("[7, 15, 10, 8]: expected 7) : \(dArray.setBricks(&arr))")
        
        arr = [11, 10, 8, 12, 8, 10, 11]
        print("[11, 10, 8, 12, 8, 10, 11]: expected 6 \(dArray.setBricks(&arr))")
        
        arr = [7, 14, 10]
        print("[7, 14, 10]: expected -1 \(dArray.setBricks(&arr))")
    }
    func merge() {
        let nums1_1 = [1,2,3,0,0,0]
        let m1 = 3
        let nums2_1 = [2,5,6]
        let n1 = 3
       
        print(
            "Example 1 Merged: \(dArray.merge(nums1_1, m1, nums2_1, n1))"
        ) // Output: [1, 2, 2, 3, 5, 6]
        
//        let nums1_4 = [4,5,6]
//        let m4 = 3
//        let nums2_4 = [1,2,3,0,0,0]
//        let n4 = 3
//        print("Example 4 Merged: \( leetCode.merge(nums1_4, m4, nums2_4, n4))") // Output: [1, 2, 3, 4, 5, 6]
    }
    func trapingRainWater() {
        print("\nHeight: [0,1,0,2,1,0,1,3,2,1,2,1]  Expected 6")
        print(dArray.trapingRainWater([0,1,0,2,1,0,1,3,2,1,2,1])) // Expected 6
        print(dArray.trapingRainWater([0,1,10,2,1,0,1,3,2,1,2,1])) // Expected
        print("\nHeight: [1,2,3,4,5]")
        print("Trapped Water: \(dArray.trapingRainWater([1,2,3,4,5]))") // Expected: 0
        print("\nHeight: [5,4,3,2,1]")
        print("Trapped Water: \(dArray.trapingRainWater([5,4,3,2,1]))") // Expected: 0
        
        // Example 4: Peak in middle
        print("\nHeight: [4,2,0,3,2,5]")
        print("Trapped Water: \(dArray.trapingRainWater([4,2,0,3,2,5]))") // Expected: 9 (2 at index 1, 4 at index 2, 1 at index 4)
        
        //Example 5: No water (too few bars)
        print("\nHeight: [1,2]")
        print("Trapped Water: \(dArray.trapingRainWater([1,2]))") // Expected: 0
        
        // Example 6: Empty array
        print("\nHeight: []")
        print("Trapped Water: \(dArray.trapingRainWater([]))") // Expected: 0
        
        // Example 7: Example from problem with leading/trailing zeros
        print("\nHeight: [0,1,0,2,1,0,1,3,2,1,2,1]")
        print("Trapped Water: \(dArray.trapingRainWater([0,1,0,2,10,0,1,3,2,1,2,1]))") // Expected: 7
    }
    func findMinFuelStationToReachDestination() {
        let target1 = 100
        let startFuel1 = 10
        let capacity1 = 100
        let stations1 = [[10,60],[20,30],[30,30],[60,40]]
        print("Example 1: Min Refuels = Expected Output 2 \(dArray.findMinFuelStationToReachDestination(target: target1, startFuel: startFuel1, capacity: capacity1, gasStations: stations1))")
    }
}
