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
    func topPerformingItems() {
        let sales = [
            [10,20,30],
            [15,25,10],
            [5,35,40],
        ]
        print(wipro.topPerformingItems(sales))
    }
    func minStops() {
        let target = 10
        let startEnergy = 3
        let stations = [(3,4), (5,2), (7,3)]
        print( wipro.minStops(target, startEnergy, stations))
    }
    func lightStateAfterDays() {
//Input:
    let arr =  [1,0,0,1,0,0,1,0]
    let days = 1
    print(wipro.lightStateAfterDays(arr, days))
    //Output: [0,1,1,0,1,1,0,0]
    }
}
