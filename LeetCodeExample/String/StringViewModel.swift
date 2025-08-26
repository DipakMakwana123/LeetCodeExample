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
        let result1 = dString.S5_lengthOfLongestSubstring(s1)
        print("String: \"\(s1)\"")
        print("Longest Substring Length: \(result1)") // Expected: 3 ("abc")
        print("---")
    }
    
    func checkBracketStringValidation() {
        // Example 1
        print(
            "() is valid: \(dString.S3_isValidBracketString("()"))"
        )       // Expected: true
        
        // Example 2
        print("()[]{} is valid: \(dString.S3_isValidBracketString("()[]{}"))") // Expected: true
        
        // Example 3
        print("(] is valid: \(dString.S3_isValidBracketString("(]"))")       // Expected: false
        
        // Example 4 (Unclosed opening bracket)
        print("{[ is valid: \(dString.S3_isValidBracketString("{["))")       // Expected: false
        
        // Example 5 (Closing bracket without opening)
        print("] is valid: \(dString.S3_isValidBracketString("]"))")         // Expected: false
        
        // Example 6 (Complex valid case)
        print("{[()]} is valid: \(dString.S3_isValidBracketString("{[()]}"))") // Expected: true
        
        // Example 7 (Complex invalid case)
        print("(( is valid: \(dString.S3_isValidBracketString("(("))")       // Expected: false
        
        // Example 8 (Mismatched type)
        print("({[)]} is valid: \(dString.S3_isValidBracketString("({[)]}"))") // Expected: false
    }
    func isValidAfter180DegreeRotation() {
        print("--- Test Cases ---")
        
        // Valid Rotations
        print("\nTest Case 1: '0'")
        print("Result: \(dString.S6_isValidAfter180DegreeRotation(sequence: "0"))") // Expected: true (Rotated: "0")
        
        print("\nTest Case 2: '1'")
        print("Result: \(dString.S6_isValidAfter180DegreeRotation(sequence: "1"))") // Expected: true (Rotated: "1")
        
        print("\nTest Case 3: '6'")
        print("Result: \(dString.S6_isValidAfter180DegreeRotation(sequence: "6"))") // Expected: true (Rotated: "9")
        
        print("\nTest Case 4: '9'")
        print("Result: \(dString.S6_isValidAfter180DegreeRotation(sequence: "9"))") // Expected: true (Rotated: "6")
        
        print("\nTest Case 5: '8'")
        print("Result: \(dString.S6_isValidAfter180DegreeRotation(sequence: "8"))") // Expected: true (Rotated: "8")
        
        print("\nTest Case 6: '689'")
        print("Result: \(dString.S6_isValidAfter180DegreeRotation(sequence: "689"))") // Expected: true (Rotated: "689" -> 986 reversed -> 689)
        
        print("\nTest Case 7: '10801'")
        print("Result: \(dString.S6_isValidAfter180DegreeRotation(sequence: "10801"))") // Expected: true (Rotated: "10801")
        
        print("\nTest Case 8: '96'")
        print("Result: \(dString.S6_isValidAfter180DegreeRotation(sequence: "96"))") // Expected: true (Rotated: "96" -> 69 reversed -> 96)
        
        
        // Invalid Rotations
        print("\nTest Case 9: '2'")
        print("Result: \(dString.S6_isValidAfter180DegreeRotation(sequence: "2"))") // Expected: false (Contains '2')
        
        print("\nTest Case 10: '123'")
        print("Result: \(dString.S6_isValidAfter180DegreeRotation(sequence: "123"))") // Expected: false (Contains '2', '3')
        
        print("\nTest Case 11: '679'")
        print("Result: \(dString.S6_isValidAfter180DegreeRotation(sequence: "679"))") // Expected: false (Contains '7')
        
        print("\nTest Case 12: 'abc'")
        print("Result: \(dString.S6_isValidAfter180DegreeRotation(sequence: "abc"))")
    }
    func isAnagramFrequencyMap() {
        
        print("\n--- Testing Frequency Map Approach ---")
        // print("s: \"anagram\", t: \"nagaram\" -> \(leetCode.isAnagramFrequencyMap("anagram", "nagaram"))") // Expected: true
        print(
            "s: \"Anagram\", t: \"nagaram\" -> \(dString.S7_isAnagramFrequencyMap("Anagram", "nagaram"))"
        ) // Expected: true
        print("s: \"rat\", t: \"car\" -> \(dString.S7_isAnagramFrequencyMap("rat", "car"))")
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
        print(dString.S1_isMatch("aab", "c*a*b")) // true
        print(dString.S1_isMatch("mississippi", "mis*is*p*.")) // false
//        print(leetCode.isMatch("ab", ".*")) // true
        print(dString.S1_isMatch("aaaaaaaaaaaaaaaaaaab", "a*a*a*a*a*a*a*a*a*a*")) // false
    }
    
    func findSubstring() {
        let s = "barfoothefoobarman"
        let words = ["foo", "bar"]
        print(dString.S8_findSubstring(s, words)) // Output: [0, 9]
    }
    func groupAnagrams() {
        print(dString.S9_groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
        // [["eat","tea","ate"],["tan","nat"],["bat"]]
        print(dString.S9_groupAnagrams([""]))
        // [[""]]
        print(dString.S9_groupAnagrams(["a"]))
        // [["a"]]
    }
    
    func encodeDecode() {
        let input = ["lint","code","love","you"]
        let encoded = dString.S10_encode(input)
        print(encoded)
        // "4#lint4#code4#love3#you"

        let decoded = dString.S11_decode(encoded)
        print(decoded)
        // ["lint","code","love","you"]
    }
    func largestNumber(){
        print(dString.S12_largestNumber([10,2]))        // "210"
        print(dString.S12_largestNumber([3,30,34,5,9])) // "9534330"
        print(dString.S12_largestNumber([0,0]))         // "0"

    }
}
