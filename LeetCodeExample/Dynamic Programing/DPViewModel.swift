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
        print("Expected: 30  Actual: \(dpLeetCode.dp_1_m_198_rob([5,10,15,20]))")
        
        // 30 (rob houses 2 & 4)
        print("Expected: 100  Actual: \(dpLeetCode.dp_1_m_198_rob([100]))")
    }
}
