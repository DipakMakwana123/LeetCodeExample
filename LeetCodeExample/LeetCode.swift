//
//  LeetCode.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 05/07/25.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode? // next is an Optional, meaning it can be nil
    public init() {
        self.val = 0;
        self.next = nil;
    }
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
    }
}


struct LeetCode {
    
    var tree: Tree? = nil
    init() {
        self.tree = Tree()
    }
    func createListNode(from array: [Int]) -> ListNode? {
        guard !array.isEmpty else { return nil }
        let head = ListNode(array[0])
        var current = head
        for i in 1..<array.count {
            current.next = ListNode(array[i])
            current = current.next!
        }
        return head
    }
    
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
    
    func findMaxDepth(array: [Int?]) {
        let treeNode =  tree?.createTree(from: array)
        _ = tree?.maxDepth(treeNode)
    }
    
    // --- Helper function to print a list (for testing) ---
    func printListNode(_ head: ListNode?) {
        print(convertListNodeToArray(head))
    }
    
    func isAnagramFrequencyMap(_ s: String, _ t: String) -> Bool {
        // 1. If lengths are different, they cannot be anagrams
        guard s.count == t.count else {
            return false
        }
        
        // 2. Create a frequency array for 26 lowercase English letters
        // 'a' corresponds to index 0, 'b' to index 1, etc.
        var charCounts = Array(repeating: 0, count: 26)
        
        // Helper to get the 0-25 index for a lowercase English letter
        // Using Unicode scalars for robustness
        let aAsciiValue = Character("a").asciiValue!
        let asciiValueA = Character("A").asciiValue!
        
        // 3. Populate for 's': Increment counts
        for char in s {
            print(char.asciiValue)
            let index = Int(char.asciiValue! - aAsciiValue)
            charCounts[index] += 1
        }
        
        // 4. Decrement for 't': Decrement counts
        for char in t {
            print(char.asciiValue)
            let index = Int(char.asciiValue! - aAsciiValue)
            charCounts[index] -= 1
        }
        
        // 5. Verify Counts: All counts must be 0
        for count in charCounts {
            if count != 0 {
                return false
            }
        }
        return true
    }
    func convertListNodeToArray(_ head: ListNode?) -> [Int]{
        var current = head
        var result: [Int] = []
        while current != nil {
            result.append(current!.val)
            current = current!.next
        }
        return result
    }
    func isValidAfter180DegreeRotation(sequence: String) -> Bool {
        // 1. Define the rotation map for valid digits
        let rotationMap: [Character: Character] = [
            "0": "0",
            "1": "1",
            "6": "9",
            "8": "8",
            "9": "6"
        ]
        
        var rotatedSequence: [Character] = []
        
        // Iterate through the input string in reverse order
        // because rotating 180 degrees reverses the sequence.
        for char in sequence.reversed() {
            if let rotatedChar = rotationMap[char] {
                rotatedSequence.append(rotatedChar)
            } else {
                // Found a character that is not rotatable/valid
                print("Character '\(char)' is not valid or rotatable.")
                return false
            }
        }
        
        // Reconstruct the rotated string
        let finalRotatedString = String(rotatedSequence)
        
        // For this problem, "valid and readable" just means it's composed of rotatable digits.
        // If you need to check if the *content* is still semantically valid (e.g., a number is still prime),
        // that would be a separate step.
        
        // If the input itself contains only rotatable characters,
        // and we've successfully mapped them, the sequence remains valid and readable.
        print("Original: \(sequence)")
        print("Rotated : \(finalRotatedString)")
        
        // The problem statement implies "if the sequence remains valid and readable"
        // which primarily means all characters are from the rotatable set.
        // If you also need to check if the rotated string is EQUAL to the original string,
        // then you'd add:
        return finalRotatedString == sequence
        // return true
    }
    
    func validParenthese(_ s: String) -> Bool {
        // A quick check for odd length strings - they can never be valid
        if s.count % 2 != 0 {
            return false
        }
        
        var stack: [Character] = [] // Using a Swift Array as a stack
        
        // A dictionary to quickly check for matching pairs
        let matchingBrackets: [Character: Character] = [
            ")": "(",
            "}": "{",
            "]": "["
        ]
        
        for char in s {
            switch char {
            case "(", "{", "[":
                // It's an opening bracket, push it onto the stack
                stack.append(char)
            case ")", "}", "]":
                // It's a closing bracket
                
                guard let lastOpenBracket = stack.popLast(), // Try to pop the last opened bracket
                      lastOpenBracket == matchingBrackets[char] else { // Check if it matches
                    // Stack was empty or the popped bracket doesn't match
                    return false
                }
                debugPrint(lastOpenBracket,matchingBrackets[char])
            default:
                // If the string contains any other characters (not specified in problem, but good practice)
                return false
            }
        }
        
        // After iterating through the string, the stack should be empty if all brackets matched
        return stack.isEmpty
    }
    
    func validParenthese1(_ s: String) -> Bool {
        
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
    
    
    func findMedian(array: [Int]) -> Double{
        var median: Double = 0.0
        let cnt = array.count
        if cnt % 2 == 1 {
            // Odd number of elements: median is the middle element
            let middleIndex = cnt / 2 // Integer division automatically gets the correct index
            median =  Double(array[middleIndex])
        } else {
            // Even number of elements: median is the average of the two middle elements
            let rightMiddleIndex = cnt / 2
            let leftMiddleIndex = rightMiddleIndex - 1
            median =  Double(array[leftMiddleIndex] + array[rightMiddleIndex]) / 2.0
        }
        return median
    }
    
    func trapingRainWater2(_ height: [Int]) -> Int {
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
    
    func findWarmerDays(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var answer = Array(repeating: 0, count: n) // maximum size of Array is n
        var stack: [(temperature: Int, index: Int)] = []
        // Iterate from right to left
        for i in (0..<n).reversed() {
            let currentTemp = temperatures[i]
            // Pop elements from the stack that are not warmer than the current temperature
            while let top = stack.last, top.temperature <= currentTemp {
                _ = stack.popLast()
            }
            // If the stack is not empty, the top element is the next warmer temperature
            if let top = stack.last {
                answer[i] = top.index - i
            } else {
                // No warmer temperature found to the right
                answer[i] = 0
            }
            stack.append((currentTemp, i))
        }
        return answer
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
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0 // Handle empty string edge case
        }
        
        var maxLength = 0
        var left = 0 // Left pointer of the sliding window
        // Using a Set to store characters in the current window for O(1) average time complexity for lookups and insertions/deletions.
        var charSet = Set<Character>()
        charSet.reserveCapacity(s.count)
        
        // Convert string to an array of characters for easier indexing
        let characters = Array(s)
        
        for (right,char) in s.enumerated() {
            // If the current character is already in our set, it means we have a duplicate
            // We need to shrink the window from the left until the duplicate is removed
            while charSet.contains(char) {
                charSet.remove(characters[left])
                left += 1 // Move the left pointer to shrink the window
            }
            
            // Add the current character to the set (it's now unique in the window)
            charSet.insert(char)
            
            // Update the maximum length found so far
            // The current window size is (right - left + 1)
            maxLength = max(maxLength, right - left + 1)
            // debugPrint(maxLength,charSet.count)
        }
        
        return maxLength
    }
    
    func dailyTemperatures1(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var answer = Array(repeating: 0, count: n)
        var stack: [(temperature: Int, index: Int)] = [] // Stores (temperature, index)
        
        // Iterate from right to left
        for i in (0..<n).reversed() {
            debugPrint(temperatures[i])
            let currentTemperature = temperatures[i]
            
            // Pop elements from the stack that are not warmer than the current temperature
            while let top = stack.last, top.temperature <= currentTemperature {
                _ = stack.popLast()
            }
            
            // If the stack is not empty, the top element is the next warmer temperature
            if let top = stack.last {
                answer[i] = top.index - i
            } else {
                // No warmer temperature found to the right
                answer[i] = 0
            }
            
            // Push the current temperature and its index onto the stack
            stack.append((currentTemperature, i))
        }
        
        return answer
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
    
    func setBricks2(_ A : inout [Int]) -> Int {
        
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
                A[midIndex] =  A[midIndex] - diff
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
    func findMinFuelStationToReachDestination1(target: Int,startFuel: Int, capacity: Int,gasStations:[[Int]]) -> Int {
        
        _ = [FuelStation]()
        var destination = target
        let capacity = capacity
        var currentFuel = startFuel
        var fuelStop: Int = 0
        var totalDistanceCovered = 0
        for subArray in gasStations {
            var gasPosition = 0
            var availableFuel = 0
            for ind  in 0..<subArray.count {
                if ind == 0 && ind < subArray.count {
                    gasPosition = subArray[0]
                    currentFuel -= gasPosition
                    currentFuel = currentFuel < 0 ? 0 : currentFuel
                    destination -= gasPosition
                    totalDistanceCovered += gasPosition
                }
                else if ind == 1 && ind < subArray.count {
                    availableFuel = subArray[1]
                    if currentFuel <= 0 {
                        currentFuel += capacity > availableFuel ? availableFuel : availableFuel
                        fuelStop += 1
                    }
                }
                debugPrint(gasPosition,availableFuel,currentFuel,destination,fuelStop)
            }
        }
        
        return fuelStop
        
    }
    
    func trapingRainWater1(_ array: [Int]) -> Int  {
        guard array.count > 2 else {
            return 0
        }
        var savedWater: Int = 0
        var firstMax = 0
        var secondMax = 0
        
        for (_,val) in array.enumerated() {
            firstMax = max(firstMax,val)
            //            if nextIndex < array.count {
            //                let diff = val - array[nextIndex]
            //                if diff > 0 {
            //                    savedWater += diff
            //                }
            //            }
        }
        for val in array {
            if val != firstMax {
                secondMax = max(secondMax,val)
            }
        }
        
        var leftHeight = 0
        var midHeight = 0
        var rightHeight = 0
        
        let arrayCount = array.count - 1
        for i in 0..<arrayCount {
            var leftHeight = array[i]
            if array[i+1] < arrayCount  - 1  {
                midHeight = array[i+1]
            }
            if array[i+2] < arrayCount  - 2   {
                rightHeight = array[i+2]
            }
            let difference = abs(rightHeight - leftHeight)
            if midHeight < difference {
                let store =  secondMax - midHeight
                if store > 0 {
                    savedWater += store
                }
                debugPrint(difference)
            }
            
        }
        return savedWater
        
        //        i = 1
        //        while i < n {
        //            print(i)
        //            i++
        //            print("New  Line")
        //        }
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
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // Create a dummy head node to simplify handling the beginning of the merged list.
        let dummyHead: ListNode = ListNode()
        // 'current' pointer will always point to the last node added to the merged list.
        var current: ListNode = dummyHead
        // Use optional variables to iterate through the input lists.
        var l1: ListNode? = list1
        var l2: ListNode? = list2
        // Loop as long as both lists have nodes remaining.
        while let node1 = l1, let node2 = l2 {
            // Compare the values of the current nodes.
            if node1.val <= node2.val {
                // If node1's value is smaller or equal, append node1 to the merged list.
                current.next = node1
                // Move list1's pointer to its next node.
                l1 = node1.next
            } else {
                // If node2's value is smaller, append node2 to the merged list.
                current.next = node2
                // Move list2's pointer to its next node.
                l2 = node2.next
            }
            // Move the 'current' pointer to the node that was just appended.
            // We just assigned current.next, so it's guaranteed not to be nil.
            current = current.next!
        }
        // After the loop, one of the lists might still have remaining nodes.
        // Append the rest of the non-nil list to the merged list.
        if l1 != nil {
            current.next = l1
        } else if l2 != nil {
            current.next = l2
        }
        // The merged list starts from dummyHead.next, as dummyHead was just a placeholder.
        return dummyHead.next
    }
    
    func isValidBracketString(_ s: String) -> Bool {
        // Use a Swift Array as a stack. We'll store Character types.
        var stack: [Character] = []
        
        // A dictionary to quickly check corresponding opening brackets.
        // Key: Closing bracket
        // Value: Corresponding opening bracket
        let mapping: [Character: Character] = [
            ")": "(",
            "}": "{",
            "]": "["
        ]
        // Iterate over each character in the input string.
        for char in s {
            // Check if the character is a closing bracket.
            // We can do this by seeing if it's a key in our 'mapping' dictionary.
            if let openBracket = mapping[char] {
                // It's a closing bracket.
                
                // 1. Check if the stack is empty OR if the top of the stack
                //    does NOT match the corresponding open bracket.
                //    If either is true, the string is invalid.
                if stack.isEmpty || stack.last != openBracket {
                    return false
                }
                
                // 2. If it matches, pop the opening bracket from the stack.
                //    We know stack is not empty from the check above.
                stack.removeLast()
            } else {
                // It's an opening bracket. Push it onto the stack.
                stack.append(char)
            }
        }
        
        // After iterating through all characters, if the stack is empty,
        // all brackets were correctly matched and closed.
        return stack.isEmpty
    }
    
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        var charSet = Set<Character>()
        var maxLength = 0
        var left = s.startIndex
        var right = s.startIndex
        
        while right < s.endIndex {
            if !charSet.contains(s[right]) {
                charSet.insert(s[right])
                let currentLength = s.distance(from: left, to: right) + 1
                maxLength = max(maxLength, currentLength)
                right = s.index(after: right)
            } else {
                charSet.remove(s[left])
                left = s.index(after: left)
            }
        }
        
        return maxLength
    }
    
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
}
