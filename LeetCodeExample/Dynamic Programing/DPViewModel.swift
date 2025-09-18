//
//  DPViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 03/09/25.
//

import Foundation

struct DPViewModel {
    private var dpLeetCode: DPLeetCode
    
    init(dpLeetCode: DPLeetCode = .init()) {
        self.dpLeetCode = dpLeetCode
    }
    func rob() {
//        print("Expected: 4  Actual: \(dpLeetCode.dp_1_m_198_rob([1,2,3,1]))")
//        print("Expected: 12  Actual: \(dpLeetCode.dp_1_m_198_rob([2,7,9,3,1]))")
//        print("Expected: 4  Actual: \(dpLeetCode.dp_1_m_198_rob([2,1,1,2]))")
        print("Expected: 30  Actual: \(dpLeetCode.dp1_m198_rob([5,10,15,20]))")
        
        // 30 (rob houses 2 & 4)
        print("Expected: 100  Actual: \(dpLeetCode.dp1_m198_rob([100]))")
    }
    func climbStairs() {
        print("Expected: 2 Actual: \(dpLeetCode.dp2_e70_climbStairs(2))")
        print("Expected: 3 Actual: \(dpLeetCode.dp2_e70_climbStairs(3))")
        print("Expected: 5 Actual: \(dpLeetCode.dp2_e70_climbStairs(4))")
        print("Expected: 8 Actual: \(dpLeetCode.dp2_e70_climbStairs(5))")
        print("Expected: 89 Actual: \(dpLeetCode.dp2_e70_climbStairs(10))")
    }
    func minCostClimbingStairs() {
        print("Expected: 15, Actual: \(dpLeetCode.dp3_e746_minCostClimbingStairs([10,15,20]))")
        print("Expected: 6, Actual: \(dpLeetCode.dp3_e746_minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1]))")
        print("Expected: 0, Actual: \(dpLeetCode.dp3_e746_minCostClimbingStairs([0,0,0,0]))")
        print("Expected: 20, Actual: \(dpLeetCode.dp3_e746_minCostClimbingStairs([5,5,10,100,10,5]))")
    }
    func coinChange() {
        print("Expected: 3(5+5+1 Actual: \(dpLeetCode.dp4_e322_coinChange([1,2,5], 11)))")
        print("Expected: -1 Actual: \(dpLeetCode.dp4_e322_coinChange([2], 3)))")
        print("Expected: 0 Actual: \(dpLeetCode.dp4_e322_coinChange([1], 0)))")
        print("Expected: 2 Actual: \(dpLeetCode.dp4_e322_coinChange([1], 2)))")
        print("Expected: 20 Actual: \(dpLeetCode.dp4_e322_coinChange([186,419,83,408], 6249)))")  // 20 (known tricky test case from LeetCode)
    }
    
    func numDecodings() {
        print("Expected:  2 → `AB`, `L` Actual: \(dpLeetCode.dp5_m91_numDecodings("12"))")
        print("Expected: 3 → `BZ`, `VF`, `BBF` Actual: \(dpLeetCode.dp5_m91_numDecodings("226"))")
        print("Expected:  0 → invalid Actual: \(dpLeetCode.dp5_m91_numDecodings("06"))")
        print("Expected: 1 → `U` `A` Actual: \(dpLeetCode.dp5_m91_numDecodings("2101"))")
        print("Expected:   2 → `AAJF`, `KJF` Actual: \(dpLeetCode.dp5_m91_numDecodings("11106"))")
    }
    func generate() {
        print(dpLeetCode.dp6_e118_generate(1))
        // [[1]]

        print(dpLeetCode.dp6_e118_generate(5))
        // [
        //  [1],
        //  [1,1],
        //  [1,2,1],
        //  [1,3,3,1],
        //  [1,4,6,4,1]
        // ]
        print(dpLeetCode.dp6_e118_generate(0))
        // []
    }
    func wordBreak() {
        print("Expected: true Actual: \(dpLeetCode.dp7_m139_wordBreak("leetcode", ["leet", "code"]))")
        print("Expected: true Actual: \(dpLeetCode.dp7_m139_wordBreak("applepenapple", ["apple", "pen"]))")
        print("Expected: false Actual: \(dpLeetCode.dp7_m139_wordBreak("catsandog", ["cats","dog","sand","and","cat"]))")
        print("Expected: true Actual: \(dpLeetCode.dp7_m139_wordBreak("cars", ["car","ca","rs"]))")
    }
    func combinationSum() {
        var result = dpLeetCode.dp8_m139_combinationSum([2,3,6,7], 7)
        result = dpLeetCode.dp8_m139_combinationSum([2,3,5], 8)
        print("Expected: [[2,2,2,2], [2,3,3], [3,5]]Actual: \(result)")
        result = dpLeetCode.dp8_m139_combinationSum([2], 1)
        print("Expected: [] Actual: \(result)")
        
        result = dpLeetCode.dp8_m139_combinationSum([1], 2)
        print("Expected: [[1,1]] Actual: \(result)")
        
        result = dpLeetCode.dp8_m139_combinationSum([], 7)
        print("Expected: [] Actual: \(result)")
    }
    func rob2() {
        
    }
}



