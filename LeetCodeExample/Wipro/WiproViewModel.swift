//
//  WiproViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 25/04/26.
//

import Foundation

struct WiproViewModel {
    let wipro: Wipro
    init(_ wipro: Wipro = .init()) {
        self.wipro = wipro
    }
    func minBitsFlips() {
        print(wipro.minBitsFlips(10110, 10011))
    }
}
