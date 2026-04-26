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
    func topPerformingItems(_ sales:[[Int]]) {
        guard !sales.isEmpty else { return }
        let numberOFItems = sales.count
        let numberOfDays = sales[0].count
        for day in 0..<numberOfDays {
            var maxRevenue = Int.min
            var maxItemIndex = -1

            for item in 0..<numberOFItems {
                if sales[item][day] > maxRevenue {
                    maxRevenue = sales[item][day]
                    maxItemIndex = item
                }
            }
            print("Day \(day) Top Item \(maxItemIndex) Revenue \(maxRevenue)")
        }
    }
    func minStops(_ target: Int, _ startEnergy: Int, _ stations: [(Int, Int)]) -> Int {
        var maxHeap = [Int]()  // simple array, we’ll sort when needed
        var energy = startEnergy
        let prev = 0
        var stops = 0
        var i = 0
        let n = stations.count

        while prev < target {
            // Add all reachable stations
            while i < n && stations[i].0 <= prev + energy {
                maxHeap.append(stations[i].1)
                i += 1
            }
            // If we can reach target directly
            if prev + energy >= target {
                return stops
            }
            // No station to refuel → impossible
            if maxHeap.isEmpty {
                return -1
            }
            // Take max water
            maxHeap.sort(by: >)
            energy += maxHeap.removeFirst()
            stops += 1
        }
        return stops
    }
    func lightStateAfterDays(_ lights: [Int], _ days: Int) -> [Int] {
        var seen = [String: Int]()
        var current = lights
        var day = 0
        var remainingDays = days

        while remainingDays > 0 {
            let key = current.map { String($0) }.joined()

            if let prevDay = seen[key] {
                let cycleLength = day - prevDay
                remainingDays %= cycleLength
            }

            seen[key] = day

            if remainingDays > 0 {
                remainingDays -= 1
                day += 1

                var next = Array(repeating: 0, count: 8)

                for i in 1..<7 {
                    next[i] = (current[i-1] == current[i+1]) ? 0 : 1
                }

                current = next
            }
        }

        return current
    }
}


