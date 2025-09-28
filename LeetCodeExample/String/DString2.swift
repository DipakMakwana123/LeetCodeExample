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
    func s40_e459_repeatedSubstringPattern1(_ s: String) -> Bool {
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
    func s41_e459_repeatedSubstringPattern(_ s: String) -> Bool {
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
    func s42_e500_findWords(_ words: [String]) -> [String] {
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
    /* Medium 6. Zigzag Conversion
     
     The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
     
     P   A   H   N
     A P L S I I G
     Y   I   R
     And then read line by line: "PAHNAPLSIIGYIR"
     
     Write the code that will take a string and make this conversion given a number of rows:
     
     string convert(string s, int numRows);
     Example 1:
     Input: s = "PAYPALISHIRING", numRows = 3
     Output: "PAHNAPLSIIGYIR"
     */
    func s43_m6_convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 || numRows >= s.count { return s }
        
        var rows = Array(repeating: "", count: numRows)
        var currentRow = 0
        var goingDown = false
        
        for ch in s {
            rows[currentRow] += String(ch)
            if currentRow == 0 || currentRow == numRows - 1 {
                goingDown.toggle()
            }
            currentRow += goingDown ? 1 : -1
        }
        
        return rows.joined()
    }
    /* Medium 22. Generate Parentheses
     Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
     Example 1:
     
     Input: n = 3
     Output: ["((()))","(()())","(())()","()(())","()()()"]
     Example 2:
     
     Input: n = 1
     Output: ["()"]
     
     */
    func s44_m22_generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        
        func backtrack(_ current: String, _ open: Int, _ close: Int) {
            if current.count == 2 * n {
                result.append(current)
                return
            }
            
            if open < n {
                backtrack(current + "(", open + 1, close)
            }
            
            if close < open {
                backtrack(current + ")", open, close + 1)
            }
        }
        
        backtrack("", 0, 0)
        return result
    }
    /* Medium 43. Multiply Strings
     Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
     
     Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.
     Example 1:
     
     Input: num1 = "2", num2 = "3"
     Output: "6"
     Example 2:
     
     Input: num1 = "123", num2 = "456"
     Output: "56088"
     */
    func s45_m43_multiply(_ num1: String, _ num2: String) -> String {
        let n1 = Array(num1)
        let n2 = Array(num2)
        let m = n1.count, n = n2.count
        var result = Array(repeating: 0, count: m + n)
        
        let zeroAscii = Character("0").asciiValue!
        
        for i in stride(from: m - 1, through: 0, by: -1) {
            let d1 = Int(n1[i].asciiValue! - zeroAscii)
            for j in stride(from: n - 1, through: 0, by: -1) {
                let d2 = Int(n2[j].asciiValue! - zeroAscii)
                let mul = d1 * d2
                let sum = mul + result[i + j + 1]
                
                result[i + j + 1] = sum % 10
                result[i + j] += sum / 10
            }
        }
        
        // Convert to string and remove leading zeros
        var resStr = result.map { String($0) }.joined()
        while resStr.first == "0" && resStr.count > 1 {
            resStr.removeFirst()
        }
        return resStr
    }
    /* Medium 71. Simplify Path
     You are given an absolute path for a Unix-style file system, which always begins with a slash '/'. Your task is to transform this absolute path into its simplified canonical path.
     
     Example 1:
     Input: path = "/home/"
     Output: "/home"
     Explanation:The trailing slash should be removed.
     
     Example 2:
     Input: path = "/home//foo/"
     Output: "/home/foo"
     Explanation: Multiple consecutive slashes are replaced by a single one.
     
     Example 3:
     Input: path = "/home/user/Documents/../Pictures"
     Output: "/home/user/Pictures"
     Explanation: A double period ".." refers to the directory up a level (the parent directory).
     
     Example 4:
     Input: path = "/../"
     Output: "/"
     Explanation: Going one level up from the root directory is not possible.
     
     Example 5:
     Input: path = "/.../a/../b/c/../d/./"
     Output: "/.../b/d"
     Explanation: "..." is a valid name for a directory in this problem.
     */
    func s46_m71_simplifyPath(_ path: String) -> String {
        let parts = path.split(separator: "/", omittingEmptySubsequences: true)
        var stack = [String]()
        
        for part in parts {
            if part == "." {
                continue
            } else if part == ".." {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(String(part))
            }
        }
        
        return "/" + stack.joined(separator: "/")
    }
    /* Medium 72. Edit Distance
     Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.
     
     You have the following three operations permitted on a word:
     
     Insert a character
     Delete a character
     Replace a character
     
     
     Example 1:
     Input: word1 = "horse", word2 = "ros"
     Output: 3
     Explanation:
     horse -> rorse (replace 'h' with 'r')
     rorse -> rose (remove 'r')
     rose -> ros (remove 'e')
     */
    func s47_m72_minDistance(_ word1: String, _ word2: String) -> Int {
        
        let a = Array(word1)
        let b = Array(word2)
        let m = a.count
        let n = b.count
        
        // Handle empty string cases up front to avoid invalid 1...m / 1...n ranges
        if m == 0 { return n }
        if n == 0 { return m }
        
        // dp: (m+1) x (n+1)
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        // base cases
        for i in 0...m { dp[i][0] = i }
        for j in 0...n { dp[0][j] = j }
        
        for i in 1...m {
            for j in 1...n {
                if a[i - 1] == b[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    let deleteOp = dp[i - 1][j]      // delete a[i-1]
                    let insertOp = dp[i][j - 1]      // insert b[j-1] into word1
                    let replaceOp = dp[i - 1][j - 1] // replace a[i-1] with b[j-1]
                    dp[i][j] = 1 + min(deleteOp, min(insertOp, replaceOp))
                }
            }
        }
        return dp[m][n]
    }
    
}
