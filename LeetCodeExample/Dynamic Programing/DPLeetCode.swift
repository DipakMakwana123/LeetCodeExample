//
//  DPLeetCode.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 03/09/25.
//

import Foundation

struct DPLeetCode {
    /*
     Medium: 198. House Robber
     
     You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
     
     Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.
     Example 1:
     Input: nums = [1,2,3,1]
     Output: 4
     Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
     Total amount you can rob = 1 + 3 = 4.
     */
    func dp1_m198_rob(_ nums: [Int]) -> Int {
        var maxRob = 0
        var house = 0
        for num in nums {
            let temp = max(maxRob, house + num)
            house = maxRob
            maxRob = temp
        }
        
        return maxRob
    }
    
    /* Easy: 70. Climbing Stairs
     You are climbing a staircase. It takes n steps to reach the top.
     
     Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
     Example 1:
     
     Input: n = 2
     Output: 2
     Explanation: There are two ways to climb to the top.
     1. 1 step + 1 step
     2. 2 steps
     */
    func dp2_e70_climbStairs(_ n: Int) -> Int {
        if n <= 2 { return n }
        var prev1 = 2   // ways to reach step 2
        var prev2 = 1   // ways to reach step 1
        
        for _ in 3...n {
            let current = prev1 + prev2
            prev2 = prev1
            prev1 = current
        }
        return prev1
    }
    
    
    /*
     746. Min Cost Climbing Stairs
     Easy
     You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.
     
     You can either start from the step with index 0, or the step with index 1.
     
     Return the minimum cost to reach the top of the floor.
     Example 1:
     
     Input: cost = [10,15,20]
     Output: 15
     Explanation: You will start at index 1.
     - Pay 15 and climb two steps to reach the top.
     The total cost is 15.
     */
    
    
    func dp3_e746_minCostClimbingStairs(_ cost: [Int]) -> Int {
        var prev1 = 0  // dp[i-1]
        var prev2 = 0  // dp[i-2]
        
        for i in 2...cost.count {
            let current = min(prev1 + cost[i-1], prev2 + cost[i-2])
            prev2 = prev1
            prev1 = current
        }
        return prev1
    }
    /*
     322. Coin Change
     Medium
     You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.
     
     Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
     
     You may assume that you have an infinite number of each kind of coin.
     Example 1:
     
     Input: coins = [1,2,5], amount = 11
     Output: 3
     Explanation: 11 = 5 + 5 + 1
     
     */
    func dp4_e322_coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        
        for i in 1...amount {
            for coin in coins {
                if i - coin >= 0 {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
    /*
     91. Decode Ways
     Medium
     Topics
     premium lock icon
     Companies
     You have intercepted a secret message encoded as a string of numbers. The message is decoded via the following mapping:
     
     "1" -> 'A'
     
     "2" -> 'B'
     
     ...
     
     "25" -> 'Y'
     
     "26" -> 'Z'
     
     However, while decoding the message, you realize that there are many different ways you can decode the message because some codes are contained in other codes ("2" and "5" vs "25").
     
     For example, "11106" can be decoded into:
     
     "AAJF" with the grouping (1, 1, 10, 6)
     "KJF" with the grouping (11, 10, 6)
     The grouping (1, 11, 06) is invalid because "06" is not a valid code (only "6" is valid).
     Note: there may be strings that are impossible to decode.
     
     Given a string s containing only digits, return the number of ways to decode it. If the entire string cannot be decoded in any valid way, return 0.
     
     The test cases are generated so that the answer fits in a 32-bit integer.
     
     
     
     Example 1:
     
     Input: s = "12"
     
     Output: 2
     
     Explanation:
     
     "12" could be decoded as "AB" (1 2) or "L" (12).
     */
    func dp5_m91_numDecodings(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count
        if n == 0 { return 0 }
        
        var prev2 = 1                   // dp[0] = 1 (empty string)
        var prev1 = chars[0] == "0" ? 0 : 1  // dp[1]
        
        if n == 1 { return prev1 }
        
        for i in 2...n {
            var current = 0
            let oneDigit = Int(String(chars[i-1]))!
            let twoDigits = Int(String(chars[i-2...i-1]))!
            
            if oneDigit >= 1 {
                current += prev1
            }
            if twoDigits >= 10 && twoDigits <= 26 {
                current += prev2
            }
            
            prev2 = prev1
            prev1 = current
        }
        
        return prev1
    }
    
    /* Easy: 118. Pascal's Triangle
     Given an integer numRows, return the first numRows of Pascal's triangle.
     
     In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
     Example 1:
     
     Input: numRows = 5
     Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
     */
    
    func dp6_e118_generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        for i in 0..<numRows {
            var row = [Int](repeating: 1, count: i + 1)
            if i >= 2 {
                for j in 1..<i {
                    row[j] = result[i-1][j-1] + result[i-1][j]
                }
            }
            result.append(row)
        }
        
        return result
    }
    
    /*
     139. Word Break
     Medium
     
     Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.
     
     Note that the same word in the dictionary may be reused multiple times in the segmentation.
     
     
     Example 1:
     
     Input: s = "leetcode", wordDict = ["leet","code"]
     Output: true
     Explanation: Return true because "leetcode" can be segmented as "leet code".
     
     */
    
    func dp7_m139_wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        //lets do top down approach
        var memo = [Int: Bool]()
        var s = Array(s)
        
        func wordBreakHelper(_ index: Int) -> Bool {
            //termination condition
            if index < 0 { return true }
            
            if let cache = memo[index] {
                return cache
            }
            
            for word in wordDict {
                let cut = index - word.count + 1
                if cut < 0 { continue } //check boundary
                let sub = String(s[cut...index])
                
                //check if this cut can lead to an answer
                if sub == word && wordBreakHelper(cut - 1) {
                    memo[index] = true
                    return true
                }
            }
            
            memo[index] = false
            return false
        }
        
        return wordBreakHelper(s.count - 1)
    }
    /* Medium 39. Combination Sum
     
     Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.
     
     The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.
     
     The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.
     Example 1:
     
     Input: candidates = [2,3,6,7], target = 7
     Output: [[2,2,3],[7]]
     Explanation:
     2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
     7 is a candidate, and 7 = 7.
     These are the only two combinations.
     */
    
    func dp8_m139_combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results = [[Int]]()
        var path = [Int]()
        
        func backtrack(_ start: Int, _ remaining: Int) {
            if remaining == 0 {
                results.append(path)
                return
            }
            
            for i in start..<candidates.count {
                let num = candidates[i]
                if num <= remaining {
                    path.append(num)
                    backtrack(i, remaining - num)   // not i+1 because we can reuse
                    path.removeLast()
                }
            }
        }
        
        backtrack(0, target)
        return results
    }
    /*
     213. House Robber II
     Medium
     Topics
     premium lock icon
     Companies
     Hint
     You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.
     
     Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.
     
     Example 1:
     
     Input: nums = [2,3,2]
     Output: 3
     Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.
     */
    func dp9_m213_rob2(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 { return nums[0] }
        
        func robLinear(_ arr: [Int]) -> Int {
            var prev2 = 0, prev1 = 0
            for num in arr {
                let temp = max(prev1, prev2 + num)
                prev2 = prev1
                prev1 = temp
            }
            return prev1
        }
        
        // Case 1: Exclude last house
        let case1 = robLinear(Array(nums[0..<n-1]))
        // Case 2: Exclude first house
        let case2 = robLinear(Array(nums[1..<n]))
        
        return max(case1, case2)
    }
    
}
