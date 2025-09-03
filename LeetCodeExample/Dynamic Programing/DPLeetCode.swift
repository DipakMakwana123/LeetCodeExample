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
    func dp_1_m_198_rob(_ nums: [Int]) -> Int {
           var prev1 = 0
           var prev2 = 0
           for num in nums {
               let temp = max(prev1, prev2 + num)
               prev2 = prev1
               prev1 = temp
           }
           
           return prev1
       }
}
