//
//  DString2.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 17/09/25.
//

/*
 
 */

struct DString2 {
    /* Easy 459. Repeated Substring Pattern
     Given a string s, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.
     Example 1:
     Input: s = "abab"
     Output: true
     Explanation: It is the substring "ab" twice.
     
     */
    func s1e459_repeatedSubstringPattern1(_ s: String) -> Bool {
          let length = s.count
          if length == 1 {
              return false
          }
          var found = true
          let sArr = Array(s.utf8)
          for i in 1...(length/2) {
              if length % i == 0 {
                  found = true
                  for j in i..<length {
                      if sArr[j] != sArr[j % i] {
                          found = false
                          break
                      }
                  }
                  if found { return true }
              }
          }
          return false
      }
    func s1e459_repeatedSubstringPattern(_ s: String) -> Bool {
            let doubled = s + s
            let subStr = String(doubled.dropFirst().dropLast())
            return subStr.contains(s)
        }
    /* Easy 500. Keyboard Row
     Given an array of strings words, return the words that can be typed using letters of the alphabet on only one row of American keyboard like the image below.

     Note that the strings are case-insensitive, both lowercased and uppercased of the same letter are treated as if they are at the same row.

     In the American keyboard:

     the first row consists of the characters "qwertyuiop",
     the second row consists of the characters "asdfghjkl", and
     the third row consists of the characters "zxcvbnm".
     */
    func findWords(_ words: [String]) -> [String] {
            let row1 = Set("qwertyuiop")
            let row2 = Set("asdfghjkl")
            let row3 = Set("zxcvbnm")
            
            var result = [String]()
            
            for word in words {
                let lowerWord = word.lowercased()
                let chars = Set(lowerWord)
                
                if chars.isSubset(of: row1) || chars.isSubset(of: row2) || chars.isSubset(of: row3) {
                    result.append(word)
                }
            }
            
            return result
        }
}
