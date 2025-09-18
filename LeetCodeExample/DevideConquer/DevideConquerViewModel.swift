//
//  DevideConquerViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 10/09/25.
//

import Foundation

struct DevideConquerViewModel {
    
    private var devideConquer: DevideConquer
    
    init(devideConquer: DevideConquer = .init()) {
        self.devideConquer = devideConquer
    }
    
    func secondLargestNumber() {
        devideConquer.secondLargestNumber(numbers: [10, 4, 7, 20, 15])
    }
    func reverseNumber() {
        //print("Expected: 54321 Actual: \(devideConquer.reverseNumber(number: 12345))")
      //  print("Expected: 21 Actual: \(devideConquer.reverseNumber(number: 12))")
        print("Expected: 2 Actual: \(devideConquer.reverseNumber(number: 2))")
    }
    func makeArrayIdentical() {
        print("Expected: -1 Actual: \(devideConquer.makeArrayIdentical([5,5,5,5,5], [2,22,17,7,9,10]))")
        print("Expected: 3 Actual: \(devideConquer.makeArrayIdentical([5,30,25,20,15], [2,22,17]))")
        print("Expected: 3 Actual: \(devideConquer.makeArrayIdentical([5,30,25,20,15], [2,22,17]))")
        print("Expected: -1 Actual: \(devideConquer.makeArrayIdentical([5,5,5,5,5], [2,22,17]))")
    }
    
}
