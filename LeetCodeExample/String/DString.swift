//
//  MyString.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 02/08/25.
//

import Foundation

struct DString {
    func s1_isMatch(_ s: String, _ p: String) -> Bool {
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
    
    func s2_isPalindromeTwoPointers(text: String) -> Bool {
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
    
    func s3_isPalindromeRobust(text: String) -> Bool {
        
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
    //    179. Largest Number
    func s12_179_largestNumber(_ nums: [Int]) -> String {
        // Convert numbers to strings
        let strs = nums.map { String($0) }
        
        // Custom sort: compare concatenations
        let sorted = strs.sorted { $0 + $1 > $1 + $0 }
        
        // Join result
        let result = sorted.joined()
        
        // Edge case: if all numbers are "0"
        return result.first == "0" ? "0" : result
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
    func s14_412_fizzBuzz(_ n: Int) -> [String] {
        var result = [String]()
        
        for i in 1...n {
            var str = ""
            
            if i % 3 == 0 { str += "Fizz" }
            if i % 5 == 0 { str += "Buzz" }
            
            result.append(str.isEmpty ? "\(i)" : str)
        }
        
        return result
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
    
    func s16_3_lengthOfLongestSubstring(_ s: String) -> Int {
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
    
    func s21_5_longestPalindrome(_ s: String) -> String {
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
    // 647. Palindromic Substrings
    func s22_647_countSubstrings(_ s: String) -> Int {
        var characters = Array(s)
        var charactersCount = characters.count
        var result = 0
        
        for centerIndex in 0..<(2 * charactersCount) - 1 {
            var leftPointerIndex = centerIndex / 2
            var rightPointerIndex = leftPointerIndex + (centerIndex % 2)
            
            while leftPointerIndex >= 0, rightPointerIndex < charactersCount, characters[leftPointerIndex] == characters[rightPointerIndex] {
                result += 1
                leftPointerIndex -= 1
                rightPointerIndex += 1
            }
        }
        
        return result
        
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
    
    //17. Letter Combinations of a Phone Number
    func s24_17_letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        
        let phone: [Character: [String]] = [
            "2": ["a","b","c"],
            "3": ["d","e","f"],
            "4": ["g","h","i"],
            "5": ["j","k","l"],
            "6": ["m","n","o"],
            "7": ["p","q","r","s"],
            "8": ["t","u","v"],
            "9": ["w","x","y","z"]
        ]
        
        var result = [String]()
        var path = [String]()
        let digitsArray = Array(digits)
        
        func backtrack(_ index: Int) {
            if index == digitsArray.count {
                result.append(path.joined())
                return
            }
            
            let digit = digitsArray[index]
            if let letters = phone[digit] {
                for letter in letters {
                    path.append(letter)
                    backtrack(index + 1)
                    path.removeLast()
                }
            }
        }
        
        backtrack(0)
        return result
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


}
