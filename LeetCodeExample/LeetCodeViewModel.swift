//
//  LeetCodeViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 05/07/25.
//

import Foundation




class LeetCodeViewModel: ObservableObject {
    
    private var leetCode: LeetCode
    @Published var data: [LeetCodeModel]
    
    init(leetCode: LeetCode = LeetCode()) {
        self.leetCode = leetCode
        data = [
            LeetCodeModel(title: "Two number sum from array"),
            LeetCodeModel(title: "Bracket Validation String"),
        ]
    }
    
    func findMaxDepth() {
        leetCode.findMaxDepth(array: [3, 9, 20, nil, nil, 15, 7])
    }
    
    func productOfArrayExceptSelf(array: [Int]) {
        var nums = [1, 2, 3, 4]
        var result = leetCode.productOfArrayExceptSelf(nums)
        print("Input: \(nums)") // Expected: [24, 12, 8, 6]
        print("Output: \(result)") // Output: [24, 12, 8, 6]
        
        nums = [-1, 1, 0, -3, 3]
        result = leetCode.productOfArrayExceptSelf(nums)
        print("Input: \(nums)") // Expected: [0, 0, 9, 0, 0]
        print("Output: \(result)") // Output: [0, 0, 9, 0, 0]
        
        // Example 3: Single element
        nums = [7]
        result = leetCode.productOfArrayExceptSelf(nums)
        print("Input: \(nums)") // Expected: [1] (product of empty set is 1)
        print("Output: \(result)") // Output: [1]
        
        // Example 4: Two elements
        nums = [5, 10]
        result = leetCode.productOfArrayExceptSelf(nums)
        print("Input: \(nums)") // Expected: [10, 5]
        print("Output: \(result)") // Output: [10, 5]
        
      
    }
    func validParenthese() {
        var str = """
        "[([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([([()])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])])]"
        """
        str = "([)]"
        str = "()[]{}"
        print(" ()[]{} \(leetCode.validParenthese(str))")

    }
    
//    func lengthOfLongestSubstring() {
//        let s1 = "abcabcbb"
//        let result1 = leetCode.lengthOfLongestSubstring(s1)
//        print("String: \"\(s1)\"")
//        print("Longest Substring Length: \(result1)") // Expected: 3 ("abc")
//        print("---")
//    }
    func dailyTemperatures() {
        let arr = [73,74,75,71,69,72,76,73]
        print("[73,74,75,71,69,72,76,73]: \(leetCode.dailyTemperatures(arr))")
    }
    
    func merge() {
        let nums1_1 = [1,2,3,0,0,0]
        let m1 = 3
        let nums2_1 = [2,5,6]
        let n1 = 3
       
        print("Example 1 Merged: \(leetCode.merge(nums1_1, m1, nums2_1, n1))") // Output: [1, 2, 2, 3, 5, 6]
        
//        let nums1_4 = [4,5,6]
//        let m4 = 3
//        let nums2_4 = [1,2,3,0,0,0]
//        let n4 = 3
//        print("Example 4 Merged: \( leetCode.merge(nums1_4, m4, nums2_4, n4))") // Output: [1, 2, 3, 4, 5, 6]
    }
    
    func findMedian() {
        var list1_1 = leetCode.createListNode(from: [1, 3])
        var list1_2 = leetCode.createListNode(from: [2])
        var mergedNode = leetCode.mergeTwoLists(list1_1, list1_2)
        var sortedArray = leetCode.convertListNodeToArray(mergedNode)
        var median = leetCode.findMedian(array: sortedArray)
        print(median) // Expected: 2.0
        
        
        list1_1 = leetCode.createListNode(from: [1, 2])
        list1_2 = leetCode.createListNode(from: [3,4])
        mergedNode = leetCode.mergeTwoLists(list1_1, list1_2)
        sortedArray = leetCode.convertListNodeToArray(mergedNode)
        median = leetCode.findMedian(array: sortedArray)
        print(median) // Expected: 2.5
        
        list1_1 = leetCode.createListNode(from: [0, 0])
        list1_2 = leetCode.createListNode(from: [0,0])
        mergedNode = leetCode.mergeTwoLists(list1_1, list1_2)
        sortedArray = leetCode.convertListNodeToArray(mergedNode)
        median = leetCode.findMedian(array: sortedArray)
        print(median) // Expected: 0.0
        
        list1_1 = leetCode.createListNode(from: [])
        list1_2 = leetCode.createListNode(from: [1])
        mergedNode = leetCode.mergeTwoLists(list1_1, list1_2)
        sortedArray = leetCode.convertListNodeToArray(mergedNode)
        median = leetCode.findMedian(array: sortedArray)
        print(median) // Expected: 1.0
        
        list1_1 = leetCode.createListNode(from: [1])
        list1_2 = leetCode.createListNode(from: [])
        mergedNode = leetCode.mergeTwoLists(list1_1, list1_2)
        sortedArray = leetCode.convertListNodeToArray(mergedNode)
        median = leetCode.findMedian(array: sortedArray)
        print(median) // Expected: 1.0
        
        list1_1 = leetCode.createListNode(from: [1,2,5])
        list1_2 = leetCode.createListNode(from: [3,4,6])
        mergedNode = leetCode.mergeTwoLists(list1_1, list1_2)
        sortedArray = leetCode.convertListNodeToArray(mergedNode)
        median = leetCode.findMedian(array: sortedArray)
        print(median) // Expected: 3.5
        
        list1_1 = leetCode.createListNode(from: [-5,0,10])
        list1_2 = leetCode.createListNode(from: [-10,-3,7])
        mergedNode = leetCode.mergeTwoLists(list1_1, list1_2)
        sortedArray = leetCode.convertListNodeToArray(mergedNode)
        median = leetCode.findMedian(array: sortedArray)
        print(median) //Expected: 0.0 (merged: [-10, -5, -3, 0, 7, 10])
    }
    
    func trapingRainWater() {
        
        print("\nHeight: [0,1,0,2,1,0,1,3,2,1,2,1]  Expected 6")
        print(leetCode.trapingRainWater([0,1,0,2,1,0,1,3,2,1,2,1])) // Expected 6
        print(leetCode.trapingRainWater([0,1,10,2,1,0,1,3,2,1,2,1])) // Expected
        print("\nHeight: [1,2,3,4,5]")
        print("Trapped Water: \(leetCode.trapingRainWater([1,2,3,4,5]))") // Expected: 0
        print("\nHeight: [5,4,3,2,1]")
        print("Trapped Water: \(leetCode.trapingRainWater([5,4,3,2,1]))") // Expected: 0
        
        // Example 4: Peak in middle
        print("\nHeight: [4,2,0,3,2,5]")
        print("Trapped Water: \(leetCode.trapingRainWater([4,2,0,3,2,5]))") // Expected: 9 (2 at index 1, 4 at index 2, 1 at index 4)
        
        //Example 5: No water (too few bars)
        print("\nHeight: [1,2]")
        print("Trapped Water: \(leetCode.trapingRainWater([1,2]))") // Expected: 0
        
        // Example 6: Empty array
        print("\nHeight: []")
        print("Trapped Water: \(leetCode.trapingRainWater([]))") // Expected: 0
        
        // Example 7: Example from problem with leading/trailing zeros
        print("\nHeight: [0,1,0,2,1,0,1,3,2,1,2,1]")
        print("Trapped Water: \(leetCode.trapingRainWater([0,1,0,2,10,0,1,3,2,1,2,1]))") // Expected: 7
    }
    
    
    
    
    func maxProfit() {
        //   print(leetCode.maxProfit([7,1,5,3,6,4])) // Expected: 5
        
        print(leetCode.maxProfit([7,2,10,1,3,6,4])) // Expected: 8
        
        // Example 2: No profit possible (prices always decrease)
        print(leetCode.maxProfit([7,6,4,3,1])) // Expected: 0
        
        // Example 3: Prices increase then decrease
        print(leetCode.maxProfit([2,4,1]))     // Expected: 2 (Buy at 2, Sell at 4)
        
        // Example 4: Single element
        print(leetCode.maxProfit([10]))       // Expected: 0
        
        // Example 5: Empty array
        print(leetCode.maxProfit([]))         // Expected: 0
    }
    
    func isValidAfter180DegreeRotation() {
        print("--- Test Cases ---")
        
        // Valid Rotations
        print("\nTest Case 1: '0'")
        print("Result: \(leetCode.isValidAfter180DegreeRotation(sequence: "0"))") // Expected: true (Rotated: "0")
        
        print("\nTest Case 2: '1'")
        print("Result: \(leetCode.isValidAfter180DegreeRotation(sequence: "1"))") // Expected: true (Rotated: "1")
        
        print("\nTest Case 3: '6'")
        print("Result: \(leetCode.isValidAfter180DegreeRotation(sequence: "6"))") // Expected: true (Rotated: "9")
        
        print("\nTest Case 4: '9'")
        print("Result: \(leetCode.isValidAfter180DegreeRotation(sequence: "9"))") // Expected: true (Rotated: "6")
        
        print("\nTest Case 5: '8'")
        print("Result: \(leetCode.isValidAfter180DegreeRotation(sequence: "8"))") // Expected: true (Rotated: "8")
        
        print("\nTest Case 6: '689'")
        print("Result: \(leetCode.isValidAfter180DegreeRotation(sequence: "689"))") // Expected: true (Rotated: "689" -> 986 reversed -> 689)
        
        print("\nTest Case 7: '10801'")
        print("Result: \(leetCode.isValidAfter180DegreeRotation(sequence: "10801"))") // Expected: true (Rotated: "10801")
        
        print("\nTest Case 8: '96'")
        print("Result: \(leetCode.isValidAfter180DegreeRotation(sequence: "96"))") // Expected: true (Rotated: "96" -> 69 reversed -> 96)
        
        
        // Invalid Rotations
        print("\nTest Case 9: '2'")
        print("Result: \(leetCode.isValidAfter180DegreeRotation(sequence: "2"))") // Expected: false (Contains '2')
        
        print("\nTest Case 10: '123'")
        print("Result: \(leetCode.isValidAfter180DegreeRotation(sequence: "123"))") // Expected: false (Contains '2', '3')
        
        print("\nTest Case 11: '679'")
        print("Result: \(leetCode.isValidAfter180DegreeRotation(sequence: "679"))") // Expected: false (Contains '7')
        
        print("\nTest Case 12: 'abc'")
        print("Result: \(leetCode.isValidAfter180DegreeRotation(sequence: "abc"))")
    }
    
    func isAnagramFrequencyMap() {
        
        print("\n--- Testing Frequency Map Approach ---")
        // print("s: \"anagram\", t: \"nagaram\" -> \(leetCode.isAnagramFrequencyMap("anagram", "nagaram"))") // Expected: true
        print("s: \"Anagram\", t: \"nagaram\" -> \(leetCode.isAnagramFrequencyMap("Anagram", "nagaram"))") // Expected: true
        print("s: \"rat\", t: \"car\" -> \(leetCode.isAnagramFrequencyMap("rat", "car"))")
        // Expected: false
        //        print("s: \"a\", t: \"a\" -> \(solutionFreq.isAnagram_frequencyMap("a", "a"))")                     // Expected: true
        //        print("s: \"ab\", t: \"ba\" -> \(solutionFreq.isAnagram_frequencyMap("ab", "ba"))")                 // Expected: true
        //        print("s: \"abc\", t: \"ab\" -> \(solutionFreq.isAnagram_frequencyMap("abc", "ab"))")               // Expected: false
        //        print("s: \"aacc\", t: \"ccac\" -> \(solutionFreq.isAnagram_frequencyMap("aacc", "ccac"))")         // Expected: false
        //
        //
        //        print("s: \"listen\", t: \"silent\" -> \(solutionFreq.isAnagram_frequencyMap("listen", "silent"))") // Expected: true
        //        print("s: \"hello\", t: \"world\" -> \(solutionFreq.isAnagram_frequencyMap("hello", "world"))")     // Expected: false
        
    }
    
    func mergeTwoArray() {
        // Example 1
        let list1_1 = leetCode.createListNode(from: [1, 2, 4])
        let list1_2 = leetCode.createListNode(from: [1, 3, 4])
        let mergedList1 = leetCode.mergeTwoLists(list1_1, list1_2)
        print("Merged List 1:")
        leetCode.printListNode(mergedList1) // Expected: [1, 1, 2, 3, 4, 4]
        
        // Example 2
        let list2_1: ListNode? = nil
        let list2_2: ListNode? = nil
        let mergedList2 = leetCode.mergeTwoLists(list2_1, list2_2)
        print("Merged List 2:")
        leetCode.printListNode(mergedList2) // Expected: []
        
        // Example 3
        let list3_1: ListNode? = nil
        let list3_2 = leetCode.createListNode(from: [0])
        let mergedList3 = leetCode.mergeTwoLists(list3_1, list3_2)
        print("Merged List 3:")
        leetCode.printListNode(mergedList3) // Expected: [0]
        
        // Additional Test Case
        let list4_1 = leetCode.createListNode(from: [5])
        let list4_2 = leetCode.createListNode(from: [1, 2, 4])
        let mergedList4 = leetCode.mergeTwoLists(list4_1, list4_2)
        print("Merged List 4:")
        leetCode.printListNode(mergedList4) // Expected: [1, 2, 4, 5]
        
    }
    
    func getSumOfTwoNumber() {
        let nums1 = [2, 7, 11, 15]
        let target1 = 9
        let result1 = leetCode.twoSum(nums1, target1)
        print("Nums: \(nums1), Target: \(target1) -> Result: \(result1)") // Expected: [0, 1]
    }
    func checkBracketStringValidation() {
        
        // Example 1
        print("() is valid: \(leetCode.isValidBracketString("()"))")       // Expected: true
        
        // Example 2
        print("()[]{} is valid: \(leetCode.isValidBracketString("()[]{}"))") // Expected: true
        
        // Example 3
        print("(] is valid: \(leetCode.isValidBracketString("(]"))")       // Expected: false
        
        // Example 4 (Unclosed opening bracket)
        print("{[ is valid: \(leetCode.isValidBracketString("{["))")       // Expected: false
        
        // Example 5 (Closing bracket without opening)
        print("] is valid: \(leetCode.isValidBracketString("]"))")         // Expected: false
        
        // Example 6 (Complex valid case)
        print("{[()]} is valid: \(leetCode.isValidBracketString("{[()]}"))") // Expected: true
        
        // Example 7 (Complex invalid case)
        print("(( is valid: \(leetCode.isValidBracketString("(("))")       // Expected: false
        
        // Example 8 (Mismatched type)
        print("({[)]} is valid: \(leetCode.isValidBracketString("({[)]}"))") // Expected: false
        
    }
    
    func findMinFuelStationToReachDestination() {
        let target1 = 100
        let startFuel1 = 10
        let capacity1 = 100
        let stations1 = [[10,60],[20,30],[30,30],[60,40]]
        print("Example 1: Min Refuels = \(leetCode.findMinFuelStationToReachDestination(target: target1, startFuel: startFuel1, capacity: capacity1, gasStations: stations1))") // Output: 2
        
        //  leetCode.findMinFuelStationToReachDestination(target: <#T##Int#>, startFuel: <#T##Int#>, capacity: <#T##Int#>, gasStations: <#T##<<error type>>#>)
    }
    
    func lengthOfLongestSubstring() {
        var cnt = 0
        cnt = leetCode.lengthOfLongestSubstring("abcabcbb")
        print("abcabcbb: Expected: 3 Current: \(cnt)")
        cnt = leetCode.lengthOfLongestSubstring("bbbbb")
        print("bbbbb: Expected: 1 Current: \(cnt)")
        cnt = leetCode.lengthOfLongestSubstring("pwwkew")
        print("pwwkew: Expected: 3 Current: \(cnt)")
        cnt = leetCode.lengthOfLongestSubstring("pwwkeabcdwabcdd")
        print("pwwkewabcdd: Expected: 5 Current: \(cnt)")
    }
    
    func totalFruit() {
//        let fruits1 = [1,2,1]
//        let result1 = leetCode.totalFruit(fruits1)
//        print("Fruits: \(fruits1)")
//        print("Max Fruits: \(result1)") // Expected: 3
//        print("---")
        
        // Example 2: Stop due to third fruit type
//        let fruits2 = [0,1,2,2]
//        let result2 = leetCode.totalFruit(fruits2)
//        print("Fruits: \(fruits2)")
//        print("Max Fruits: \(result2)") // Expected: 3
//        print("---")
//        
        // Example 4: All same fruit type
//        let fruits4 = [3,3,3,3,3]
//        let result4 = leetCode.totalFruit(fruits4)
//        print("Fruits: \(fruits4)")
//        print("Max Fruits: \(result4)") // Expected: 5
//        print("---")

        // Example 5: Two alternating fruit types
        let fruits5 = [1,0,1,4,1,4,1,2]
        let result5 = leetCode.totalFruit(fruits5)
        print("Fruits: \(fruits5)")
        print("Max Fruits: \(result5)") // Expected: 5 (for [1,4,1,4,1])
        print("---")

        // Example 6: Empty array (handled by guard statement)
        let fruits6: [Int] = []
        let result6 = leetCode.totalFruit(fruits6)
        print("Fruits: \(fruits6)")
        print("Max Fruits: \(result6)") // Expected: 0
        print("---")

        // Example 7: Two types, then a new one, then back to two
        let fruits7 = [1,1,2,2,3,3,1,1]
        let result7 = leetCode.totalFruit(fruits7)
        print("Fruits: \(fruits7)")
        print("Max Fruits: \(result7)") // Expected: 4 (for [1,1,2,2] or [2,2,3,3] or [3,3,1,1])
        print("---")
    }
    func minWindow() {
        SlidingWindowViewModel().minWindow()
    }
    func twoSum() {
        var arr: [Int] = [2,7,11,15]
        var target = 9
        var res = leetCode.twoSum(arr, target)
        print("[2,7,11,15]: Expected:[0,1] Current :  \(res)")
        arr = [3,2,4]
        target = 6
        res = leetCode.twoSum(arr, target)
        print("[3,2,4] Expected:[1,2]Current: \(res)")
        
        arr = [3,3]
        target = 6
        res = leetCode.twoSum(arr, target)
        print("[3,3] Expected:[0,1] Current: \(res)")
    }
    
    func minStack() {
        let minStack = MinStack()
        minStack.push(-2)
        minStack.push(0)
        minStack.push(-3)
        
        print("\(minStack.getMin())") //  // return -3)
        minStack.pop();
        
        print("\(minStack.top())") // 0
        print("\(minStack.getMin())") //  // return -2)
    }
    func setBricks() {
        var arr = [7, 15, 10, 8]
       print("[7, 15, 10, 8]: expected 7) : \(leetCode.setBricks(&arr))")
        
        arr = [11, 10, 8, 12, 8, 10, 11]
        print("[11, 10, 8, 12, 8, 10, 11]: expected 6 \(leetCode.setBricks(&arr))")
        
        arr = [7, 14, 10]
        print("[7, 14, 10]: expected -1 \(leetCode.setBricks(&arr))")
    }
    deinit {
        debugPrint("LeetCodeViewModel deinit")
    }
}
