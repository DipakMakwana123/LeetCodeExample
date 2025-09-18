//
//  Sorting.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 27/08/25.
//

import Foundation

struct Sorting {
 
    func largestNumber(_ nums: [Int]) -> String {
        let strs = nums.map { String($0) }
        
        let sorted = strs.sorted { (a, b) -> Bool in
            return a + b > b + a
        }
        
        if sorted[0] == "0" {
            return "0"
        }
        
        return sorted.joined()
    }

}
