//
//  DDouble.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 24/09/25.
//

import Foundation

struct DDouble {
    /* Medium     50. Pow(x, n)

     Implement pow(x, n), which calculates x raised to the power n (i.e., xn).
     Example 1:

     Input: x = 2.00000, n = 10
     Output: 1024.00000
     Example 2:

     Input: x = 2.10000, n = 3
     Output: 9.26100
     Example 3:

     Input: x = 2.00000, n = -2
     Output: 0.25000
     Explanation: 2-2 = 1/22 = 1/4 = 0.25
     */
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        
        let half = myPow(x, n / 2)
        
        if n % 2 == 0 {
            return half * half
        } else {
            if n > 0 {
                return half * half * x
            } else {
                return half * half / x
            }
        }
    }
}
