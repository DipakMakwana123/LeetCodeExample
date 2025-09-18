//
//  DevideConquer.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 10/09/25.
//

import Foundation

struct DevideConquer {
    func secondLargestNumber(numbers: [Int]) {
        var largest = Int.min
        var secondLargest = Int.min
        
        for num in numbers {
            if num > largest {
                secondLargest = largest
                largest = num
            } else if num > secondLargest && num < largest {
                secondLargest = num
            }
        }
        
        if secondLargest != Int.min {
            print("Second largest number: \(secondLargest)")
        } else {
            print("No second largest (array may have duplicates or insufficient elements)")
        }
        
    }
    
    func secondLargestNumber1(numbers: [Int]) {
        let uniqueNumbers = Set(numbers)     // remove duplicates
        if uniqueNumbers.count >= 2 {
            let sortedUnique = uniqueNumbers.sorted(by: >) // descending
            let secondLargest = sortedUnique[1]
            print("Second largest number: \(secondLargest)")
        } else {
            print("No second largest number")
        }
    }
    
    func reverseNumber(number: Int ) {
        var num = number
        var reversed = 0
        
        while num > 0 {
            let digit = num % 10
            reversed = reversed * 10 + digit
            num /= 10
        }
        
        print("Reversed number: \(reversed)")
    }
    
    func makeArrayIdentical(_ arr1: [Int], _ arr2: [Int]) -> Int {
        
        var diff = -1
       // var indexArr = [Int]()
        var isMatched: Int = 0
        
        for i in 0..<arr1.count {
            diff = arr1[i] - arr2[0]
            let transferedArray = arr2.map { $0 + diff }
            for j in 0..<arr1.count {
                if transferedArray.contains(arr1[j]) {
                    isMatched += 1
                }
//                else {
//                    indexArr.append(j)
//                }
            }
            if isMatched == transferedArray.count {
                return diff
            }
            
        }
        return -1
    }

    func makeArrayIdentical1(_ arr1: [Int], _ arr2: [Int]) -> Int {
        
        let n = arr1.count
        let m = arr2.count
        // if m > n { return 1 } // can't transform if arr2 is longer
        
        // Try all possible subsequences of length m
        for start in 0...(n - m) {
            let candidate = Array(arr1[start..<start + m])
            
            // Compute required offset
            let diff = arr2[0] - candidate[0]
            
            // Apply offset to candidate
            let transformed = candidate.map { $0 + diff }
            
            if transformed == arr2 {
                print("Remove indices before: \(Array(0..<start)) and after: \(Array(start+m..<n))")
                print("Apply offset: \(diff)")
                return 1
            }
        }
        return 1
        
        
    }
    
    
}
