//
//  LeetCodeModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 05/07/25.
//

import Foundation

struct LeetCodeModel: Identifiable {
    var id = UUID()
    var title: String
}


func repeatedSubstringPattern(_ s: String) -> Bool {
    let doubled = s + s
    print(doubled)
    let subStr = String(doubled.dropFirst().dropLast())
    print(subStr)
    return subStr.contains(s)
}
