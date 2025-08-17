//
//  SlidingWind.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 31/07/25.
//

import Foundation


struct SlidingWindow {
    
    func SW1_minWindow(_ s: String, _ t: String) -> String {
        // Handle edge cases: if t is empty, return empty string as per problem constraints.
        // If s is empty, no window can be formed.
        guard !t.isEmpty else { return "" }
        guard !s.isEmpty else { return "" }
        
        // Convert strings to arrays of characters for O(1) access by index
        let sChars = Array(s)
        //  let tChars = Array(t)
        
        // 1. Build frequency map for string t (target characters and their counts)
        var tFreq: [Character: Int] = [:]
        for char in t {
            tFreq[char, default: 0] += 1
        }
        
        // `required` tracks the number of unique characters from t that we need to match
        let required = tFreq.count
        
        // `windowFreq` tracks the frequency of characters in the current sliding window of s
        var windowFreq: [Character: Int] = [:]
        
        // `formed` tracks how many unique characters from t are currently satisfied in the window
        var formed = 0
        
        // Pointers for the sliding window
        var left = 0
        var minLength = Int.max // Stores the length of the smallest valid window found
        var minWindowStart = 0  // Stores the starting index of the smallest valid window
        
        // Iterate with the right pointer to expand the window
        for right in 0..<sChars.count {
            let charR = sChars[right]
            
            // Add the current character to the window's frequency map
            windowFreq[charR, default: 0] += 1
            
            // Check if this character helps satisfy a requirement from t
            // If charR is in tFreq AND its count in windowFreq now matches tFreq's requirement,
            // then we have 'formed' one more required unique character.
            if let tCount = tFreq[charR], windowFreq[charR]! == tCount {
                formed += 1
            }
            
            // Try to shrink the window from the left if all requirements are met (`formed == required`)
            while formed == required && left <= right {
                let currentWindowLength = right - left + 1
                
                // If this window is smaller than the current minimum, update
                if currentWindowLength < minLength {
                    minLength = currentWindowLength
                    minWindowStart = left
                }
                
                let charL = sChars[left]
                
                // Remove the character at the left pointer from the window's frequency map to shrint the window
                windowFreq[charL]! -= 1
                
                // Check if removing this character causes a requirement to become unsatisfied
                // If charL is in tFreq AND its count in windowFreq now falls below tFreq's requirement,
                // then we have 'unformed' one unique character.
                if let tCount = tFreq[charL], windowFreq[charL]! < tCount {
                    formed -= 1
                }
                
                // Move the left pointer to shrink the window
                left += 1
            }
        }
        
        // If minLength is still Int.max, no valid window was found
        if minLength == Int.max {
            return ""
        } else {
            // Extract the minimum window substring
            let startIndex = s.index(s.startIndex, offsetBy: minWindowStart)
            let endIndex = s.index(startIndex, offsetBy: minLength)
            return String(s[startIndex..<endIndex])
        }
    }
    /* func minWindowS(_ s: String, _ t: String) -> String {
        // Handle edge cases: if t is empty, return empty string as per problem constraints.
        // If s is empty, no window can be formed.
        guard !t.isEmpty else { return "" }
        guard !s.isEmpty else { return "" }
        
        // Convert strings to arrays of characters for O(1) access by index
        let sChars = Array(s)
        //  let tChars = Array(t)
        
        // 1. Build frequency map for string t (target characters and their counts)
        var tFreq: [Character: Int] = [:]
        for char in t {
            tFreq[char, default: 0] += 1
        }
        
        // `required` tracks the number of unique characters from t that we need to match
        let required = tFreq.count
        
        // `windowFreq` tracks the frequency of characters in the current sliding window of s
        var windowFreq: [Character: Int] = [:]
        
        // `formed` tracks how many unique characters from t are currently satisfied in the window
        var formed = 0
        
        // Pointers for the sliding window
        var left = 0
        var minLength = Int.max // Stores the length of the smallest valid window found
        var minWindowStart = 0  // Stores the starting index of the smallest valid window
        
        // Iterate with the right pointer to expand the window
        for right in 0..<sChars.count {
            let charR = sChars[right]
            
            // Add the current character to the window's frequency map
            windowFreq[charR, default: 0] += 1
            
            // Check if this character helps satisfy a requirement from t
            // If charR is in tFreq AND its count in windowFreq now matches tFreq's requirement,
            // then we have 'formed' one more required unique character.
            if let tCount = tFreq[charR], windowFreq[charR]! == tCount {
                formed += 1
            }
            
            // Try to shrink the window from the left if all requirements are met (`formed == required`)
            while formed == required && left <= right {
                let currentWindowLength = right - left + 1
                
                // If this window is smaller than the current minimum, update
                if currentWindowLength < minLength {
                    minLength = currentWindowLength
                    minWindowStart = left
                }
                
                let charL = sChars[left]
                
                // Remove the character at the left pointer from the window's frequency map to shrint the window
                windowFreq[charL]! -= 1
                
                // Check if removing this character causes a requirement to become unsatisfied
                // If charL is in tFreq AND its count in windowFreq now falls below tFreq's requirement,
                // then we have 'unformed' one unique character.
                if let tCount = tFreq[charL], windowFreq[charL]! < tCount {
                    formed -= 1
                }
                
                // Move the left pointer to shrink the window
                left += 1
            }
        }
        
        // If minLength is still Int.max, no valid window was found
        if minLength == Int.max {
            return ""
        } else {
            // Extract the minimum window substring
            let startIndex = s.index(s.startIndex, offsetBy: minWindowStart)
            let endIndex = s.index(startIndex, offsetBy: minLength)
            return String(s[startIndex..<endIndex])
        }
    } */
   
//     func maxSlidingWindowD(_ nums: [Int], _ k: Int) -> [Int] {
//        var result = [Int]()
//        var maxNumber = 0
//        var left = 0
//        var right = 0
//        var endRange = k
//        while right < nums.count {
//            let num = nums[right]
//            maxNumber = num < 0  && k == 1 ? num : max(maxNumber,num)
//            right += 1
//            if right == endRange  {
//                result.append(maxNumber)
//                maxNumber = 0
//                left += 1
//                right = left
//                endRange = right + k
//            }
//        }
//        return result
//    }
    func SW2_maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard !nums.isEmpty, k > 0 else { return [] }
        
        var deque = [Int]() // stores indices of nums
        var result = [Int]()
        
        for i in 0..<nums.count {
            // Remove indices out of current window
            if !deque.isEmpty && deque.first! <= i - k {
                deque.removeFirst()
            }
            // Maintain decreasing order in deque
            while !deque.isEmpty && nums[deque.last!] < nums[i] {
                deque.removeLast()
            }
            
            // Add current index
            deque.append(i)
            
            // Append max to result when first window is complete
            if i >= k - 1 {
                result.append(nums[deque.first!])
            }
        }
        
        return result
    }
}
