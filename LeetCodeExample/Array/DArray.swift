//
//  DArray.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 14/08/25.
//

import Foundation

struct DArray {
    func productOfArrayExceptSelf(_ array:[Int]) -> [Int] {
        var resultArrray = [Int]()
        for i in 0..<array.count {
            var product: Int = 1
            for j in 0..<array.count {
                if i != j {
                    product = product * array[j]
                }
                debugPrint(product)
            }
            resultArrray.append(product)
        }
        return resultArrray
    }
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
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
    func maxProfit(_ prices: [Int]) -> Int {
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
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
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
    func totalFruit(_ fruits: [Int]) -> Int {
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
    func setBricks(_ A : inout [Int]) -> Int {
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
    func merge(_ nums1: [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> [Int]{
        // Initialize pointers
        var p1 = m - 1          // Pointer for the last valid element in nums1
        var p2 = n - 1          // Pointer for the last element in nums2
        var writePointer = m + n - 1 // Pointer for the last position in nums1
        //            if nums1.count > nums2.count {
        //
        //            }
        //            else if nums2.count > nums1.count {
        //                p2 =
        //            }
        
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
        
        // If there are remaining elements in nums2 (meaning they are smaller than
        // all elements already placed from nums1), copy them to the beginning of nums1.
        // If nums1 had remaining elements (p1 >= 0), they are already in place
        // because we started writing from the end.
        
        //            var remaingsArray = nums1
        //            if p2 < 0 {
        //                remaingsArray = nums2
        //            }
        //            var remaingsIndex = p1
        //            if p2 < 0 {
        //                remaingsIndex = p2
        //            }
        
        while p2 >= 0 {
            resultArray[writePointer] = nums2[p2]
            p2 -= 1
            writePointer -= 1
        }
        return resultArray
    }
    func trapingRainWater(_ array: [Int]) -> Int  {
        let arrayCnt = array.count
        var left = 0
        var right = arrayCnt - 1
        var leftMaxHeight = 0
        var rightMaxHeight = 0
        var savedWater = 0
        
        while (left < right) {
            leftMaxHeight = max(leftMaxHeight,array[left])
            rightMaxHeight = max(rightMaxHeight,array[right])
            
            if leftMaxHeight < rightMaxHeight {
                savedWater += leftMaxHeight - array[left]
                left += 1
                // left ++
            }
            else {
                savedWater += rightMaxHeight - array[right]
                right -= 1
            }
        }
        return savedWater
    }
    struct FuelStation  {
        let postion: Int
        let available: Int
    }
    func findMinFuelStationToReachDestination(target: Int,startFuel: Int , capacity: Int,gasStations:[[Int]]) -> Int {
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
}


/// Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
/// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
///
/// This algorithm runs in O(n) time and without using the division operation.
///
/// - Parameter nums: The input array of integers.
/// - Returns: An array where answer[i] is the product of all elements in nums except nums[i].
func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    
    // Initialize the answer array with 1s.
    // This array will first store the product of elements to the left of each index.
    var answer = Array(repeating: 1, count: n)
    
    // MARK: - Left Pass: Calculate products of elements to the left of each index
    // `leftProduct` will accumulate the product of elements encountered so far from the left.
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

// MARK: - Example Usage
/*
// Example 1
let nums1 = [1, 2, 3, 4]
let result1 = productExceptSelf(nums1)
print("Input: \(nums1)") // Expected: [24, 12, 8, 6]
print("Output: \(result1)") // Output: [24, 12, 8, 6]

// Example 2
let nums2 = [-1, 1, 0, -3, 3]
let result2 = productExceptSelf(nums2)
print("Input: \(nums2)") // Expected: [0, 0, 9, 0, 0]
print("Output: \(result2)") // Output: [0, 0, 9, 0, 0]

// Example 3: Single element
let nums3 = [7]
let result3 = productExceptSelf(nums3)
print("Input: \(nums3)") // Expected: [1] (product of empty set is 1)
print("Output: \(result3)") // Output: [1]

// Example 4: Two elements
let nums4 = [5, 10]
let result4 = productExceptSelf(nums4)
print("Input: \(nums4)") // Expected: [10, 5]
print("Output: \(result4)") // Output: [10, 5]
*/
