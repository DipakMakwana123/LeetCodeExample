//
//  StringViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 14/08/25.
//

import Foundation
struct StringViewModel {
    private var dString: DString
    private var dString2: DString2
    
    init(myString: DString = .init(),dString2: DString2 = .init()) {
        self.dString = myString
        self.dString2 = dString2
    }
    func lengthOfLongestSubstring() {
        let s1 = "abcabcbb"
        let result1 = dString.s5_lengthOfLongestSubstring(s1)
        print("String: \"\(s1)\"")
        print("Longest Substring Length: \(result1)") // Expected: 3 ("abc")
        print("---")
    }
    
    func checkBracketStringValidation() {
        // Example 1
        print(
            "() is valid: \(dString.s3_isValidBracketString("()"))"
        )       // Expected: true
        
        // Example 2
        print("()[]{} is valid: \(dString.s3_isValidBracketString("()[]{}"))") // Expected: true
        
        // Example 3
        print("(] is valid: \(dString.s3_isValidBracketString("(]"))")       // Expected: false
        
        // Example 4 (Unclosed opening bracket)
        print("{[ is valid: \(dString.s3_isValidBracketString("{["))")       // Expected: false
        
        // Example 5 (Closing bracket without opening)
        print("] is valid: \(dString.s3_isValidBracketString("]"))")         // Expected: false
        
        // Example 6 (Complex valid case)
        print("{[()]} is valid: \(dString.s3_isValidBracketString("{[()]}"))") // Expected: true
        
        // Example 7 (Complex invalid case)
        print("(( is valid: \(dString.s3_isValidBracketString("(("))")       // Expected: false
        
        // Example 8 (Mismatched type)
        print("({[)]} is valid: \(dString.s3_isValidBracketString("({[)]}"))") // Expected: false
    }
    func isValidAfter180DegreeRotation() {
        print("--- Test Cases ---")
        
        // Valid Rotations
        print("\nTest Case 1: '0'")
        print("Result: \(dString.s6_isValidAfter180DegreeRotation(sequence: "0"))") // Expected: true (Rotated: "0")
        
        print("\nTest Case 2: '1'")
        print("Result: \(dString.s6_isValidAfter180DegreeRotation(sequence: "1"))") // Expected: true (Rotated: "1")
        
        print("\nTest Case 3: '6'")
        print("Result: \(dString.s6_isValidAfter180DegreeRotation(sequence: "6"))") // Expected: true (Rotated: "9")
        
        print("\nTest Case 4: '9'")
        print("Result: \(dString.s6_isValidAfter180DegreeRotation(sequence: "9"))") // Expected: true (Rotated: "6")
        
        print("\nTest Case 5: '8'")
        print("Result: \(dString.s6_isValidAfter180DegreeRotation(sequence: "8"))") // Expected: true (Rotated: "8")
        
        print("\nTest Case 6: '689'")
        print("Result: \(dString.s6_isValidAfter180DegreeRotation(sequence: "689"))") // Expected: true (Rotated: "689" -> 986 reversed -> 689)
        
        print("\nTest Case 7: '10801'")
        print("Result: \(dString.s6_isValidAfter180DegreeRotation(sequence: "10801"))") // Expected: true (Rotated: "10801")
        
        print("\nTest Case 8: '96'")
        print("Result: \(dString.s6_isValidAfter180DegreeRotation(sequence: "96"))") // Expected: true (Rotated: "96" -> 69 reversed -> 96)
        
        
        // Invalid Rotations
        print("\nTest Case 9: '2'")
        print("Result: \(dString.s6_isValidAfter180DegreeRotation(sequence: "2"))") // Expected: false (Contains '2')
        
        print("\nTest Case 10: '123'")
        print("Result: \(dString.s6_isValidAfter180DegreeRotation(sequence: "123"))") // Expected: false (Contains '2', '3')
        
        print("\nTest Case 11: '679'")
        print("Result: \(dString.s6_isValidAfter180DegreeRotation(sequence: "679"))") // Expected: false (Contains '7')
        
        print("\nTest Case 12: 'abc'")
        print("Result: \(dString.s6_isValidAfter180DegreeRotation(sequence: "abc"))")
    }
    func isAnagramFrequencyMap() {
        
        print("\n--- Testing Frequency Map Approach ---")
        // print("s: \"anagram\", t: \"nagaram\" -> \(leetCode.isAnagramFrequencyMap("anagram", "nagaram"))") // Expected: true
        print(
            "s: \"Anagram\", t: \"nagaram\" -> \(dString.s7_isAnagramFrequencyMap("Anagram", "nagaram"))"
        ) // Expected: true
        print("s: \"rat\", t: \"car\" -> \(dString.s7_isAnagramFrequencyMap("rat", "car"))")
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
    func isMatch() {
        // let solution = Solution()
        print(dString.s1_h10_isMatch("aab", "c*a*b")) // true
        print(dString.s1_h10_isMatch("mississippi", "mis*is*p*.")) // false
        //        print(leetCode.isMatch("ab", ".*")) // true
        print(dString.s1_h10_isMatch("aaaaaaaaaaaaaaaaaaab", "a*a*a*a*a*a*a*a*a*a*")) // false
    }
    
    func findSubstring() {
        let s = "barfoothefoobarman"
        let words = ["foo", "bar"]
        print(dString.s8_findSubstring(s, words)) // Output: [0, 9]
    }
    func groupAnagrams() {
        print(dString.s9_groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
        // [["eat","tea","ate"],["tan","nat"],["bat"]]
        print(dString.s9_groupAnagrams([""]))
        // [[""]]
        print(dString.s9_groupAnagrams(["a"]))
        // [["a"]]
    }
    
    func encodeDecode() {
        let input = ["lint","code","love","you"]
        let encoded = dString.s10_encode(input)
        print(encoded)
        // "4#lint4#code4#love3#you"
        
        let decoded = dString.s11_decode(encoded)
        print(decoded)
        // ["lint","code","love","you"]
    }
   
    func longestCommonPrefix() {
        print(dString.s13_14_longestCommonPrefix(["flower","flow","flight"]))  // "fl"
        print(dString.s13_14_longestCommonPrefix(["dog","racecar","car"]))     // ""
        print(dString.s13_14_longestCommonPrefix(["interspecies","interstellar","interstate"])) // "inters"
    }
    
    func characterReplacement() {
        print(dString.s15_424_characterReplacement("ABAB", 2))      // 4
        print(dString.s15_424_characterReplacement("AABABBA", 1))   // 4
        print(dString.s15_424_characterReplacement("AAAA", 2))      // 4
        print(dString.s15_424_characterReplacement("ABCDE", 1))     // 2
        print(dString.s15_424_characterReplacement("ABBB", 2))      // 4
    }
    func lengthOfLongestSubstring2(){
        print(dString.s16_m3_lengthOfLongestSubstring("abcabcbb"))  // 3
        print(dString.s16_m3_lengthOfLongestSubstring("bbbbb"))     // 1
        print(dString.s16_m3_lengthOfLongestSubstring("pwwkew"))    // 3
        print(dString.s16_m3_lengthOfLongestSubstring(""))          // 0
        print(dString.s16_m3_lengthOfLongestSubstring("dvdf"))      // 3
        
    }
    func minWindow() {
        print(dString.s17_76_minWindow("ADOBECODEBANC", "ABC"))   // "BANC"
        print(dString.s17_76_minWindow("a", "a"))                 // "a"
        print(dString.s17_76_minWindow("a", "aa"))                // ""
        print(dString.s17_76_minWindow("aa", "aa"))               // "aa"
        print(dString.s17_76_minWindow("ab", "b"))                // "b"
    }
    func isAnagram(){
        print(dString.s18_242_isAnagram("anagram", "nagaram"))   // true
        print(dString.s18_242_isAnagram("rat", "car"))           // false
        print(dString.s18_242_isAnagram("a", "a"))               // true
        print(dString.s18_242_isAnagram("listen", "silent"))     // true
        print(dString.s18_242_isAnagram("hello", "bello"))       // false
    }
    func groupAnagrams2() {
        print(dString.s19_m49_groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
        print(dString.s19_m49_groupAnagrams([""]))
        print(dString.s19_m49_groupAnagrams(["a"]))

    }
    func isPalindrome2() {
        print(dString.s20_125_isPalindrome("A man, a plan, a canal: Panama"))  // true
        print(dString.s20_125_isPalindrome("race a car"))                      // false
        print(dString.s20_125_isPalindrome(" "))                               // true
        print(dString.s20_125_isPalindrome("No 'x' in Nixon"))                 // true
        print(dString.s20_125_isPalindrome("hello"))                           // false
    }
    func longestPalindrome() {
        print(dString.s21_m5_longestPalindrome("babad"))   // "bab" or "aba"
        print(dString.s21_m5_longestPalindrome("cbbd"))    // "bb"
        print(dString.s21_m5_longestPalindrome("a"))       // "a"
        print(dString.s21_m5_longestPalindrome("ac"))      // "a" or "c"
        print(dString.s21_m5_longestPalindrome("racecar")) // "racecar"
    }
   
    func isPalindrome() {
        // Helper to build linked list
        func buildList(_ arr: [Int]) -> ListNode? {
            guard !arr.isEmpty else { return nil }
            let head = ListNode(arr[0])
            var current = head
            for val in arr.dropFirst() {
                current.next = ListNode(val)
                current = current.next!
            }
            return head
        }

        print(dString.s23_234_isPalindrome(buildList([1,2,2,1])))   // true
        print(dString.s23_234_isPalindrome(buildList([1,2])))       // false
        print(dString.s23_234_isPalindrome(buildList([1,2,3,2,1]))) // true
        print(dString.s23_234_isPalindrome(buildList([1])))         // true
        
    }
    func letterCombinations() {
        print(dString.s24_m17_letterCombinations("23"))  // ["ad","ae","af","bd","be","bf","cd","ce","cf"]
        print(dString.s24_m17_letterCombinations(""))    // []
        print(dString.s24_m17_letterCombinations("2"))   // ["a","b","c"]
        print(dString.s24_m17_letterCombinations("79"))  // 16 combinations
        
    }
    func fullJustify() {
        print(dString.s25_68_fullJustify(
            ["This", "is", "an", "example", "of", "text", "justification."],
            16
        ))
        // [
        // "This    is    an",
        // "example  of text",
        // "justification.  "
        // ]

        print(dString.s25_68_fullJustify(["What","must","be","acknowledgment","shall","be"], 16))
        // [
        // "What   must   be",
        // "acknowledgment  ",
        // "shall be        "
        // ]

        print(dString.s25_68_fullJustify(["Science","is","what","we","understand","well","enough","to","explain",
                           "to","a","computer.","Art","is","everything","else","we","do"], 20))
        // [
        // "Science  is  what we",
        // "understand      well",
        // "enough to explain to",
        // "a  computer.  Art is",
        // "everything else we do"
        // ]

    }
    func addBinary() {
        print(dString.s27_e67_addBinary("11", "1"))       // "100"
        print(dString.s27_e67_addBinary("1010", "1011"))  // "10101"
    }
    
    func solveSudoku() {
        var board: [[Character]] = [
            ["5","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ]
        
        dString.s29_m36_solveSudoku(&board)
        print(board)
    }
    
    func wordPattern() {
        print(dString.s31_e290_wordPattern("abba", "dog cat cat dog"))  // true
        print(dString.s31_e290_wordPattern("abba", "dog cat cat fish")) // false
        print(dString.s31_e290_wordPattern("aaaa", "dog cat cat dog"))  // false
        print(dString.s31_e290_wordPattern("abba", "dog dog dog dog"))  // false
        print(dString.s31_e290_wordPattern("abc", "b c a"))             // true
    }
    func reverseString() {
        var arr1: [Character] = ["h","e","l","l","o"]
        dString.s32_e344_reverseString(&arr1)
        print(arr1)  // ["o","l","l","e","h"]

        var arr2: [Character] = ["H","a","n","n","a","h"]
        dString.s32_e344_reverseString(&arr2)
        print(arr2)  // ["h","a","n","n","a","H"]

        var arr3: [Character] = ["a"]
        dString.s32_e344_reverseString(&arr3)
        print(arr3)  // ["a"]
    }
    func reverseVowels() {
        print(dString.s33_e345_reverseVowels("hello"))      // "holle"
        print(dString.s33_e345_reverseVowels("leetcode"))   // "leotcede"
        print(dString.s33_e345_reverseVowels("aA"))         // "Aa"
        print(dString.s33_e345_reverseVowels("swift"))      // "swifT" (no change since only one vowel)
        print(dString.s33_e345_reverseVowels("AEIOU"))      // "UOIEA"
    }
    func canConstruct() {
        print(dString.s34_e383_canConstruct("a", "b"))        // false
        print(dString.s34_e383_canConstruct("aa", "ab"))      // false
        print(dString.s34_e383_canConstruct("aa", "aab"))     // true
        print(dString.s34_e383_canConstruct("abc", "cbaabc")) // true
    }
    func firstUniqChar() {
        print(dString.s36_e387_firstUniqChar("leetcode"))      // 0
        print(dString.s36_e387_firstUniqChar("loveleetcode"))  // 2
        print(dString.s36_e387_firstUniqChar("aabb"))          // -1
        print(dString.s36_e387_firstUniqChar("swiss"))         // 0 (s repeats, w is unique at index 1)
    }
    func findTheDifference() {
        print(dString.s37_e389_findTheDifference("abcd", "abcde"))  // "e"
        print(dString.s37_e389_findTheDifference("", "y"))          // "y"
        print(dString.s37_e389_findTheDifference("aabb", "ababa"))  // "a"
    }
    func isSubsequence() {
        // Basic true case
        print(dString.s38_e392_isSubsequence("abc", "ahbgdc"))  // true

        // Basic false case
        print(dString.s38_e392_isSubsequence("axc", "ahbgdc"))  // false

        // Empty subsequence → always true
        print(dString.s38_e392_isSubsequence("", "ahbgdc"))     // true

        // Empty target but non-empty s → false
        print(dString.s38_e392_isSubsequence("a", ""))          // false

        // Both empty → true
        print(dString.s38_e392_isSubsequence("", ""))           // true

        // Single character match
        print(dString.s38_e392_isSubsequence("a", "a"))         // true

        // Single character mismatch
        print(dString.s38_e392_isSubsequence("a", "b"))         // false

        // Subsequence at start
        print(dString.s38_e392_isSubsequence("abc", "abcde"))   // true

        // Subsequence at end
        print(dString.s38_e392_isSubsequence("cde", "abcde"))   // true

        // Subsequence in the middle
        print(dString.s38_e392_isSubsequence("bcd", "abcde"))   // true

        // Characters appear but in wrong order
        print(dString.s38_e392_isSubsequence("cba", "abcde"))

    }
    func addStrings() {
        print(dString.s39_e415_addStrings("11", "123"))   // "134"
        print(dString.s39_e415_addStrings("456", "77"))   // "533"
        print(dString.s39_e415_addStrings("0", "0"))      // "0"
        print(dString.s39_e415_addStrings("999", "1"))    // "1000"
    }
    func repeatedSubstringPattern(){
        print(dString2.s41_e459_repeatedSubstringPattern("abab"))       // true
        print(dString2.s41_e459_repeatedSubstringPattern("aba"))        // false
        print(dString2.s41_e459_repeatedSubstringPattern("abcabcabc"))  // true
        print(dString2.s41_e459_repeatedSubstringPattern("aaaa"))       // true
        print(dString2.s41_e459_repeatedSubstringPattern("abcd"))       // false
    }
    func findWords() {
        print(dString2.s42_e500_findWords(["Hello","Alaska","Dad","Peace"])) // ["Alaska","Dad"]
        print(dString2.s42_e500_findWords(["omk"]))                          // []
        print(dString2.s42_e500_findWords(["adsdf","sfd"]))                  // ["adsdf","sfd"]
    }
    func convert() {
        print(dString2.s43_m6_convert("PAYPALISHIRING", 3)) // "PAHNAPLSIIGYIR"
        print(dString2.s43_m6_convert("PAYPALISHIRING", 4)) // "PINALSIGYAHRPI"
        print(dString2.s43_m6_convert("A", 1))              // "A"
    }
    func generateParenthesis(){
        print(dString2.s44_m22_generateParenthesis(3))
        // ["((()))","(()())","(())()","()(())","()()()"]
        print(dString2.s44_m22_generateParenthesis(1))
        // ["()"]
    }
    func multiply() {
        print(dString2.s45_m43_multiply("2", "3"))       // "6"
        print(dString2.s45_m43_multiply("123", "456"))   // "56088"
        print(dString2.s45_m43_multiply("0", "52"))      // "0"
        print(dString2.s45_m43_multiply("999", "999"))   // "998001"
        print(dString2.s45_m43_multiply("123456789", "987654321"))
        // "121932631112635269"
    }
    func simplifyPath() {
        print(dString2.s46_m71_simplifyPath("/home/"))           // "/home"
        print(dString2.s46_m71_simplifyPath("/../"))             // "/"
        print(dString2.s46_m71_simplifyPath("/home//foo/"))      // "/home/foo"
        print(dString2.s46_m71_simplifyPath("/a/./b/../../c/"))  // "/c"
        print(dString2.s46_m71_simplifyPath("/a//b////c/d//././/..")) // "/a/b/c"
    }
    func minDistance() {
        print(dString2.s47_m72_minDistance("horse", "ros"))   // 3
        print(dString2.s47_m72_minDistance("", "abc"))        // 3
        print(dString2.s47_m72_minDistance("abc", ""))        // 3
        print(dString2.s47_m72_minDistance("", ""))           // 0
        print(dString2.s47_m72_minDistance("intention", "execution")) // 5
    }
    func exist() {
        var board: [[Character]] = [["A","B","C","E"],
                 ["S","F","C","S"],
                 ["A","D","E","E"]]
        var word = "ABCCED"
        print(dString2.s48_m79_exist(board, word))
       // Output = true   // Path: A → B → C → C → E → D

        board = [["A","B","C","E"],
                 ["S","F","C","S"],
                 ["A","D","E","E"]]
        word = "ABCB"
        print(dString2.s48_m79_exist(board, word))
        //Output = false  // 'B' would require reusing cell
    }
    func restoreIpAddresses() {
        print(dString2.s49_m93_restoreIpAddresses("25525511135"))
        // ["255.255.11.135", "255.255.111.35"]
    }
    func isInterleave(){
        print(dString2.s50_m97_isInterleave("aabcc", "dbbca", "aadbbcbcac")) // true
        print(dString2.s50_m97_isInterleave("aabcc", "dbbca", "aadbbbaccc")) // false
    }
    func decodeString(){
        print(dString2.decodeString("3[a]2[bc]"))   // Output: "aaabcbc"
        print(dString2.decodeString("3[a2[c]]"))    // Output: "accaccacc"
        print(dString2.decodeString("2[abc]3[cd]ef")) // Output: "abcabccdcdcdef"
    }
}


