//
//  DArray.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 14/08/25.
//

import Foundation

struct DArray {
    func A1_productOfArrayExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = Array(repeating: 1, count: n)
        
        // Step 1: left products
        var left = 1
        for i in 0..<n {
            result[i] = left
            left *= nums[i]
        }
        // Step 2: right products
        var right = 1
        for i in stride(from: n - 1, through: 0, by: -1) {
            result[i] *= right
            right *= nums[i]
        }
        return result
    }
    func A1_productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        
        var answer = Array(repeating: 1, count: n)
        
        var leftProduct = 1
        for i in 0..<n {
            // At index `i`, `answer[i]` stores the product of elements BEFORE `nums[i]`.
            answer[i] = leftProduct
            
            // Update `leftProduct` by multiplying it with the current element `nums[i]`.
            // This `leftProduct` will be used for the next index `i+1`.
            leftProduct *= nums[i]
        }
        
        // MARK: - Right Pass: Multiply with products of elements to the right of each index
        // `rightProduct` will accumulate the product of elements encountered so far from the right.
        var rightProduct = 1
        for i in (0..<n).reversed() { // Iterate from right to left
            // At index `i`, `answer[i]` currently holds the product of elements to its left.
            // We now multiply it by `rightProduct`, which is the product of elements AFTER `nums[i]`.
            answer[i] *= rightProduct
            
            // Update `rightProduct` by multiplying it with the current element `nums[i]`.
            // This `rightProduct` will be used for the previous index `i-1`.
            rightProduct *= nums[i]
        }
        
        return answer
    }
    func A2_twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Create a dictionary to store numbers we've seen and their indices.
        // Key: The number itself
        // Value: The index of that number in the 'nums' array
        var numMap: [Int: Int] = [:]
        
        // Iterate through the array 'nums' with both the index and the value.
        // `enumerated()` provides (offset: Int, element: Element) tuples.
        for (index, num) in nums.enumerated() {
            // Calculate the complement needed to reach the target.
            let complement = target - num
            
            // Check if the complement already exists in our dictionary.
            // If it does, we found the two numbers!
            if let complementIndex = numMap[complement] {
                // Return the index of the complement and the current index.
                return [complementIndex, index]
            }
            
            // If the complement is not found, add the current number and its index to the dictionary.
            // We do this AFTER checking for the complement to ensure we don't use the same element twice.
            numMap[num] = index
        }
        
        // According to the problem statement, there will always be exactly one solution.
        // So, this line should theoretically never be reached in a valid LeetCode test case.
        // However, Swift requires all paths to return a value for a non-optional return type.
        fatalError("No two sum solution found according to problem constraints.")
    }
    func A3_maxProfit(_ prices: [Int]) -> Int {
        // Handle edge case: empty or single-day array
        // A profit requires at least two days (buy and sell)
        guard prices.count > 1 else {
            return 0
        }
        
        var minPrice = prices[0] // Initialize minPrice with the first day's price
        var maxProfit = 0        // Initialize maxProfit to 0 (no profit yet)
        
        // Start iterating from the second day
        for i in 1..<prices.count {
            let currentPrice = prices[i]
            
            // Option 1: Update minPrice if a lower price is found
            // This ensures minPrice always represents the lowest buying opportunity seen so far
            minPrice = min(minPrice, currentPrice)
            
            // Option 2: Calculate current potential profit if we sell today
            // and update maxProfit if it's greater than our current maxProfit
            maxProfit = max(maxProfit, currentPrice - minPrice)
        }
        
        return maxProfit
    }
    func A4_739_dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var answer = Array(repeating: 0, count: n)
        var stack:[Int] = []
        for i in 0..<n {
            while !stack.isEmpty, let top = stack.last,temperatures[i] > temperatures[top] {
                answer[top] = i - top
                _ = stack.popLast()
            }
            stack.append(i)
        }
        return answer
    }
    func A5_totalFruit(_ fruits: [Int]) -> Int {
        // Handle edge case for empty or single-element array (though constraints say length >= 1)
        guard !fruits.isEmpty else {
            return 0
        }
        
        var maxFruits = 0 // Stores the maximum number of fruits collected
        var left = 0      // Left pointer of the sliding window
        // Dictionary to store the count of each fruit type within the current window
        // Key: fruit type (Int), Value: count (Int)
        var fruitCounts: [Int: Int] = [:]
        
        // The right pointer iterates through the array, expanding the window
        for (right,currentFruitType) in fruits.enumerated() {
            //  let currentFruitType = fruits[right]
            
            // Add the current fruit to the window (increment its count)
            // Using `default: 0` ensures that if the fruit type is new, it starts with a count of 0 before incrementing.
            fruitCounts[currentFruitType, default: 0] += 1
            
            // If the number of distinct fruit types in our window exceeds 2,
            // we need to shrink the window from the left.
            while fruitCounts.count > 2 {
                ///   let fruitTypeToRemove =
                
                // Decrement the count of the fruit type at the left end of the window
                fruitCounts[fruits[left]]! -= 1
                
                // If the count of this fruit type becomes 0, it means it's no longer in the window,
                // so remove it from the dictionary to reflect the distinct fruit types count accurately.
                if fruitCounts[fruits[left]]! == 0 {
                    fruitCounts.removeValue(forKey: fruits[left])
                }
                
                // Move the left pointer to shrink the window
                left += 1
            }
            
            // After expanding the window (and potentially shrinking it),
            // calculate the current window size and update maxFruits if it's larger.
            // The window size is (right - left + 1)
            maxFruits = max(maxFruits, right - left + 1)
        }
        
        return maxFruits
    }
    func A6_setBricks(_ A : inout [Int]) -> Int {
        if A.isEmpty  {
            return -1
        }
        var sum = 0
        let minBricks = 10
        for ind in 0..<A.count   {
            sum += A[ind]
        }
        if sum % minBricks != 0  {
            return -1
        }
        var leftIndex = 0
        var midIndex = leftIndex + 1
        var rightIndex = midIndex + 1
        var moveCount = 0
        
        while leftIndex < A.count - 2  {
            if A[leftIndex] > A[midIndex] {
                let diff = A[leftIndex] - minBricks
                A[leftIndex] -= diff
                A[midIndex] += diff
                moveCount += diff
            }
            if A[midIndex] > minBricks  && A[midIndex] > A[leftIndex] {
                let diff = min(A[midIndex] - minBricks, minBricks - A[leftIndex])
                A[leftIndex] += diff
                A[midIndex] = A[midIndex] - diff
                moveCount += diff
            }
            if A[midIndex] < minBricks  && A[rightIndex] > minBricks {
                let diff = A[rightIndex] - minBricks
                A[midIndex] = diff
                moveCount += diff
            }
            if A[midIndex] > minBricks  && A[midIndex] > A[rightIndex] {
                let diff = A[midIndex] - minBricks //min(A[midIndex] - A[rightIndex], minBricks - A[rightIndex]) //  A[midIndex] - minBricks
                A[rightIndex] += diff
                A[midIndex] -= diff
                moveCount += diff
            }
            leftIndex += 1
            midIndex += 1
            rightIndex += 1
        }
        return moveCount
    }
    func A7_merge(_ nums1: [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> [Int]{
        var p1 = m - 1
        var p2 = n - 1
        var writePointer = m + n - 1 // Pointer for the last position in nums1
        var resultArray =  Array(repeating: 0, count: nums1.count > nums2.count ?  nums1.count : nums2.count)
        while p1 >= 0 && p2 >= 0 {
            if nums1[p1] > nums2[p2] {
                resultArray[writePointer] = nums1[p1]
                p1 -= 1
            } else {
                resultArray[writePointer] = nums2[p2]
                p2 -= 1
            }
            writePointer -= 1
        }
        while p2 >= 0 {
            resultArray[writePointer] = nums2[p2]
            p2 -= 1
            writePointer -= 1
        }
        return resultArray
    }
    // 11. Container With Most Water
    func A8_11_maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxWater = 0
        
        while left < right {
            let h = min(height[left], height[right])
            let width = right - left
            maxWater = max(maxWater, h * width)
            
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxWater
    }
    // 42. Trapping Rain Water
    func a9_42_trap(_ height: [Int]) -> Int  {
        let arrayCnt = height.count
        var left = 0
        var right = arrayCnt - 1
        var leftMaxHeight = 0
        var rightMaxHeight = 0
        var savedWater = 0
        
        while (left < right) {
            leftMaxHeight = max(leftMaxHeight,height[left])
            rightMaxHeight = max(rightMaxHeight,height[right])
            
            if leftMaxHeight < rightMaxHeight {
                savedWater += leftMaxHeight - height[left]
                left += 1
                // left ++
            }
            else {
                savedWater += rightMaxHeight - height[right]
                right -= 1
            }
        }
        return savedWater
    }
    // 42. Trapping Rain Water
    //    func a9_42_trap(_ height: [Int]) -> Int {
    //        var left = 0
    //        var right = height.count - 1
    //        var leftMax = 0
    //        var rightMax = 0
    //        var water = 0
    //
    //        while left < right {
    //            if height[left] < height[right] {
    //                if height[left] >= leftMax {
    //                    leftMax = height[left]
    //                } else {
    //                    water += leftMax - height[left]
    //                }
    //                left += 1
    //            } else {
    //                if height[right] >= rightMax {
    //                    rightMax = height[right]
    //                } else {
    //                    water += rightMax - height[right]
    //                }
    //                right -= 1
    //            }
    //        }
    //        return water
    //    }
    //
    struct FuelStation  {
        let postion: Int
        let available: Int
    }
    func A9_findMinFuelStationToReachDestination(target: Int,startFuel: Int , capacity: Int,gasStations:[[Int]]) -> Int {
        var stations = [FuelStation]()
        for subArray in gasStations {
            for ind  in 0..<subArray.count {
                if ind+1 < subArray.count {
                    stations.append(.init(postion: subArray[0], available: subArray[1]))
                }
            }
        }
        var destination = target
        var currentFuel = startFuel
        var fuelStop: Int = 0
        var currentPosition = 0
        while destination >= 0  {
            let stationPosition = stations[currentPosition].postion
            currentFuel -= stationPosition
            destination -= stationPosition
            if currentPosition + 1 < stations.count - 1 {
                let nextPosition = stations[currentPosition + 1].postion
                if nextPosition > currentFuel {
                    currentFuel += stations[currentPosition].available
                    fuelStop += 1
                }
            }
            if currentFuel <= 0 {
                currentFuel += stations[currentPosition].available
                fuelStop += 1
            }
            currentPosition += 1
        }
        return fuelStop
    }
    // Medium : 36. Valid Sudoku
    func A11_m36_solveSudoku(_ board: inout [[Character]]) {
        func isValid(_ row: Int, _ col: Int, _ char: Character) -> Bool {
            for i in 0..<9 {
                // Check row
                if board[row][i] == char { return false }
                // Check column
                if board[i][col] == char { return false }
                // Check 3×3 box
                let boxRow = 3 * (row / 3) + i / 3
                let boxCol = 3 * (col / 3) + i % 3
                
                /*
                 
                 (i/3 , i%3)
                 +-------+-------+-------+
                 | (0,0) | (0,1) | (0,2) |
                 +-------+-------+-------+
                 | (1,0) | (1,1) | (1,2) |
                 +-------+-------+-------+
                 | (2,0) | (2,1) | (2,2) |
                 +-------+-------+-------+
                 
                 | i | i/3 | i%3 | (row offset, col offset) |
                 | - | --- | --- | ------------------------ |
                 | 0 | 0   | 0   | (0,0)                    |
                 | 1 | 0   | 1   | (0,1)                    |
                 | 2 | 0   | 2   | (0,2)                    |
                 | 3 | 1   | 0   | (1,0)                    |
                 | 4 | 1   | 1   | (1,1)                    |
                 | 5 | 1   | 2   | (1,2)                    |
                 | 6 | 2   | 0   | (2,0)                    |
                 | 7 | 2   | 1   | (2,1)                    |
                 | 8 | 2   | 2   | (2,2)                    |
                 
                 
                 We number the boxes 0–8 (left→right, top→bottom):
                 Each **box** is 3 rows × 3 cols.
                 +-------+-------+-------+
                 | box 0 | box 1 | box 2 |
                 |       |       |       |
                 +-------+-------+-------+
                 | box 3 | box 4 | box 5 |
                 |       |       |       |
                 +-------+-------+-------+
                 | box 6 | box 7 | box 8 |
                 |       |       |       |
                 +-------+-------+-------+
                 ### **Step 1 – Find top-left corner of the box**
                 
                 If `row = 4` and `col = 5`:
                 
                 * `row / 3 = 1` → box is in the **second row of boxes** → top row index = `3 * 1 = 3`
                 * `col / 3 = 1` → box is in the **second column of boxes** → left col index = `3 * 1 = 3`
                 **Top-left corner of box:** `(3, 3)`
                 ### **Step 2 – Enumerate cells in the box with `i = 0...8`**
                 
                 We scan in row-major order:
                 
                 | i | i / 3 | i % 3 | boxRow = 3\*(row/3) + i/3 | boxCol = 3\*(col/3) + i%3 |
                 | - | ----- | ----- | ------------------------- | ------------------------- |
                 | 0 | 0     | 0     | 3 + 0 = 3                 | 3 + 0 = 3                 |
                 | 1 | 0     | 1     | 3                         | 4                         |
                 | 2 | 0     | 2     | 3                         | 5                         |
                 | 3 | 1     | 0     | 4                         | 3                         |
                 | 4 | 1     | 1     | 4                         | 4                         |
                 | 5 | 1     | 2     | 4                         | 5                         |
                 | 6 | 2     | 0     | 5                         | 3                         |
                 | 7 | 2     | 1     | 5                         | 4                         |
                 | 8 | 2     | 2     | 5                         | 5                         |
                 
                 That’s exactly the 3×3 block from `(3,3)` to `(5,5)`.
                 
                 ---
                 
                 ### **Visual for box at (row=4, col=5)**
                 Row\Col   3   4   5
                 +---+---+---+
                 3  | * | * | * |
                 4  | * | * | **|
                 5  | * | * | * |
                 +---+---+---+
                 Where each `*` is hit exactly once by `(boxRow, boxCol)` from the formula.
                 If you want, I can make a **color-coded 9×9 Sudoku diagram** showing **all boxes and the scanning order for i=0…8** so you can see the traversal pattern across the entire grid.
                 Do you want me to make that?
                 
                 */
                if board[boxRow][boxCol] == char { return false }
            }
            return true
        }
        
        func backtrack() -> Bool {
            for row in 0..<9 {
                for col in 0..<9 {
                    if board[row][col] == "." {
                        for num in 1...9 {
                            let char = Character("\(num)")
                            if isValid(row, col, char) {
                                board[row][col] = char
                                if backtrack() { return true }
                                board[row][col] = "." // undo
                            }
                        }
                        return false // no valid number found
                    }
                }
            }
            return true // all cells filled
        }
        
        _ = backtrack()
    }
    // HARD: 41. First Missing Positive
    func A12_H41_firstMissingPositive(_ numsInput: [Int]) -> Int {
        var nums = numsInput      // work on a mutable copy
        let n = nums.count
        var i = 0
        
        while i < n {
            let v = nums[i]
            if v >= 1 && v <= n && nums[v - 1] != v {
                nums.swapAt(i, v - 1)
            } else {
                i += 1
            }
        }
        
        for i in 0..<n {
            debugPrint(nums[i])
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return n + 1
    }
    // Medium: 53. Maximum Subarray
    func a13_m53_maxSubArray(_ nums: [Int]) -> Int {
        var currSum = nums[0]
        var maxSum = nums[0]
        
        for i in 1..<nums.count {
            currSum = max(nums[i], currSum + nums[i])
            maxSum = max(maxSum, currSum)
        }
        
        return maxSum
    }
    // Medium: 152. Maximum Product Subarray
    func a14_m152_maxProduct(_ nums: [Int]) -> Int {
        var maxProd = nums[0]
        var minProd = nums[0]
        var result = nums[0]
        
        for i in 1..<nums.count {
            let n = nums[i]
            
            if n < 0 {
                swap(&maxProd, &minProd)
            }
            maxProd = max(n, maxProd * n)
            minProd = min(n, minProd * n)
            result = max(result, maxProd)
        }
        return result
    }
    // Medium: 153. Find Minimum in Rotated Sorted Array
    func a15_m153_findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = (left + right) / 2
            if nums[mid] > nums[right] {
                // min is in the right half
                left = mid + 1
            } else {
                // min is in the left half (including mid)
                right = mid
            }
        }
        return nums[left]
    }
    // Medium : 33. Search in Rotated Sorted Array
    func a16_m33_search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            }
            // Left half is sorted
            if nums[left] <= nums[mid] {
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            // Right half is sorted
            else {
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
    }
    // Easy: 1. Two Sum
    func a17_e1_twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum == target {
                return [left + 1, right + 1] // 1-based indices
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
        return []
    }
    /* Medium: 15. 3Sum
     Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
     
     Notice that the solution set must not contain duplicate triplets.
     Example 1:
     
     Input: nums = [-1,0,1,2,-1,-4]
     Output: [[-1,-1,2],[-1,0,1]]
     Explanation:
     nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
     nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
     nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
     The distinct triplets are [-1,0,1] and [-1,-1,2].
     Notice that the order of the output and the order of the triplets does not matter.
     */
    
    func a18_m15_threeSum1(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        
        for left in 0..<nums.count - 1 {
            let leftNo = nums[left]
            let rightNo = nums[left+1]
            let sum = leftNo + rightNo
            let target = (-1)*sum
            if let indexOfTarget = nums.firstIndex(of: target),indexOfTarget != left+1   {
                if nums.contains(target) {
                    let subArray = [leftNo,target,rightNo].sorted()
                    if !result.contains(subArray) {
                        result.append(subArray)
                    }
                }
            }
            
        }
        return result
        
    }
    func a18_m15_threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result = [[Int]]()
        let n = nums.count
        
        for i in 0..<n {
            // Avoid duplicates for the first number
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            var left = i + 1
            var right = n - 1
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    result.append([nums[i], nums[left], nums[right]])
                    
                    // Skip duplicates for left
                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    // Skip duplicates for right
                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return result
    }
    /*
     Easy : 953. Verifying an Alien Dictionary
     Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographically in this alien language.
     Example 1:
     
     Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
     Output: true
     Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
     */
    func a19_e953_isAlienSorted(_ words: [String], _ order: String) -> Bool {
        // Step 1: Map each character to its index in alien order
        var alienOrder = [Character: Int]()
        for (i, ch) in order.enumerated() {
            alienOrder[ch] = i
        }
        // Step 2: Compare helper
        func inCorrectOrder(_ w1: String, _ w2: String) -> Bool {
            let arr1 = Array(w1), arr2 = Array(w2)
            let n = min(arr1.count, arr2.count)
            
            for i in 0..<n {
                if arr1[i] != arr2[i] {
                    return alienOrder[arr1[i], default: 0] < alienOrder[arr2[i], default: 0]
                }
            }
            // If all matched till min length, shorter word should come first
            return arr1.count <= arr2.count
        }
        // Step 3: Check all adjacent pairs
        for i in 0..<words.count - 1 {
            if !inCorrectOrder(words[i], words[i+1]) {
                return false
            }
        }
        return true
    }
   /*
    Medium 31. Next Permutation
    A permutation of an array of integers is an arrangement of its members into a sequence or linear order.

    For example, for arr = [1,2,3], the following are all the permutations of arr: [1,2,3], [1,3,2], [2, 1, 3], [2, 3, 1], [3,1,2], [3,2,1].
   
    For example, the next permutation of arr = [1,2,3] is [1,3,2].
    Similarly, the next permutation of arr = [2,3,1] is [3,1,2].
    While the next permutation of arr = [3,2,1] is [1,2,3] because [3,2,1] does not have a lexicographical larger rearrangement.
    Given an array of integers nums, find the next permutation of nums.

    The replacement must be in place and use only constant extra memory.
    */
func a20_m31_nextPermutation(_ nums: inout [Int]) {
    let n = nums.count
    var i = n - 2
    
    // Step 1: Find first decreasing element from right
    while i >= 0 && nums[i] >= nums[i + 1] {
        i -= 1
    }
    
    if i >= 0 {
        // Step 2: Find the next greater element from right
        var j = n - 1
        while nums[j] <= nums[i] {
            j -= 1
        }
        nums.swapAt(i, j)
    }
    // Step 3: Reverse the suffix
    reverse(&nums, i + 1, n - 1)
    func reverse(_ nums: inout [Int], _ left: Int, _ right: Int) {
        var l = left, r = right
        while l < r {
            nums.swapAt(l, r)
            l += 1
            r -= 1
        }
    }
}

func A21_removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.isEmpty { return 0 }
    var i = 0
    for j in 1..<nums.count {
        if nums[j] != nums[i] {
            i += 1
            nums[i] = nums[j]
        }
    }
    return i + 1
}
func A22_searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    func findFirst(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1, ans = -1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                ans = mid
                right = mid - 1   // keep going left
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return ans
    }
    
    func findLast(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1, ans = -1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                ans = mid
                left = mid + 1   // keep going right
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return ans
    }
    
    let first = findFirst(nums, target)
    let last = findLast(nums, target)
    return [first, last]
}
// 4. Median of Two Sorted Arrays
func a23_4_findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var A = nums1, B = nums2
    if A.count > B.count { swap(&A, &B) } // ensure A is smaller
    
    let m = A.count, n = B.count
    var left = 0, right = m
    
    while left <= right {
        let i = (left + right) / 2
        let j = (m + n + 1) / 2 - i
        
        let maxLeftA = (i == 0) ? Int.min : A[i - 1]
        let minRightA = (i == m) ? Int.max : A[i]
        
        let maxLeftB = (j == 0) ? Int.min : B[j - 1]
        let minRightB = (j == n) ? Int.max : B[j]
        
        if maxLeftA <= minRightB && maxLeftB <= minRightA {
            if (m + n) % 2 == 0 {
                return Double(max(maxLeftA, maxLeftB) + min(minRightA, minRightB)) / 2.0
            } else {
                return Double(max(maxLeftA, maxLeftB))
            }
        } else if maxLeftA > minRightB {
            right = i - 1
        } else {
            left = i + 1
        }
    }
    
    return 0.0 // should never reach
}
func A24_findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let m = nums1.count, n = nums2.count
    var i = 0, j = 0
    var merged: [Int] = []
    
    // merge only until median index
    while merged.count <= (m + n) / 2 {
        if i < m && (j >= n || nums1[i] < nums2[j]) {
            merged.append(nums1[i])
            i += 1
        } else {
            merged.append(nums2[j])
            j += 1
        }
    }
    let total = m + n
    if total % 2 == 1 {
        return Double(merged.last!)
    } else {
        return Double(merged[merged.count - 1] + merged[merged.count - 2]) / 2.0
    }
}

func A25_isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count { return false }
    
    var count = [Int](repeating: 0, count: 26)
    let aAscii = Character("a").asciiValue!
    
    for ch in s {
        count[Int(ch.asciiValue! - aAscii)] += 1
    }
    for ch in t {
        count[Int(ch.asciiValue! - aAscii)] -= 1
        if count[Int(ch.asciiValue! - aAscii)] < 0 {
            return false
        }
    }
    return true
}
func A26_topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    // Step 1: Count frequencies
    var freq: [Int: Int] = [:]
    for num in nums {
        freq[num, default: 0] += 1
    }
    
    // Step 2: Sort by frequency (descending)
    let sorted = freq.sorted { $0.value > $1.value }
    
    // Step 3: Take top k keys
    return Array(sorted.prefix(k).map { $0.key })
}
// Medium : 36. Valid Sudoku
func A27_m36_isValidSudoku(_ board: [[Character]]) -> Bool {
    // 9 rows, 9 cols, 9 boxes
    var rows = Array(repeating: Set<Character>(), count: 9)
    var cols = Array(repeating: Set<Character>(), count: 9)
    var boxes = Array(repeating: Set<Character>(), count: 9)
    
    for r in 0..<9 {
        for c in 0..<9 {
            let val = board[r][c]
            if val == "." { continue }
            
            // Box index calculation
            let boxIndex = (r / 3) * 3 + (c / 3)
            
            // If duplicate found → invalid
            if rows[r].contains(val) || cols[c].contains(val) || boxes[boxIndex].contains(val) {
                return false
            }
            // Mark as seen
            rows[r].insert(val)
            cols[c].insert(val)
            boxes[boxIndex].insert(val)
        }
    }
    return true
}
func A28_longestConsecutive(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    let numSet = Set(nums)
    var longest = 0
    
    for num in numSet {
        // only start if this is the beginning of a sequence
        if !numSet.contains(num - 1) {
            var current = num
            var length = 1
            
            while numSet.contains(current + 1) {
                current += 1
                length += 1
            }
            
            longest = max(longest, length)
        }
    }
    
    return longest
}
// 75. Sort Colors
func A29_75_sortColors(_ nums: inout [Int]) {
    var low = 0
    var mid = 0
    var high = nums.count - 1
    
    while mid <= high {
        if nums[mid] == 0 {
            nums.swapAt(low, mid)
            low += 1
            mid += 1
        } else if nums[mid] == 1 {
            mid += 1
        } else { // nums[mid] == 2
            nums.swapAt(mid, high)
            high -= 1
        }
    }
}
// 169. Majority Element
func A30_169_majorityElement(_ nums: [Int]) -> Int {
    var candidate = nums[0]
    var count = 0
    
    for num in nums {
        if count == 0 {
            candidate = num
        }
        count += (num == candidate) ? 1 : -1
    }
    
    return candidate
}
}
