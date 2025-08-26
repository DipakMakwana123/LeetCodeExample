//
//  MyString.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 02/08/25.
//

import Foundation

struct DString {
    func S1_isMatch(_ s: String, _ p: String) -> Bool {
        let sChars = Array(s)
        let pChars = Array(p)
        var dp = Array(repeating: Array(repeating: false, count: p.count + 1), count: s.count + 1)
        dp[0][0] = true
        
        for i in 0..<p.count {
            debugPrint(pChars[i])
            if pChars[i] == "*"  && dp[0][i-1] == true  {
                dp[0][i+1] = true
            }
        }
        for i in 0..<s.count   {
            for j in 0..<p.count  {
                let patternChar = pChars[j]
                debugPrint(patternChar)
                if pChars[j] == "." {
                    dp[i+1][j+1] = dp[i][j]
                }
                else if pChars[j] == sChars[i] { // Both Character are same
                    dp[i+1][j+1] =  dp[i][j]
                }
                
                else if pChars[j] == "*" {
                    if pChars[j-1] != sChars[i] && pChars[j - 1] != "." {
                        dp[i+1][j+1] = dp[i+1][j-1]
                    }
                    else {
                        dp[i+1][j+1] = dp[i+1][j] || dp[i][j+1] || dp[i+1][j-1]
                    }
                }
            }
        }
        return dp[s.count][p.count]
    }
    func isMatch1(_ s: String, _ p: String) -> Bool {
        let sChars = Array(s)
        let pChars = Array(p)
        let m = sChars.count
        let n = pChars.count
        
        // dp[i][j] means s[0..<i] matches p[0..<j]
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        
        // Fill for patterns like a*, a*b*, a*b*c*
        for j in 1...n {
            if pChars[j - 1] == "*" && j >= 2 {
                dp[0][j] = dp[0][j - 2]
            }
        }
        
        for i in 1...m {
            for j in 1...n {
                if pChars[j - 1] == "." || pChars[j - 1] == sChars[i - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else if pChars[j - 1] == "*" {
                    // zero occurrence of preceding char
                    dp[i][j] = dp[i][j - 2]
                    
                    // one or more occurrences if preceding matches
                    if pChars[j - 2] == "." || pChars[j - 2] == sChars[i - 1] {
                        dp[i][j] = dp[i][j] || dp[i - 1][j]
                    }
                }
            }
        }
        
        return dp[m][n]
    }
    
    func S2_isPalindromeTwoPointers(text: String) -> Bool {
        //print(isPalindromeTwoPointers(text: "madam"))   // true
        // print(isPalindromeTwoPointers(text: "swift")) // false
        let characters = Array(text) // Convert to an array for O(1) access
        var left = 0
        var right = characters.count - 1
        
        while left < right {
            if characters[left] != characters[right] {
                return false
            }
            left += 1
            right -= 1
        }
        
        return true
    }
    
    func S3_isPalindromeRobust(text: String) -> Bool {
        
        //        print(isPalindromeRobust(text: "A man, a plan, a canal: Panama")) // true
        //        print(isPalindromeRobust(text: "No 'x' in Nixon"))              // true
        //        print(isPalindromeRobust(text: "Hello, World!"))               // false
        //
        // 1. Filter and normalize the string
        let filteredString = text.lowercased().filter { $0.isLetter || $0.isNumber }
        
        // 2. Use the two-pointer approach on the filtered string
        let characters = Array(filteredString)
        var left = 0
        var right = characters.count - 1
        
        while left < right {
            if characters[left] != characters[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    func S3_isValidBracketString(_ s: String) -> Bool {
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
    
    
    func S5_lengthOfLongestSubstring(_ s: String) -> Int {
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
    
    func S6_isValidAfter180DegreeRotation(sequence: String) -> Bool {
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
    func S7_isAnagramFrequencyMap(_ s: String, _ t: String) -> Bool {
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
        //  let asciiValueA = Character("A").asciiValue!
        
        // 3. Populate for 's': Increment counts
        for char in s {
            //  print(char.asciiValue)
            let index = Int(char.asciiValue! - aAsciiValue)
            charCounts[index] += 1
        }
        
        // 4. Decrement for 't': Decrement counts
        for char in t {
            //  print(char.asciiValue)
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
    func S8_findSubstring(_ s: String, _ words: [String]) -> [Int] {
        var result = [Int]()
        guard !s.isEmpty, !words.isEmpty else { return result }
        
        let wordLen = words[0].count
        let wordCount = words.count
        // _ = wordLen * wordCount
        let sArray = Array(s)
        
        // Build frequency map for words
        var wordMap = [String: Int]()
        for w in words {
            wordMap[w, default: 0] += 1
        }
        
        for offset in 0..<wordLen {
            var left = offset
            var right = offset
            var currMap = [String: Int]()
            var count = 0
            
            while right + wordLen <= sArray.count {
                let word = String(sArray[right..<right+wordLen])
                right += wordLen
                
                if let _ = wordMap[word] {
                    currMap[word, default: 0] += 1
                    count += 1
                    
                    while currMap[word]! > wordMap[word]! {
                        let leftWord = String(sArray[left..<left+wordLen])
                        currMap[leftWord]! -= 1
                        count -= 1
                        left += wordLen
                    }
                    
                    if count == wordCount {
                        result.append(left)
                    }
                } else {
                    currMap.removeAll()
                    count = 0
                    left = right
                }
            }
        }
        
        return result
    }
    
    func S9_groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]()
        
        for word in strs {
            // Sort the word’s characters → anagram groups share same sorted string
            let key = String(word.sorted())
            map[key, default: []].append(word)
        }
        
        return Array(map.values)
    }
    
    // Encode a list of strings to a single string.
    func S10_encode(_ strs: [String]) -> String {
        var result = ""
        for str in strs {
            result += "\(str.count)#\(str)"
        }
        return result
    }
    
    // Decode a single string to a list of strings.
    func S11_decode(_ s: String) -> [String] {
        var result = [String]()
        var i = s.startIndex
        
        while i < s.endIndex {
            // 1️⃣ Read length (until '#')
            var lengthStr = ""
            while s[i] != "#" {
                lengthStr.append(s[i])
                i = s.index(after: i)
            }
            
            let length = Int(lengthStr) ?? 0
            i = s.index(after: i) // skip '#'
            
            // 2️⃣ Extract substring of that length
            let start = i
            let end = s.index(i, offsetBy: length)
            result.append(String(s[start..<end]))
            
            i = end
        }
        
        return result
    }

        func S12_largestNumber(_ nums: [Int]) -> String {
            // Convert numbers to strings
            let strs = nums.map { String($0) }
            
            // Custom sort: compare concatenations
            let sorted = strs.sorted { $0 + $1 > $1 + $0 }
            
            // Join result
            let result = sorted.joined()
            
            // Edge case: if all numbers are "0"
            return result.first == "0" ? "0" : result
        }
}
