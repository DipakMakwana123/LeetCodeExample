//
//  MyString.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 02/08/25.
//

import Foundation

struct DString {
    /* Hard 10. Regular Expression Matching
     Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*' where:
     
     '.' Matches any single character.
     '*' Matches zero or more of the preceding element.
     The matching should cover the entire input string (not partial).
     Example 1:
     
     Input: s = "aa", p = "a"
     Output: false
     Explanation: "a" does not match the entire string "aa".
     
     Example 2:
     Input: s = "aa", p = "a*"
     Output: true
     Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
     
     */
    func s1_h10_isMatch1(_ s: String, _ p: String) -> Bool {
        let sChars = Array(s)
        let pChars = Array(p)
        var dp = Array(repeating: Array(repeating: false, count: p.count + 1), count: s.count + 1)
        dp[0][0] = true
        
        for i in 0..<p.count {
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
    func s1_h10_isMatch(_ s: String, _ p: String) -> Bool {
        let sArr = Array(s)
        let pArr = Array(p)
        let m = sArr.count
        let n = pArr.count
        
        // only keep one row for dp
        var prev = Array(repeating: false, count: n+1)
        var curr = Array(repeating: false, count: n+1)
        
        prev[0] = true
        
        // handle patterns like a*, a*b*, etc. that match empty string
        for j in 1...n {
            if pArr[j-1] == "*" && j > 1 {
                prev[j] = prev[j-2]
            }
        }
        
        for i in 1...m {
            curr = Array(repeating: false, count: n+1)
            for j in 1...n {
                if pArr[j-1] == "." || pArr[j-1] == sArr[i-1] {
                    curr[j] = prev[j-1]
                } else if pArr[j-1] == "*" {
                    // zero occurrence of the preceding char
                    curr[j] = curr[j-2]
                    
                    // one or more occurrence
                    if pArr[j-2] == "." || pArr[j-2] == sArr[i-1] {
                        curr[j] = curr[j] || prev[j]
                    }
                }
            }
            prev = curr
        }
        
        return prev[n]
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
    
    
    func s3_isValidBracketString(_ s: String) -> Bool {
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
    func s5_lengthOfLongestSubstring(_ s: String) -> Int {
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
    
    func s6_isValidAfter180DegreeRotation(sequence: String) -> Bool {
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
    func s7_isAnagramFrequencyMap(_ s: String, _ t: String) -> Bool {
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
    func s8_findSubstring(_ s: String, _ words: [String]) -> [Int] {
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
    
    func s9_groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]()
        
        for word in strs {
            // Sort the word’s characters → anagram groups share same sorted string
            let key = String(word.sorted())
            map[key, default: []].append(word)
        }
        
        return Array(map.values)
    }
    
    // 271. Encode Decode String
    func s10_encode(_ strs: [String]) -> String {
        var result = ""
        for str in strs {
            result += "\(str.count)#\(str)"
        }
        return result
    }
    // 271. Encode Decode String
    // Decode a single string to a list of strings.
    func s11_decode(_ s: String) -> [String] {
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
    func s13_14_longestCommonPrefix(_ strs: [String]) -> String {
        guard var prefix = strs.first else {return ""}
        for string in strs.dropFirst() {
            while !string.hasPrefix(prefix) {
                prefix.removeLast()
                if prefix.isEmpty {return ""}
            }
        }
        return prefix
    }
    
    func s15_424_characterReplacement(_ s: String, _ k: Int) -> Int {
        var freq = [Int](repeating: 0, count: 26)
        var left = 0
        var maxFreq = 0
        var best = 0
        
        let bytes = Array(s.utf8)  // one pass materialization; could also use withUnsafeBufferPointer
        
        for right in bytes.indices {
            let r = Int(bytes[right] - 65)  // 'A' == 65
            freq[r] += 1
            if freq[r] > maxFreq { maxFreq = freq[r] }
            
            // shrink while more than k changes are needed
            while (right - left + 1) - maxFreq > k {
                let l = Int(bytes[left] - 65)
                freq[l] -= 1
                left += 1
            }
            best = max(best, right - left + 1)
        }
        return best
    }
    /* Medium 3. Longest Substring Without Repeating Characters
     Given a string s, find the length of the longest substring without duplicate characters.
     Example 1:

     Input: s = "abcabcbb"
     Output: 3
     Explanation: The answer is "abc", with the length of 3.
     */
    func s16m3_lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var dict = [Character: Int]()   // stores last seen index
        var left = 0
        var result = 0
        
        for right in 0..<chars.count {
            let char = chars[right]
            
            if let prevIndex = dict[char], prevIndex >= left {
                left = prevIndex + 1  // move left just past the duplicate
            }
            
            dict[char] = right
            result = max(result, right - left + 1)
        }
        
        return result
    }
    
    func s17_76_minWindow(_ s: String, _ t: String) -> String {
        let sChars = Array(s)
        let tChars = Array(t)
        
        // Step 1: build frequency map for t
        var need = [Character: Int]()
        for char in tChars {
            need[char, default: 0] += 1
        }
        
        var window = [Character: Int]()
        var have = 0
        let needCount = need.count
        var left = 0
        
        var minLen = Int.max
        var resStart = 0
        
        // Step 2: expand window
        for right in 0..<sChars.count {
            let char = sChars[right]
            window[char, default: 0] += 1
            
            if let needVal = need[char], window[char] == needVal {
                have += 1
            }
            
            // Step 3: shrink window when valid
            while have == needCount {
                if (right - left + 1) < minLen {
                    minLen = right - left + 1
                    resStart = left
                }
                
                let leftChar = sChars[left]
                window[leftChar]! -= 1
                if let needVal = need[leftChar], window[leftChar]! < needVal {
                    have -= 1
                }
                left += 1
            }
        }
        
        return minLen == Int.max ? "" : String(sChars[resStart..<resStart + minLen])
    }
    
    
    @_optimize(speed)
    func s18_242_isAnagram(_ s: String, _ t: String) -> Bool {
        let lhs = Dictionary(s.utf8CString.dropLast().map { ($0, 1) }, uniquingKeysWith: +)
        let rhs = Dictionary(t.utf8CString.dropLast().map { ($0, 1) }, uniquingKeysWith: +)
        return lhs == rhs
    }
    
    func s19_49_groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagrams: [String: [String]] = [:]
        for str in strs {
            anagrams[String(str.sorted()), default:[String]()].append(str)
        }
        return anagrams.map { $0.value }
    }
    
    func s20_125_isPalindrome(_ s: String) -> Bool {
        let chars = Array(s.lowercased())
        var left = 0, right = chars.count - 1
        
        while left < right {
            // skip non-alphanumeric
            while left < right && !chars[left].isLetter && !chars[left].isNumber {
                left += 1
            }
            while left < right && !chars[right].isLetter && !chars[right].isNumber {
                right -= 1
            }
            
            if chars[left] != chars[right] {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
    /* Medium 5. Longest Palindromic Substring
     Given a string s, return the longest palindromic substring in s.
     Example 1:

     Input: s = "babad"
     Output: "bab"
     Explanation: "aba" is also a valid answer.
     */
    
    func s21m5_longestPalindrome(_ s: String) -> String {
        if s.count < 2 { return s }
        
        let chars = Array(s)
        var start = 0, end = 0
        
        func expandAroundCenter(_ left: Int, _ right: Int) -> (Int, Int) {
            var l = left, r = right
            while l >= 0 && r < chars.count && chars[l] == chars[r] {
                l -= 1
                r += 1
            }
            return (l + 1, r - 1)  // valid palindrome range
        }
        
        for i in 0..<chars.count {
            let (l1, r1) = expandAroundCenter(i, i)     // odd-length
            let (l2, r2) = expandAroundCenter(i, i + 1) // even-length
            
            if r1 - l1 > end - start {
                start = l1
                end = r1
            }
            if r2 - l2 > end - start {
                start = l2
                end = r2
            }
        }
        
        return String(chars[start...end])
    }
    
    //    234. Palindrome Linked List
    func s23_234_isPalindrome(_ head: ListNode?) -> Bool {
        var node = head
        var list : [Int] = []
        while let current = node{
            list.append(current.val)
            node = current.next
            
        }
        return list == Array(list.reversed())
    }
    /* Medium 17. Letter Combinations of a Phone Number
     Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
     
     A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
     Example 1:
     
     Input: digits = "23"
     Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
     */
    
    func s24_m17_letterCombinations(_ digits: String) -> [String]  {
        let mapping: [Character: [String]] = [
            "2": ["a","b","c"],
            "3": ["d","e","f"],
            "4": ["g","h","i"],
            "5": ["j","k","l"],
            "6": ["m","n","o"],
            "7": ["p","q","r","s"],
            "8": ["t","u","v"],
            "9": ["w","x","y","z"]
        ]
        if digits.isEmpty { return [] }
        var combinations: [String] = [""]
        for d in digits {
            guard let letters = mapping[d] else { continue }
            var next: [String] = []
            for prefix in combinations {
                for letter in letters {
                    next.append(prefix + letter)
                }
            }
            combinations = next
        }
        return combinations
    }
    
    
    
    //68. Text Justification
    func s25_68_fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var result = [String]()
        var lineWords = [String]()
        var lineLength = 0
        
        var i = 0
        while i < words.count {
            let word = words[i]
            
            // Check if adding this word exceeds maxWidth
            if lineLength + lineWords.count + word.count > maxWidth {
                // Justify current line
                let spaces = maxWidth - lineLength
                var line = ""
                
                if lineWords.count == 1 {
                    // Single word line
                    line = lineWords[0] + String(repeating: " ", count: spaces)
                } else {
                    let gaps = lineWords.count - 1
                    let even = spaces / gaps
                    var extra = spaces % gaps
                    
                    for j in 0..<lineWords.count {
                        line += lineWords[j]
                        if j < gaps {
                            line += String(repeating: " ", count: even + (extra > 0 ? 1 : 0))
                            if extra > 0 { extra -= 1 }
                        }
                    }
                }
                
                result.append(line)
                lineWords.removeAll()
                lineLength = 0
            }
            
            // Add word to line
            lineWords.append(word)
            lineLength += word.count
            i += 1
        }
        
        // Last line → left-justified
        var lastLine = lineWords.joined(separator: " ")
        lastLine += String(repeating: " ", count: maxWidth - lastLine.count)
        result.append(lastLine)
        
        return result
    }
    
    
    /* Easy  67. Add Binary
     
     Given two binary strings a and b, return their sum as a binary string.
     
     Example 1:
     Example 1:
     Input: a = "11", b = "1"
     Output: "100"
     Example 2:
     
     Input: a = "1010", b = "1011"
     Output: "10101"
     
     */
    func s27_e67_addBinary(_ a: String, _ b: String) -> String {
        let arrA = Array(a)
        let arrB = Array(b)
        var i = arrA.count - 1
        var j = arrB.count - 1
        var carry = 0
        var result: [Character] = []
        
        while i >= 0 || j >= 0 || carry > 0 {
            let bitA = (i >= 0) ? Int(String(arrA[i]))! : 0
            let bitB = (j >= 0) ? Int(String(arrB[j]))! : 0
            
            let sum = bitA + bitB + carry
            result.append(Character(String(sum % 2)))
            carry = sum / 2
            
            i -= 1
            j -= 1
        }
        
        return String(result.reversed())
    }
    
    // Medium : 36. Valid Sudoku
    func s29_m36_solveSudoku(_ board: inout [[Character]]) {
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
    
    
    
    
    /* Easy 290. Word Pattern
     
     Given a pattern and a string s, find if s follows the same pattern.
     
     Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s. Specifically:
     
     Each letter in pattern maps to exactly one unique word in s.
     Each unique word in s maps to exactly one letter in pattern.
     No two letters map to the same word, and no two words map to the same letter.
     
     
     Example 1:
     
     Input: pattern = "abba", s = "dog cat cat dog"
     
     Output: true
     
     Explanation:
     */
    func s31_e290_wordPattern(_ pattern: String, _ s: String) -> Bool {
        
        let words = s.split(separator: " ").map { String($0) }
        guard words.count == pattern.count else { return false }
        
        var pIndex: [Character: Int] = [:]
        var wIndex: [String: Int] = [:]
        
        let patternChars = Array(pattern)
        
        for i in 0..<patternChars.count {
            let p = patternChars[i]
            let w = words[i]
            
            if pIndex[p] != wIndex[w] {
                return false
            }
            
            // Store the current index + 1 (to avoid default 0 confusion)
            pIndex[p] = i + 1
            wIndex[w] = i + 1
        }
        
        return true
        
    }
    /* Easy 344. Reverse String
     Write a function that reverses a string. The input string is given as an array of characters s.
     
     You must do this by modifying the input array in-place with O(1) extra memory.
     Example 1:
     
     Input: s = ["h","e","l","l","o"]
     Output: ["o","l","l","e","h"]
     */
    func s32_e344_reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        
        while left < right {
            s.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    /* Easy 345. Reverse Vowels of a String
     Given a string s, reverse only all the vowels in the string and return it.
     
     The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.
     Example 1:
     
     Input: s = "IceCreAm"
     
     Output: "AceCreIm"
     
     Explanation:
     
     The vowels in s are ['I', 'e', 'e', 'A']. On reversing the vowels, s becomes "AceCreIm".
     */
    
    func s33_e345_reverseVowels(_ s: String) -> String {
        var chars = Array(s)
        var left = 0
        var right = chars.count - 1
        let vowels: Set<Character> = ["a","e","i","o","u","A","E","I","O","U"]
        
        while left < right {
            while left < right && !vowels.contains(chars[left]) {
                left += 1
            }
            while left < right && !vowels.contains(chars[right]) {
                right -= 1
            }
            
            if left < right {
                chars.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        
        return String(chars)
    }
    /* Easy 383. Ransom Note
     Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.
     
     Each letter in magazine can only be used once in ransomNote.
     
     Example 1:
     
     Input: ransomNote = "a", magazine = "b"
     Output: false
     Example 2:
     
     Input: ransomNote = "aa", magazine = "ab"
     Output: false
     Example 3:
     */
    
    func s34_e383_canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var freq: [Character: Int] = [:]
        
        // Count characters in magazine
        for ch in magazine {
            freq[ch, default: 0] += 1
        }
        
        // Check against ransomNote
        for ch in ransomNote {
            if let count = freq[ch], count > 0 {
                freq[ch]! -= 1
            } else {
                return false
            }
        }
        
        return true
    }
    
    /* Easy 383. Ransom Note
     Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.
     
     Each letter in magazine can only be used once in ransomNote.
     
     Example 1:
     
     Input: ransomNote = "a", magazine = "b"
     Output: false
     Example 2:
     
     Input: ransomNote = "aa", magazine = "ab"
     Output: false
     
     */
    func s35_e383_canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var freq: [Character: Int] = [:]
        
        // Count characters in magazine
        for ch in magazine {
            freq[ch, default: 0] += 1
        }
        
        // Check against ransomNote
        for ch in ransomNote {
            if let count = freq[ch], count > 0 {
                freq[ch]! -= 1
            } else {
                return false
            }
        }
        
        return true
    }
    /* Easy 387. First Unique Character in a String
     
     Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.
     Example 1:
     Input: s = "leetcode"
     Output: 0
     Explanation:
     The character 'l' at index 0 is the first character that does not occur at any other index.
     
     Example 2:
     Input: s = "loveleetcode"
     Output: 2
     */
    
    func s36_e387_firstUniqChar(_ s: String) -> Int {
        var freq = [Character: Int]()
        
        // Count frequencies
        for ch in s {
            freq[ch, default: 0] += 1
        }
        
        // Find first unique char
        for (i, ch) in s.enumerated() {
            if freq[ch] == 1 {
                return i
            }
        }
        
        return -1
    }
/* Easy 389. Find the Difference
 
 You are given two strings s and t.

 String t is generated by random shuffling string s and then add one more letter at a random position.

 Return the letter that was added to t.

 Example 1:
 Input: s = "abcd", t = "abcde"
 Output: "e"
 Explanation: 'e' is the letter that was added.
 Example 2:

 Input: s = "", t = "y"
 Output: "y"
 */
    func s37_e389_findTheDifference(_ s: String, _ t: String) -> Character {
            var freq: [Character: Int] = [:]
            
            // Count in s
            for ch in s {
                freq[ch, default: 0] += 1
            }
            
            // Subtract using t
            for ch in t {
                if let count = freq[ch], count > 0 {
                    freq[ch]! -= 1
                } else {
                    return ch
                }
            }
            
            return " " // should never reach
        }
//func isIsomorphic(_ s: String, _ t: String) -> Bool {
//     let sChars = Array(s)
//     let tChars = Array(t)
//     guard sChars.count == tChars.count else { return false }
//     
//     var mapST: [Character: Character] = [:]
//     var mapTS: [Character: Character] = [:]
//     
//     for i in 0..<sChars.count {
//     let sc = sChars[i]
//     let tc = tChars[i]
//     
//     if let mapped = mapST[sc] {
//     if mapped != tc { return false }
//     } else {
//     mapST[sc] = tc
//     }
//     
//     if let mappedBack = mapTS[tc] {
//     if mappedBack != sc { return false }
//     } else {
//     mapTS[tc] = sc
//     }
//     }
//     return true
//     }
    
    /* Easy 392. Is Subsequence
     Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
     A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).
     Example 1:

     Input: s = "abc", t = "ahbgdc"
     Output: true
     Example 2:

     Input: s = "axc", t = "ahbgdc"
     Output: false

     */
    func s38_e392_isSubsequence(_ s: String, _ t: String) -> Bool {
            if s.isEmpty { return true }
            
            let sChars = Array(s)
            let tChars = Array(t)
            
            var i = 0, j = 0
            
            while i < sChars.count && j < tChars.count {
                if sChars[i] == tChars[j] {
                    i += 1
                }
                j += 1
            }
            
            return i == sChars.count
        }
    /* Easy 415. Add Strings
     Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

     You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.

     Example 1:

     Input: num1 = "11", num2 = "123"
     Output: "134"
     */
    func s39_e415_addStrings(_ num1: String, _ num2: String) -> String {
            let arr1 = Array(num1), arr2 = Array(num2)
            var i = arr1.count - 1
            var j = arr2.count - 1
            var carry = 0
            var result = ""
            
            while i >= 0 || j >= 0 || carry > 0 {
                let x = i >= 0 ? Int(String(arr1[i]))! : 0
                let y = j >= 0 ? Int(String(arr2[j]))! : 0
                
                let sum = x + y + carry
                result.append(String(sum % 10))
                carry = sum / 10
                
                i -= 1
                j -= 1
            }
            
            return String(result.reversed())
        }
}
