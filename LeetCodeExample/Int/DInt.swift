//
//  DInt.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 15/09/25.
//

import Foundation

struct DInt {
    
    /* Easy 190. Reverse Bits
     
     Reverse bits of a given 32 bits signed integer.
     
     Example 1:
     
     Input: n = 43261596
     
     Output: 964176192
     
     Explanation:
     
     Integer    Binary
     43261596    00000010100101000001111010011100
     964176192   00111001011110000010100101000000
     
     */
    func i1_e190_reverseBits(_ n: Int) -> Int {
        var input = n
        var result: Int = 0
        
        for _ in 0..<32 {
            result = (result << 1) | (input & 1)
            input >>= 1
        }
        
        return result
    }
    /* Easy 202. Happy Number
     
     
     Write an algorithm to determine if a number n is happy.
     
     A happy number is a number defined by the following process:
     
     Starting with any positive integer, replace the number by the sum of the squares of its digits.
     Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
     Those numbers for which this process ends in 1 are happy.
     Return true if n is a happy number, and false if not.
     
     
     Example 1:
     
     Input: n = 19
     Output: true
     
     Explanation:
     12 + 92 = 82
     82 + 22 = 68
     62 + 82 = 100
     12 + 02 + 02 = 1
     Example 2:
     
     Input: n = 2
     Output: false
     
     
     */
    
    func i2_e202_isHappy(_ n: Int) -> Bool {
        var seen = Set<Int>()
        var num = n
        
        func sumOfSquares(_ x: Int) -> Int {
            var x = x
            var sum = 0
            while x > 0 {
                let digit = x % 10
                sum += digit * digit
                x /= 10
            }
            return sum
        }
        
        while num != 1 && !seen.contains(num) {
            seen.insert(num)
            num = sumOfSquares(num)
        }
        
        return num == 1
    }
    /* Easy 217. Contains Duplicate
     
     Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
     Example 1:
     Input: nums = [1,2,3,1]
     Output: true
     
     Example 2:
     Input: nums = [1,2,3,4]
     Output: false
     */
    func i3_e217_containsDuplicate(_ nums: [Int]) -> Bool {
        let a = Set(nums)
        if a.count == nums.count{
            return false
        }
        return true
    }
    /* Easy 219. Contains Duplicate II
     
     Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.
     Example 1:
     Input: nums = [1,2,3,1], k = 3
     Output: true
     Example 2:
     
     Input: nums = [1,0,1,1], k = 1
     Output: true
     Example 3:
     
     Input: nums = [1,2,3,1,2,3], k = 2
     Output: false
     
     */
    func i4_e219_containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var lastSeen: [Int: Int] = [:]
        
        for (i, num) in nums.enumerated() {
            if let prevIndex = lastSeen[num], i - prevIndex <= k {
                return true
            }
            lastSeen[num] = i
        }
        
        return false
    }
    /* Easy 231. Power of Two
     Given an integer n, return true if it is a power of two. Otherwise, return false.
     
     An integer n is a power of two, if there exists an integer x such that n == 2x.
     
     Example 1:
     Input: n = 1
     Output: true
     
     Example 2:
     Input: n = 3
     Output: false
     
     */
    func i5_e231_isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 { return false }
        var x = n
        while x % 2 == 0 {
            x /= 2
        }
        return x == 1
    }
    /* Easy 258. Add Digits
     
     Given an integer num, repeatedly add all its digits until the result has only one digit, and return it.
     
     Example 1:
     
     Input: num = 38
     Output: 2
     Explanation: The process is
     38 --> 3 + 8 --> 11
     11 --> 1 + 1 --> 2
     Since 2 has only one digit, return it.
     Example 2:
     
     Input: num = 0
     Output: 0
     
     */
    func i6_e258_addDigits(_ num: Int) -> Int {
        if num == 0 { return 0 }
        return 1 + (num - 1) % 9
    }
    func i6_e258_addDigits1(_ num: Int) -> Int {
        var n = num
        while n >= 10 {
            var sum = 0
            while n > 0 {
                sum += n % 10
                n /= 10
            }
            n = sum
        }
        return n
    }
    /* Easy 263. Ugly Number
     An ugly number is a positive integer which does not have a prime factor other than 2, 3, and 5.
     
     Given an integer n, return true if n is an ugly number.
     Example 1:
     
     Input: n = 6
     Output: true
     Explanation: 6 = 2 × 3
     Example 2:
     
     Input: n = 1
     Output: true
     Explanation: 1 has no prime factors.
     */
    func i7_e263_isUgly(_ n: Int) -> Bool {
        if n <= 0 { return false }
        var num = n
        for factor in [2, 3, 5] {
            while num % factor == 0 {
                num /= factor
            }
        }
        return num == 1
    }
    
    /* Easy 268. Missing Number
     Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
     Example 1:
     
     Input: nums = [3,0,1]
     Output: 2
     Explanation:
     
     n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
     */
    func i8_e268_missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        let expectedSum = n * (n + 1) / 2
        let actualSum = nums.reduce(0, +)
        return expectedSum - actualSum
    }
    /* Easy 283. Move Zeroes
     
     Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
     
     Note that you must do this in-place without making a copy of the array.
     
     Example 1:
     
     Input: nums = [0,1,0,3,12]
     Output: [1,3,12,0,0]
     Example 2:
     
     Input: nums = [0]
     Output: [0]
     
     */
    func i9_e283_moveZeroes(_ nums: inout [Int]) {
        var lastNonZero = 0
        
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums.swapAt(i, lastNonZero)
                lastNonZero += 1
            }
        }
    }
    /* Easy 326. Power of Three
     
     Given an integer n, return true if it is a power of three. Otherwise, return false.
     
     An integer n is a power of three, if there exists an integer x such that n == 3x.
     
     Example 1:
     
     Input: n = 27
     Output: true
     Explanation: 27 = 33
     
     */
    
    func i10_e326_isPowerOfThree(_ n: Int) -> Bool {
        var num = n
        if num <= 0 { return false }
        
        while num % 3 == 0 {
            num /= 3
        }
        
        return num == 1
    }
    /* Easy 69. Sqrt(x)
     Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.
     
     You must not use any built-in exponent function or operator.
     
     For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.
     
     Example 1:
     
     Input: x = 8
     Output: 2
     Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
     */
    func i11_e69_mySqrt(_ x: Int) -> Int {
        if x < 2 { return x }
        var guess = x / 2
        while guess * guess > x {
            guess = (guess + x / guess) / 2
        }
        return guess
    }
    /* Easy 367. Valid Perfect Square
     Given a positive integer num, return true if num is a perfect square or false otherwise.
     
     A perfect square is an integer that is the square of an integer. In other words, it is the product of some integer with itself.
     
     You must not use any built-in library function, such as sqrt.
     
     Example 1:
     
     Input: num = 16
     Output: true
     Explanation: We return true because 4 * 4 = 16 and 4 is an integer.
     */
    func i12_e367_isPerfectSquare(_ num: Int) -> Bool {
        if num < 2 { return true }  // 1 is a perfect square
        
        var left = 2
        var right = num / 2
        
        while left <= right {
            let mid = left + (right - left) / 2
            let square = mid * mid
            
            if square == num {
                return true
            } else if square < num {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return false
    }
    /* Easy 9. Palindrome Number
     
     Given an integer x, return true if x is a palindrome, and false otherwise.
     Example 1:
     
     Input: x = 121
     Output: true
     Explanation: 121 reads as 121 from left to right and from right to left.
     */
    func i13_e9_isPalindromeNumber(_ x: Int) -> Bool {
        if x < 0 { return false }
        var num = x
        var rev = 0
        while num > 0 {
            rev = rev * 10 + num % 10
            num /= 10
        }
        return x == rev
    }
    //    179. Largest Number
    func i14_179_largestNumber(_ nums: [Int]) -> String {
        // Convert numbers to strings
        let strs = nums.map { String($0) }
        
        // Custom sort: compare concatenations
        let sorted = strs.sorted { $0 + $1 > $1 + $0 }
        
        // Join result
        let result = sorted.joined()
        
        // Edge case: if all numbers are "0"
        return result.first == "0" ? "0" : result
    }
    func i15_412_fizzBuzz(_ n: Int) -> [String] {
        var result = [String]()
        
        for i in 1...n {
            var str = ""
            
            if i % 3 == 0 { str += "Fizz" }
            if i % 5 == 0 { str += "Buzz" }
            
            result.append(str.isEmpty ? "\(i)" : str)
        }
        
        return result
    }
    // 647. Palindromic Substrings
    func i16_647_countSubstrings(_ s: String) -> Int {
        let characters = Array(s)
        let charactersCount = characters.count
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
    /* Easy 171. Excel Sheet Column Number
     
     Given a string columnTitle that represents the column title as appears in an Excel sheet, return its corresponding column number.
     
     For example:
     
     A -> 1
     B -> 2
     C -> 3
     ...
     Z -> 26
     AA -> 27
     AB -> 28
     ...
     */
    
    func i17_e171_titleToNumber(_ columnTitle: String) -> Int {
        var result = 0
        for char in columnTitle {
            let value = Int(char.asciiValue! - Character("A").asciiValue! + 1)
            result = result * 26 + value
        }
        return result
    }
    /* Easy 228. Summary Ranges
     
     You are given a sorted unique integer array nums.
     
     A range [a,b] is the set of all integers from a to b (inclusive).
     
     Return the smallest sorted list of ranges that cover all the numbers in the array exactly. That is, each element of nums is covered by exactly one of the ranges, and there is no integer x such that x is in one of the ranges but not in nums.
     
     Each range [a,b] in the list should be output as:
     
     "a->b" if a != b
     "a" if a == b
     
     Example 1:
     
     Input: nums = [0,1,2,4,5,7]
     Output: ["0->2","4->5","7"]
     Explanation: The ranges are:
     [0,2] --> "0->2"
     [4,5] --> "4->5"
     [7,7] --> "7"
     
     */
    
    func i18_e228_summaryRanges(_ nums: [Int]) -> [String] {
        var result: [String] = []
        var i = 0
        let n = nums.count
        
        while i < n {
            let start = nums[i]
            var end = start
            
            while i + 1 < n && nums[i + 1] == nums[i] + 1 {
                i += 1
                end = nums[i]
            }
            
            if start == end {
                result.append("\(start)")
            } else {
                result.append("\(start)->\(end)")
            }
            
            i += 1
        }
        
        return result
    }
    /* Easy 409. Longest Palindrome
     Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.
     
     Letters are case sensitive, for example, "Aa" is not considered a palindrome.
     Example 1:
     
     Input: s = "abccccdd"
     Output: 7
     Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
     */
    func i19_e409_longestPalindrome(_ s: String) -> Int {
        var charCount = [Character: Int]()
        for ch in s {
            charCount[ch, default: 0] += 1
        }
        
        var length = 0
        var hasOdd = false
        
        for count in charCount.values {
            length += count / 2 * 2
            if count % 2 == 1 {
                hasOdd = true
            }
        }
        
        return hasOdd ? length + 1 : length
    }
    
    func i20_isPalindromeTwoPointers(text: String) -> Bool {
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
    func i21_isPalindromeRobust(text: String) -> Bool {
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
    /* Easy 414. Third Maximum Number
     Given an integer array nums, return the third distinct maximum number in this array. If the third maximum does not exist, return the maximum number.
     Example 1:
     
     Input: nums = [3,2,1]
     Output: 1
     Explanation:
     The first distinct maximum is 3.
     The second distinct maximum is 2.
     The third distinct maximum is 1.
     */
    func i22_e414_thirdMax(_ nums: [Int]) -> Int {
        var first: Int? = nil
        var second: Int? = nil
        var third: Int? = nil
        
        for num in nums {
            if num == first || num == second || num == third {
                continue
            }
            if first == nil || num > first! {
                (first, second, third) = (num, first, second)
            } else if second == nil || num > second! {
                (second, third) = (num, second)
            } else if third == nil || num > third! {
                third = num
            }
        }
        
        return third ?? first!
    }
    /* Easy 434. Number of Segments in a String
     Given a string s, return the number of segments in the string.
     
     A segment is defined to be a contiguous sequence of non-space characters.
     Example 1:
     
     Input: s = "Hello, my name is John"
     Output: 5
     Explanation: The five segments are ["Hello,", "my", "name", "is", "John"]
     
     */
    func i23_e434_countSegments(_ s: String) -> Int {
        var count = 0
        var inSegment = false
        
        for ch in s {
            if ch != " " {
                if !inSegment {
                    count += 1
                    inSegment = true
                }
            } else {
                inSegment = false
            }
        }
        
        return count
    }
    /* Easy 441. Arranging Coins
     You have n coins and you want to build a staircase with these coins. The staircase consists of k rows where the ith row has exactly i coins. The last row of the staircase may be incomplete.
     
     Given the integer n, return the number of complete rows of the staircase you will build.
     */
    
    func i24_e441_arrangeCoins(_ n: Int) -> Int {
        var left = 0
        var right = n
        
        while left <= right {
            let mid = (left + right) / 2
            let sum = mid * (mid + 1) / 2
            
            if sum == n {
                return mid
            } else if sum < n {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return right
    }
    /* Easy 448. Find All Numbers Disappeared in an Array
     
     Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.
     
     Example 1:
     Input: nums = [4,3,2,7,8,2,3,1]
     Output: [5,6]
     
     */
    func i25_e448_(_ nums: [Int]) -> [Int] {
        let n = nums.count
        let setNums = Set(nums)
        var result = [Int]()
        
        for i in 1...n {
            if !setNums.contains(i) {
                result.append(i)
            }
        }
        
        return result
    }
    /* Easy 455. Assign Cookies
     Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie.
     
     Each child i has a greed factor g[i], which is the minimum size of a cookie that the child will be content with; and each cookie j has a size s[j]. If s[j] >= g[i], we can assign the cookie j to the child i, and the child i will be content. Your goal is to maximize the number of your content children and output the maximum number.
     
     
     
     Example 1:
     
     Input: g = [1,2,3], s = [1,1]
     Output: 1
     Explanation: You have 3 children and 2 cookies. The greed factors of 3 children are 1, 2, 3.
     And even though you have 2 cookies, since their size is both 1, you could only make the child whose greed factor is 1 content.
     You need to output 1.
     */
    func i26_e455_findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let gSorted = g.sorted()
        let sSorted = s.sorted()
        
        var i = 0, j = 0
        var count = 0
        
        while i < gSorted.count && j < sSorted.count {
            if sSorted[j] >= gSorted[i] {
                count += 1
                i += 1
                j += 1
            } else {
                j += 1
            }
        }
        return count
    }
    /* Easy 461. Hamming Distance
     The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
     Given two integers x and y, return the Hamming distance between them.
     Example 1:
     
     Input: x = 1, y = 4
     Output: 2
     Explanation:
     1   (0 0 0 1)
     4   (0 1 0 0)
     ↑   ↑
     The above arrows point to positions where the corresponding bits are different.
     */
    
    func i27e461_hammingDistance(_ x: Int, _ y: Int) -> Int {
        var n = x ^ y
        var count = 0
        while n > 0 {
            n &= (n - 1)  // drop lowest set bit
            count += 1
        }
        return count
    }
    /* Easy 476. Number Complement
     The complement of an integer is the integer you get when you flip all the 0's to 1's and all the 1's to 0's in its binary representation.
     
     For example, The integer 5 is "101" in binary and its complement is "010" which is the integer 2.
     Given an integer num, return its complement.
     
     Example 1:
     
     Input: num = 5
     Output: 2
     Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
     */
    func i28e476_findComplement(_ num: Int) -> Int {
        if num == 0 { return 1 }
        var mask = 0
        var temp = num
        while temp > 0 {
            mask = (mask << 1) | 1
            temp >>= 1
        }
        return mask ^ num
    }
    /*
     Easy 482. License Key Formatting
     You are given a license key represented as a string s that consists of only alphanumeric characters and dashes. The string is separated into n + 1 groups by n dashes. You are also given an integer k.
     
     We want to reformat the string s such that each group contains exactly k characters, except for the first group, which could be shorter than k but still must contain at least one character. Furthermore, there must be a dash inserted between two groups, and you should convert all lowercase letters to uppercase.
     
     Return the reformatted license key.
     Example 1:
     Input: s = "5F3Z-2e-9-w", k = 4
     Output: "5F3Z-2E9W"
     Explanation: The string s has been split into two parts, each part has 4 characters.
     Note that the two extra dashes are not needed and can be removed.
     
     */
    func i29e482_licenseKeyFormatting(_ s: String, _ k: Int) -> String {
        // Step 1: Clean and uppercase
        let clean = s.replacingOccurrences(of: "-", with: "").uppercased()
        if clean.isEmpty { return "" }
        
        // Step 2: Build result from end
        var result = ""
        var count = 0
        for char in clean.reversed() {
            if count == k {
                result.append("-")
                count = 0
            }
            result.append(char)
            count += 1
        }
        
        // Step 3: Reverse final string
        return String(result.reversed())
    }
    /* Easy 485. Max Consecutive Ones
    
     Given a binary array nums, return the maximum number of consecutive 1's in the array.
     Example 1:
     Input: nums = [1,1,0,1,1,1]
     Output: 3
     Explanation: The first two digits or the last three digits are consecutive 1s. The maximum number of consecutive 1s is 3.
     */
    func i30e485_findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
            var maxCount = 0
            var currentCount = 0
            
            for num in nums {
                if num == 1 {
                    currentCount += 1
                    maxCount = max(maxCount, currentCount)
                } else {
                    currentCount = 0
                }
            }
            return maxCount
        }
    /* Easy 495. Teemo Attacking
     Our hero Teemo is attacking an enemy Ashe with poison attacks! When Teemo attacks Ashe, Ashe gets poisoned for a exactly duration seconds. More formally, an attack at second t will mean Ashe is poisoned during the inclusive time interval [t, t + duration - 1]. If Teemo attacks again before the poison effect ends, the timer for it is reset, and the poison effect will end duration seconds after the new attack.

     You are given a non-decreasing integer array timeSeries, where timeSeries[i] denotes that Teemo attacks Ashe at second timeSeries[i], and an integer duration.

     Return the total number of seconds that Ashe is poisoned.
     Example 1:

     Input: timeSeries = [1,4], duration = 2
     Output: 4
     Explanation: Teemo's attacks on Ashe go as follows:
     - At second 1, Teemo attacks, and Ashe is poisoned for seconds 1 and 2.
     - At second 4, Teemo attacks, and Ashe is poisoned for seconds 4 and 5.
     Ashe is poisoned for seconds 1, 2, 4, and 5, which is 4 seconds in total.
     */
    func i31e495_findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
            guard !timeSeries.isEmpty else { return 0 }
            
            var total = 0
            for i in 0..<timeSeries.count - 1 {
                total += min(duration, timeSeries[i + 1] - timeSeries[i])
            }
            
            // Add last attack duration
            total += duration
            
            return total
        }
   
   
}
