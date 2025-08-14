//
//  LeetCode.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 05/07/25.
//

import Foundation

struct LeetCode {
    var tree: Tree? = nil
    init() {
        self.tree = Tree()
    }
   
    func findMaxDepth(array: [Int?]) {
        let treeNode =  tree?.createTree(from: array)
        _ = tree?.maxDepth(treeNode)
    }
    
    
    /*func validParenthese1(_ s: String) -> Bool {
        
        if s.count % 2 != 0 {
            return false
        }
        var chars = [Character]()
        for char in s {
            if char == "(" ||  char == "{" ||  char == "[" {
                chars.append(char)
            }
            else {
                guard let lastChar = chars.last else { return false }
                if lastChar == "(" && char == ")"
                    || lastChar == "{" && char == "}"
                    || lastChar == "[" &&  char == "]"  {
                    chars.removeLast()
                }
                else {
                    return false
                }
            }
        }
        return chars.isEmpty
        
    }*/
    
   
    
    func sortingTwoArray(arr1: [Int], arr2: [Int]) {
        var mergedArry = arr1
        mergedArry.append(contentsOf: arr2)
        
        var left = 0
        var right = left + 1
        
        while left < right {
            let leftVal = mergedArry[left]
            let rightVal = mergedArry[right]
            if leftVal < rightVal {
                
            }
            else {
                
            }
        }
        
        
    }
    
    /*
     
     Brand Logo
     
     2
     
     153
     SUSHOBHIT JAIN's Screen
     SUSHOBHIT JAIN
     
     SJ
     You (Dipak Makwana)
     
     DM
     Chat
     
     Everyone
     
     
     SUSHOBHIT JAIN
     21:55 PM
     func maxProduct(_ nums: [Int]) -> Int {
     var res = nums[0]
     var maxV = 1
     var minV = 1
     for i in nums {
     let temp = i*maxV
     maxV = max(i*minV, max(i, i*maxV))
     minV = min(min(i,i*minV), temp)
     res = max(maxV, res)
     }
     return res
     }
     
     Write something here
     
     */
    
  /*  func trapingRainWater2(_ height: [Int]) -> Int {
        let n = height.count
        guard n > 2 else { // Need at least 3 bars to trap water for non-zero result
            return 0
        }
        
        var left = 0
        var right = n - 1
        var leftMax = 0  // Max height encountered from left side so far
        var rightMax = 0 // Max height encountered from right side so far
        var totalWater = 0
        
        while left < right {
            // Determine which side is currently the "bottleneck"
            if height[left] < height[right] {
                // If the left bar is shorter, it limits the water level for the current `left` position
                if height[left] >= leftMax {
                    // Update `leftMax` if we found a new higher left wall
                    leftMax = height[left]
                } else {
                    // Current bar is shorter than `leftMax`, so it can trap water
                    totalWater += leftMax - height[left]
                }
                left += 1 // Move the left pointer inwards
            } else {
                // If the right bar is shorter or equal, it limits the water level for the current `right` position
                if height[right] >= rightMax {
                    // Update `rightMax` if we found a new higher right wall
                    rightMax = height[right]
                } else {
                    // Current bar is shorter than `rightMax`, so it can trap water
                    totalWater += rightMax - height[right]
                }
                right -= 1 // Move the right pointer inwards
            }
        }
        
        return totalWater
    }*/
    
    
    
//    func findWarmerDays(_ temperatures: [Int]) -> [Int] {
//        let n = temperatures.count
//        var answer = Array(repeating: 0, count: n) // maximum size of Array is n
//        var stack: [(temperature: Int, index: Int)] = []
//        // Iterate from right to left
//        for i in (0..<n).reversed() {
//            let currentTemp = temperatures[i]
//            // Pop elements from the stack that are not warmer than the current temperature
//            while let top = stack.last, top.temperature <= currentTemp {
//                _ = stack.popLast()
//            }
//            // If the stack is not empty, the top element is the next warmer temperature
//            if let top = stack.last {
//                answer[i] = top.index - i
//            } else {
//                // No warmer temperature found to the right
//                answer[i] = 0
//            }
//            stack.append((currentTemp, i))
//        }
//        return answer
//    }

    
    
   
    
//    func dailyTemperatures1(_ temperatures: [Int]) -> [Int] {
//        let n = temperatures.count
//        var answer = Array(repeating: 0, count: n)
//        var stack: [(temperature: Int, index: Int)] = [] // Stores (temperature, index)
//        
//        // Iterate from right to left
//        for i in (0..<n).reversed() {
//            debugPrint(temperatures[i])
//            let currentTemperature = temperatures[i]
//            
//            // Pop elements from the stack that are not warmer than the current temperature
//            while let top = stack.last, top.temperature <= currentTemperature {
//                _ = stack.popLast()
//            }
//            
//            // If the stack is not empty, the top element is the next warmer temperature
//            if let top = stack.last {
//                answer[i] = top.index - i
//            } else {
//                // No warmer temperature found to the right
//                answer[i] = 0
//            }
//            
//            // Push the current temperature and its index onto the stack
//            stack.append((currentTemperature, i))
//        }
//        
//        return answer
//    }
   
    
//    func setBricks2(_ A : inout [Int]) -> Int {
//        
//        if A.isEmpty  {
//            return -1
//        }
//        
//        var sum = 0
//        let minBricks = 10
//        for ind in 0..<A.count   {
//            sum += A[ind]
//        }
//        if sum % minBricks != 0  {
//            return -1
//        }
//        var leftIndex = 0
//        var midIndex = leftIndex + 1
//        var rightIndex = midIndex + 1
//        var moveCount = 0
//        
//        while leftIndex < A.count - 2  {
//            
//            if A[leftIndex] > A[midIndex] {
//                let diff = A[leftIndex] - minBricks
//                A[leftIndex] -= diff
//                A[midIndex] += diff
//                moveCount += diff
//            }
//            if A[midIndex] > minBricks  && A[midIndex] > A[leftIndex] {
//                let diff = min(A[midIndex] - minBricks, minBricks - A[leftIndex])
//                A[leftIndex] += diff
//                A[midIndex] =  A[midIndex] - diff
//                moveCount += diff
//            }
//            if A[midIndex] < minBricks  && A[rightIndex] > minBricks {
//                let diff = A[rightIndex] - minBricks
//                A[midIndex] = diff
//                moveCount += diff
//            }
//            if A[midIndex] > minBricks  && A[midIndex] > A[rightIndex] {
//                let diff = A[midIndex] - minBricks //min(A[midIndex] - A[rightIndex], minBricks - A[rightIndex]) //  A[midIndex] - minBricks
//                A[rightIndex] += diff
//                A[midIndex] -= diff
//                moveCount += diff
//            }
//            leftIndex += 1
//            midIndex += 1
//            rightIndex += 1
//            
//        }
//        return moveCount
//    }
    
    
//    func findMinFuelStationToReachDestination1(target: Int,startFuel: Int, capacity: Int,gasStations:[[Int]]) -> Int {
//        
//        _ = [FuelStation]()
//        var destination = target
//        let capacity = capacity
//        var currentFuel = startFuel
//        var fuelStop: Int = 0
//        var totalDistanceCovered = 0
//        for subArray in gasStations {
//            var gasPosition = 0
//            var availableFuel = 0
//            for ind  in 0..<subArray.count {
//                if ind == 0 && ind < subArray.count {
//                    gasPosition = subArray[0]
//                    currentFuel -= gasPosition
//                    currentFuel = currentFuel < 0 ? 0 : currentFuel
//                    destination -= gasPosition
//                    totalDistanceCovered += gasPosition
//                }
//                else if ind == 1 && ind < subArray.count {
//                    availableFuel = subArray[1]
//                    if currentFuel <= 0 {
//                        currentFuel += capacity > availableFuel ? availableFuel : availableFuel
//                        fuelStop += 1
//                    }
//                }
//                debugPrint(gasPosition,availableFuel,currentFuel,destination,fuelStop)
//            }
//        }
//        
//        return fuelStop
//        
//    }
    
//    func trapingRainWater1(_ array: [Int]) -> Int  {
//        guard array.count > 2 else {
//            return 0
//        }
//        var savedWater: Int = 0
//        var firstMax = 0
//        var secondMax = 0
//        
//        for (_,val) in array.enumerated() {
//            firstMax = max(firstMax,val)
//            //            if nextIndex < array.count {
//            //                let diff = val - array[nextIndex]
//            //                if diff > 0 {
//            //                    savedWater += diff
//            //                }
//            //            }
//        }
//        for val in array {
//            if val != firstMax {
//                secondMax = max(secondMax,val)
//            }
//        }
//        
//        var leftHeight = 0
//        var midHeight = 0
//        var rightHeight = 0
//        
//        let arrayCount = array.count - 1
//        for i in 0..<arrayCount {
//            var leftHeight = array[i]
//            if array[i+1] < arrayCount  - 1  {
//                midHeight = array[i+1]
//            }
//            if array[i+2] < arrayCount  - 2   {
//                rightHeight = array[i+2]
//            }
//            let difference = abs(rightHeight - leftHeight)
//            if midHeight < difference {
//                let store =  secondMax - midHeight
//                if store > 0 {
//                    savedWater += store
//                }
//                debugPrint(difference)
//            }
//            
//        }
//        return savedWater
//        
//        //        i = 1
//        //        while i < n {
//        //            print(i)
//        //            i++
//        //            print("New  Line")
//        //        }
//    }
    
    
    
    
    
//    func lengthOfLongestSubstring1(_ s: String) -> Int {
//        var charSet = Set<Character>()
//        var maxLength = 0
//        var left = s.startIndex
//        var right = s.startIndex
//        
//        while right < s.endIndex {
//            if !charSet.contains(s[right]) {
//                charSet.insert(s[right])
//                let currentLength = s.distance(from: left, to: right) + 1
//                maxLength = max(maxLength, currentLength)
//                right = s.index(after: right)
//            } else {
//                charSet.remove(s[left])
//                left = s.index(after: left)
//            }
//        }
//        
//        return maxLength
//    }
    
    //    func lengthOfLongestSubstring(_ s: String) -> Int {
    //        var tempStr:[Character] = []
    //        var subString: [String] = []
    //
    //        for char in s {
    //            if !tempStr.contains(char){
    //                tempStr.append(char)
    //            }
    //            else {
    //                if subString.count > 1 {
    //                    subString.remove(at: subString[1].count > subString[0].count ? 0 : 1)
    //                }
    //                subString.append(String(tempStr))
    //                tempStr.removeAll()
    //                tempStr.append(char)
    //            }
    //        }
    //        if !tempStr.isEmpty {
    //            subString.append(String(tempStr))
    //        }
    //        var maxCount = 0
    //        for ind in 0..<subString.count {
    //            maxCount = max(maxCount,subString[ind].count)
    //        }
    //        return maxCount
    //    }
    //
    
    
}
