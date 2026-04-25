//
//  Wipro.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 25/04/26.
//

import Foundation

struct Wipro {
    func minBitsFlips(_ A:Int, _ B:Int) -> Int {
        let xor = A ^ B
        var count = 0
        var num = xor
        while num > 0 {
            count += num & 1
            num >>= 1
        }
        return count
    }
}


