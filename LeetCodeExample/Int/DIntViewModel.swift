//
//  DIntViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 15/09/25.
//

import Foundation

struct DIntViewModel {
    private let dInt: DInt
    
    init(dInt: DInt = .init()) {
        self.dInt = dInt
    }
    
    func reverseBits() {
        print(dInt.i1_e190_reverseBits(43261596))
        // Input:  00000010100101000001111010011100
        // Output: 964176192 (00111001011110000010100101000000)
        
        print(dInt.i1_e190_reverseBits(4294967293))
        // Input:  11111111111111111111111111111101
        // Output: 3221225471 (10111111111111111111111111111111)
    }
    func isHappy() {
        print(dInt.i2_e202_isHappy(19))   // true
        print(dInt.i2_e202_isHappy(2))    // false
    }
    func containsDuplicate(){
        print(dInt.i3_e217_containsDuplicate([1,2,3,1]))        // true
        print(dInt.i3_e217_containsDuplicate([1,2,3,4]))        // false
        print(dInt.i3_e217_containsDuplicate([1,1,1,3,3,4,3]))  // true
        print(dInt.i3_e217_containsDuplicate([]))               // false
        print(dInt.i3_e217_containsDuplicate([42]))             // false
    }
    func containsNearbyDuplicate() {
        print(dInt.i4_e219_containsNearbyDuplicate([1,2,3,1], 3))     // true
        print(dInt.i4_e219_containsNearbyDuplicate([1,0,1,1], 1))     // true
        print(dInt.i4_e219_containsNearbyDuplicate([1,2,3,1,2,3], 2)) // false
        print(dInt.i4_e219_containsNearbyDuplicate([99,99], 2))       // true
        print(dInt.i4_e219_containsNearbyDuplicate([], 1))            // false
    }
    
    func isPowerOfTwo() {
        print(dInt.i5_e231_isPowerOfTwo(1))    // true
        print(dInt.i5_e231_isPowerOfTwo(16))   // true
        print(dInt.i5_e231_isPowerOfTwo(3))    // false
        print(dInt.i5_e231_isPowerOfTwo(1024)) // true
        print(dInt.i5_e231_isPowerOfTwo(0))    // false
        print(dInt.i5_e231_isPowerOfTwo(-2))   // false
    }
    func addDigits() {
        print(dInt.i6_e258_addDigits(38))   // 2
        print(dInt.i6_e258_addDigits(0))    // 0
        print(dInt.i6_e258_addDigits(9))    // 9
        print(dInt.i6_e258_addDigits(123))  // 6
    }
    func isUgly() {
        
        print(dInt.i7_e263_isUgly(6))   // true
        print(dInt.i7_e263_isUgly(8))   // true
        print(dInt.i7_e263_isUgly(14))  // false
        print(dInt.i7_e263_isUgly(1))   // true
        print(dInt.i7_e263_isUgly(0))   // false
    }
    func missingNumber() {
        print(dInt.i8_e268_missingNumber([3,0,1]))            // 2
        print(dInt.i8_e268_missingNumber([0,1]))              // 2
        print(dInt.i8_e268_missingNumber([9,6,4,2,3,5,7,0,1])) // 8
        print(dInt.i8_e268_missingNumber([0]))                // 1
    }
    func isPowerOfThree() {
        print(dInt.i10_e326_isPowerOfThree(27))  // true (3^3)
        print(dInt.i10_e326_isPowerOfThree(9))   // true (3^2)
        print(dInt.i10_e326_isPowerOfThree(45))  // false
        print(dInt.i10_e326_isPowerOfThree(1))   // true (3^0)
        print(dInt.i10_e326_isPowerOfThree(0))   // false
    }
    func mySqrt() {
        print(dInt.i11_e69_mySqrt(4))   // 2
        print(dInt.i11_e69_mySqrt(8))   // 2
        print(dInt.i11_e69_mySqrt(25))  // 5
        print(dInt.i11_e69_mySqrt(1))   // 1
        print(dInt.i11_e69_mySqrt(0))   // 0
    }
    func isPerfectSquare() {
        print(dInt.i12_e367_isPerfectSquare(16))  // true
        print(dInt.i12_e367_isPerfectSquare(14))  // false
        print(dInt.i12_e367_isPerfectSquare(1))   // true
        print(dInt.i12_e367_isPerfectSquare(808201)) // true (899^2)
    }
    func largestNumber(){
        print(dInt.i14_179_largestNumber([10,2]))        // "210"
        print(dInt.i14_179_largestNumber([3,30,34,5,9])) // "9534330"
        print(dInt.i14_179_largestNumber([0,0]))         // "0"
    }
    func fizzBuzz(){
        print(dInt.i15_412_fizzBuzz(15))
    }
    func countSubstrings(){
        print(dInt.i16_647_countSubstrings("abc"))   // 3
        print(dInt.i16_647_countSubstrings("aaa"))   // 6
        print(dInt.i16_647_countSubstrings("a"))     // 1
        print(dInt.i16_647_countSubstrings("ababa")) // 9
    }
    func titleToNumber() {
        print(dInt.i17_e171_titleToNumber("AA"))    // 1
        print(dInt.i17_e171_titleToNumber("A"))    // 27
        print(dInt.i17_e171_titleToNumber("AB"))   // 28
        print(dInt.i17_e171_titleToNumber("ZY"))   // 701
        print(dInt.i17_e171_titleToNumber("ZZ"))   // 702
        print(dInt.i17_e171_titleToNumber("AAA"))  // 703
    }
    func summaryRanges() {
        print(
            dInt.i18_e228_summaryRanges([0,1,2,4,5,7])
        )    // ["0->2","4->5","7"]
        print(dInt.i18_e228_summaryRanges([0,2,3,4,6,8,9])) // ["0","2->4","6","8->9"]
        print(dInt.i18_e228_summaryRanges([]))              // []
        print(dInt.i18_e228_summaryRanges([-1]))            // ["-1"]
        print(dInt.i18_e228_summaryRanges([1,2,3,4,5]))     // ["1->5"]
    }
    func longestPalindrome() {
        print(dInt.i19_e409_longestPalindrome("abccccdd")) // 7
        print(dInt.i19_e409_longestPalindrome("a"))        // 1
        print(dInt.i19_e409_longestPalindrome("bb"))       // 2
        print(dInt.i19_e409_longestPalindrome("Aa"))       // 1
    }
    func thirdMax() {
        print(dInt.i22_e414_thirdMax([3,2,1]))       // 1
        print(dInt.i22_e414_thirdMax([1,2]))         // 2
        print(dInt.i22_e414_thirdMax([2,2,3,1]))     // 1
        print(dInt.i22_e414_thirdMax([5,2,2]))       // 5
    }
    func countSegments() {
        print(dInt.i23_e434_countSegments("Hello, my name is John"))  // 5
        print(dInt.i23_e434_countSegments("Hello"))                   // 1
        print(dInt.i23_e434_countSegments("     "))                   // 0
        print(dInt.i23_e434_countSegments("a b c"))                   // 3
        print(dInt.i23_e434_countSegments("  leading and trailing  "))// 3
    }
    func arrangeCoins() {
        print(dInt.i24_e441_arrangeCoins(5))   // 2
        print(dInt.i24_e441_arrangeCoins(8))   // 3
        print(dInt.i24_e441_arrangeCoins(1))   // 1
        print(dInt.i24_e441_arrangeCoins(0))   // 0
        print(dInt.i24_e441_arrangeCoins(10))  // 4
    }
    func findDisappearedNumbers() {
        print(dInt.i25_e448_([4,3,2,7,8,2,3,1])) // [5,6]
        print(dInt.i25_e448_([1,1]))             // [2]
        print(dInt.i25_e448_([2,2]))             // [1]
        print(dInt.i25_e448_([1,2,3,4,5]))       // []
    }
    func findContentChildren() {
        print(dInt.i26_e455_findContentChildren([1,2,3], [1,1]))   // 1
        print(dInt.i26_e455_findContentChildren([1,2], [1,2,3]))   // 2
        print(dInt.i26_e455_findContentChildren([2,3], [1]))       // 0
        print(dInt.i26_e455_findContentChildren([1,2,3], [3]))     // 1
        print(dInt.i26_e455_findContentChildren([], [1,2,3]))      // 0
    }
    func hammingDistance() {
        print(dInt.i27e461_hammingDistance(1, 4))   // 2
        print(dInt.i27e461_hammingDistance(3, 1))   // 1
        print(dInt.i27e461_hammingDistance(7, 10))  // 3
        print(dInt.i27e461_hammingDistance(0, 0))   // 0
        print(dInt.i27e461_hammingDistance(255, 0)) // 8
    }
    func findComplement() {
        print(dInt.i28e476_findComplement(5))   // 2
        print(dInt.i28e476_findComplement(1))   // 0
        print(dInt.i28e476_findComplement(7))   // 0
        print(dInt.i28e476_findComplement(8))   // 7
        print(dInt.i28e476_findComplement(10))  // 5
        print(dInt.i28e476_findComplement(0))   // 1
    }
    func licenseKeyFormatting() {
        print(dInt.i29e482_licenseKeyFormatting("5F3Z-2e-9-w", 4))  // "5F3Z-2E9W"
        print(dInt.i29e482_licenseKeyFormatting("2-5g-3-J", 2))     // "2-5G-3J"
        print(dInt.i29e482_licenseKeyFormatting("a", 1))            // "A"
        print(dInt.i29e482_licenseKeyFormatting("---", 3))          // ""
        print(dInt.i29e482_licenseKeyFormatting("abc-def", 3))      // "ABC-DEF"
    }
    func findMaxConsecutiveOnes() {
        print(dInt.i30e485_findMaxConsecutiveOnes([1,1,0,1,1,1]))  // 3
        print(dInt.i30e485_findMaxConsecutiveOnes([1,0,1,1,0,1]))  // 2
        print(dInt.i30e485_findMaxConsecutiveOnes([0,0,0]))        // 0
        print(dInt.i30e485_findMaxConsecutiveOnes([1,1,1,1]))      // 4
    }
    func findPoisonedDuration() {
        print(dInt.i31e495_findPoisonedDuration([1,4], 2))   // 4
        print(dInt.i31e495_findPoisonedDuration([1,2], 2))   // 3
        print(dInt.i31e495_findPoisonedDuration([1], 5))     // 5
        print(dInt.i31e495_findPoisonedDuration([], 3))      // 0
    }
    
}
