//
//  DDoubleViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 24/09/25.
//

import Foundation

struct DDoubleViewModel {

    private var dDouble: DDouble
    
    init(viewModel: DDouble = .init()) {
        self.dDouble = viewModel
    }
    
    func myPow() {
        print(dDouble.myPow(2.00000, 10)) // Output: 1024.00000
        print(dDouble.myPow(2.10000, 3)) // Output: 9.26100
        print(dDouble.myPow(2.00000, -2)) // Output: 0.25000
    }
    
}
