//
//  StringViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 14/08/25.
//

import Foundation
struct StringViewModel {
    private var dString: DString
    
    init(myString: DString = .init()) {
        self.dString = myString
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
        print(dString.s1_isMatch("aab", "c*a*b")) // true
        print(dString.s1_isMatch("mississippi", "mis*is*p*.")) // false
        //        print(leetCode.isMatch("ab", ".*")) // true
        print(dString.s1_isMatch("aaaaaaaaaaaaaaaaaaab", "a*a*a*a*a*a*a*a*a*a*")) // false
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
    func largestNumber(){
        print(dString.s12_179_largestNumber([10,2]))        // "210"
        print(dString.s12_179_largestNumber([3,30,34,5,9])) // "9534330"
        print(dString.s12_179_largestNumber([0,0]))         // "0"
        
    }
    func longestCommonPrefix() {
        print(dString.s13_14_longestCommonPrefix(["flower","flow","flight"]))  // "fl"
        print(dString.s13_14_longestCommonPrefix(["dog","racecar","car"]))     // ""
        print(dString.s13_14_longestCommonPrefix(["interspecies","interstellar","interstate"])) // "inters"
    }
    func fizzBuzz(){
        print(dString.s14_412_fizzBuzz(15))
    }
    func characterReplacement() {
        print(dString.s15_424_characterReplacement("ABAB", 2))      // 4
        print(dString.s15_424_characterReplacement("AABABBA", 1))   // 4
        print(dString.s15_424_characterReplacement("AAAA", 2))      // 4
        print(dString.s15_424_characterReplacement("ABCDE", 1))     // 2
        print(dString.s15_424_characterReplacement("ABBB", 2))      // 4
    }
    func lengthOfLongestSubstring2(){
        print(dString.s16_3_lengthOfLongestSubstring("abcabcbb"))  // 3
        print(dString.s16_3_lengthOfLongestSubstring("bbbbb"))     // 1
        print(dString.s16_3_lengthOfLongestSubstring("pwwkew"))    // 3
        print(dString.s16_3_lengthOfLongestSubstring(""))          // 0
        print(dString.s16_3_lengthOfLongestSubstring("dvdf"))      // 3
        
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
        print(dString.s19_49_groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
        print(dString.s19_49_groupAnagrams([""]))
        print(dString.s19_49_groupAnagrams(["a"]))

    }
    func isPalindrome2() {
        print(dString.s20_125_isPalindrome("A man, a plan, a canal: Panama"))  // true
        print(dString.s20_125_isPalindrome("race a car"))                      // false
        print(dString.s20_125_isPalindrome(" "))                               // true
        print(dString.s20_125_isPalindrome("No 'x' in Nixon"))                 // true
        print(dString.s20_125_isPalindrome("hello"))                           // false
    }
    func longestPalindrome() {
        print(dString.s21_5_longestPalindrome("babad"))   // "bab" or "aba"
        print(dString.s21_5_longestPalindrome("cbbd"))    // "bb"
        print(dString.s21_5_longestPalindrome("a"))       // "a"
        print(dString.s21_5_longestPalindrome("ac"))      // "a" or "c"
        print(dString.s21_5_longestPalindrome("racecar")) // "racecar"

    }
    func countSubstrings(){
        print(dString.s22_647_countSubstrings("abc"))   // 3
        print(dString.s22_647_countSubstrings("aaa"))   // 6
        print(dString.s22_647_countSubstrings("a"))     // 1
        print(dString.s22_647_countSubstrings("ababa")) // 9

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
        print(dString.s24_17_letterCombinations("23"))  // ["ad","ae","af","bd","be","bf","cd","ce","cf"]
        print(dString.s24_17_letterCombinations(""))    // []
        print(dString.s24_17_letterCombinations("2"))   // ["a","b","c"]
        print(dString.s24_17_letterCombinations("79"))  // 16 combinations
        
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
}

