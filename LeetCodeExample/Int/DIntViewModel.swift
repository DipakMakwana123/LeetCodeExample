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
        print(dInt.i14_m179_largestNumber([10,2]))        // "210"
        print(dInt.i14_m179_largestNumber([3,30,34,5,9])) // "9534330"
        print(dInt.i14_m179_largestNumber([0,0]))         // "0"
    }
    func fizzBuzz(){
        print(dInt.i15_412_fizzBuzz(15))
    }
    func countSubstrings(){
        print(dInt.i16_m647_countSubstrings("abc"))   // 3
        print(dInt.i16_m647_countSubstrings("aaa"))   // 6
        print(dInt.i16_m647_countSubstrings("a"))     // 1
        print(dInt.i16_m647_countSubstrings("ababa")) // 9
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
        
        print(dInt.i19_e409_longestPalindrome("babad")) // "bab" or "aba"
        print(dInt.i19_e409_longestPalindrome("cbbd"))  // "bb"
        print(dInt.i19_e409_longestPalindrome("a"))     // "a"
        print(dInt.i19_e409_longestPalindrome("ac"))    // "a" or "c"
        
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
        print(dInt.i29_e482_licenseKeyFormatting("5F3Z-2e-9-w", 4))  // "5F3Z-2E9W"
        print(dInt.i29_e482_licenseKeyFormatting("2-5g-3-J", 2))     // "2-5G-3J"
        print(dInt.i29_e482_licenseKeyFormatting("a", 1))            // "A"
        print(dInt.i29_e482_licenseKeyFormatting("---", 3))          // ""
        print(dInt.i29_e482_licenseKeyFormatting("abc-def", 3))      // "ABC-DEF"
    }
    func findMaxConsecutiveOnes() {
        print(dInt.i30_e485_findMaxConsecutiveOnes([1,1,0,1,1,1]))  // 3
        print(dInt.i30_e485_findMaxConsecutiveOnes([1,0,1,1,0,1]))  // 2
        print(dInt.i30_e485_findMaxConsecutiveOnes([0,0,0]))        // 0
        print(dInt.i30_e485_findMaxConsecutiveOnes([1,1,1,1]))      // 4
    }
    func findPoisonedDuration() {
        print(dInt.i31_e495_findPoisonedDuration([1,4], 2))   // 4
        print(dInt.i31_e495_findPoisonedDuration([1,2], 2))   // 3
        print(dInt.i31_e495_findPoisonedDuration([1], 5))     // 5
        print(dInt.i31_e495_findPoisonedDuration([], 3))      // 0
    }
    func reverse() {
        print(dInt.i32_m7_reverse(123))        // 321
        print(dInt.i32_m7_reverse(-123))       // -321
        print(dInt.i32_m7_reverse(120))        // 21
        print(dInt.i32_m7_reverse(1534236469)) // 0 (overflow)
    }
    func intToRoman() {
        print(dInt.i33_mM12_intToRoman(3))     // "III"
        print(dInt.i33_mM12_intToRoman(4))     // "IV"
        print(dInt.i33_mM12_intToRoman(9))     // "IX"
        print(dInt.i33_mM12_intToRoman(58))    // "LVIII" (50 + 5 + 3)
        print(dInt.i33_mM12_intToRoman(1994))  // "MCMXCIV" (1000 + 900 + 90 + 4)
    }
    func divide() {
        print(dInt.i34_m29_divide(10, 3))     // 3
        print(dInt.i34_m29_divide(7, -3))     // -2
        print(dInt.i34_m29_divide(-2147483648, -1)) // 2147483647 (clamped)
        print(dInt.i34_m29_divide(1, 1))      // 1
        print(dInt.i34_m29_divide(-15, 2))    // -7
    }
    func countAndSay() {
        print(dInt.i35_m38_countAndSay(1)) // "1"
        print(dInt.i35_m38_countAndSay(2)) // "11"
        print(dInt.i35_m38_countAndSay(3)) // "21"
        print(dInt.i35_m38_countAndSay(4)) // "1211"
        print(dInt.i35_m38_countAndSay(5)) // "111221"
    }
    func jump(){
        print(dInt.i36_m45_jump([2,3,1,1,4]))   // 2
        print(dInt.i36_m45_jump([2,3,0,1,4]))   // 2
        print(dInt.i36_m45_jump([1,2,3]))       // 2
        print(dInt.i36_m45_jump([0]))           // 0
        print(dInt.i36_m45_jump([1,1,1,1]))     // 3
    }
    func permute() {
        print(dInt.i37_m46_permute([1,2,3]))
        // [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
        print(dInt.i37_m46_permute([0,1]))
        // [[0,1],[1,0]]
        print(dInt.i37_m46_permute([1]))
        // [[1]]
    }
    func permuteUnique() {
        print(dInt.i38_m47_permuteUnique([1,1,2]))
        // [[1,1,2],[1,2,1],[2,1,1]]

        print(dInt.i38_m47_permuteUnique([1,2,3]))
        // [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

        print(dInt.i38_m47_permuteUnique([2,2,1,1]))
        // [[1,1,2,2],[1,2,1,2],[1,2,2,1],
        //  [2,1,1,2],[2,1,2,1],[2,2,1,1]]
    }
    func rotate() {
        var arr = [[1,2,3],[4,5,6],[7,8,9]]
        print(dInt.i38_m48_rotate(&arr))
        
        arr = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
        print(dInt.i38_m48_rotate(&arr))
        /*
         Input: matrix =
         Output: [[7,4,1],[8,5,2],[9,6,3]]

         */
    }
    func maxSubArray(){
        print(dInt.i39_m58_m53_maxSubArray([-2,1,-3,4,-1,2,1,-5,4])) // 6  (subarray [4,-1,2,1])
        print(dInt.i39_m58_m53_maxSubArray([1]))                     // 1
        print(dInt.i39_m58_m53_maxSubArray([5,4,-1,7,8]))            // 23
    }
    func spiralOrder(){
        print(dInt.i40_m54_spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
        // Output: [1,2,3,6,9,8,7,4,5]
        print(dInt.i40_m54_spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))
        // Output: [1,2,3,4,8,12,11,10,9,5,6,7]
    }
    func canJump() {
        print(dInt.i41_m55_canJump([2,3,1,1,4])) // true
        print(dInt.i41_m55_canJump([3,2,1,0,4])) // false
        print(dInt.i41_m55_canJump([0]))         // true (already at last index)
    }
    func mergeIntervals() {
        print(dInt.i42_m56_merge([[1,3],[2,6],[8,10],[15,18]]))
        // [[1,6],[8,10],[15,18]]

        print(dInt.i42_m56_merge([[1,4],[4,5]]))
        // [[1,5]]

        print(dInt.i42_m56_merge([[1,10],[2,3],[4,5],[6,7],[8,9]]))
        // [[1,10]]
    }
    func generateMatrix() {
        print(dInt.i43_m59_generateMatrix(3))
        // [
        //  [1, 2, 3],
        //  [8, 9, 4],
        //  [7, 6, 5]
        // ]

        print(dInt.i43_m59_generateMatrix(4))
        // [
        //  [1, 2, 3, 4],
        //  [12, 13, 14, 5],
        //  [11, 16, 15, 6],
        //  [10, 9, 8, 7]
        // ]
    }
    func uniquePaths() {
        print(dInt.i44_m62_uniquePaths(3, 7)) // 28
        print(dInt.i44_m62_uniquePaths(3, 2)) // 3
        print(dInt.i44_m62_uniquePaths(7, 3)) // 28
        print(dInt.i44_m62_uniquePaths(3, 3)) // 6
    }
    func uniquePathsWithObstacles() {
        

        print(dInt.i45_m63_uniquePathsWithObstacles([
            [0,0,0],
            [0,1,0],
            [0,0,0]
        ])) // 2

        print(dInt.i45_m63_uniquePathsWithObstacles([
            [0,1],
            [0,0]
        ])) // 1

        print(dInt.i45_m63_uniquePathsWithObstacles([
            [1,0]
        ])) // 0 (start is blocked)

        print(dInt.i45_m63_uniquePathsWithObstacles([
            [0,0],
            [1,1],
            [0,0]
        ])) // 0 (path blocked)
    }
    func minPathSum(){
        let grid = [
          [1,3,1],
          [1,5,1],
          [4,2,1]
        ]
        print(dInt.i46_m64_minPathSum(grid))// Output: 7
    }
    func search() {
        let nums = [2,5,6,0,0,1,2], target = 0
        print(dInt.i47_m81_search(nums, target))

        let nums2 = [2,5,6,0,0,1,2], target2 = 3
        print(dInt.i47_m81_search(nums2, target2))
    }
    func findPeakElement() {
        print(dInt.i48_m162_findPeakElement([1,2,3,1]))   //# -> 2 (value 3)
        print(dInt.i48_m162_findPeakElement([1,2]))       //# -> 1 (value 2)
        print(dInt.i48_m162_findPeakElement([3,2,1]))    // # -> 0 (value 3)
    }
    func maximumGap() {
        print(dInt.i49_m164_maximumGap([3,6,9,1]))
        print(dInt.i49_m164_maximumGap([10]))
    }
    func compareVersion() {
        var version1 = "1.0.1", version2 = "1" // Output: 1
        print(dInt.i50_m165_compareVersion(version1, version2))
        version1 = "1.01"
        version2 = "1.001" // Output: 0
        print(dInt.i50_m165_compareVersion(version1, version2))
        version1 = "1.0"
        version2 = "1.0.0" // Output: 0
        print(dInt.i50_m165_compareVersion(version1, version2))
    }
    func canCompleteCircuit() {
        let gas = [1,2,3,4,5]
        let cost = [3,4,5,1,2]
        print(dInt.i51_m134_canCompleteCircuit(gas, cost))// Output: 3    Start at station 3 → 4 + 5 + 1 + 2 + 3 (circle complete)
    }
    func singleNumber() {
        print(dInt.i52_m137_singleNumber([2, 2, 3, 2]))       // 3
        print(dInt.i52_m137_singleNumber([0, 1, 0, 1, 0, 1, 99])) // 99
        print(dInt.i52_m137_singleNumber([-2, -2, 1, -2]))    // 1
    }
    func minimumTotal() {
    let
    triangle = [
         [2],
        [3,4],
       [6,5,7],
      [4,1,8,3]
    ]
    print(dInt.i53_m120_minimumTotal(triangle))//Output: 11      //Explanation: 2 + 3 + 5 + 1 = 11
    }
    func fractionToDecimal() {
        var numerator = 1
        var denominator = 2
        print(dInt.i54_m166_fractionToDecimal(numerator, denominator))// Output: "0.5"
        numerator = 2
        denominator = 1
        print(dInt.i54_m166_fractionToDecimal(numerator, denominator)) //Output: "2"

        numerator = 2
        denominator = 3
        print(dInt.i54_m166_fractionToDecimal(numerator, denominator)) // Output: "0.(6)"

        numerator = 4
        denominator = 333
        print(dInt.i54_m166_fractionToDecimal(numerator, denominator)) //Output: "0.(012)"
    }
    func trailingZeroes() {
        print(dInt.i55_m172_trailingZeroes(5)) //Output: 1   //Explanation: 5! = 120 → 1 trailing zero
        print(dInt.i55_m172_trailingZeroes(3)) //Output: 1   //Explanation: 5! = 120 → 1 trailing zero
    }
    func findRepeatedDnaSequences() {
        print(dInt.i56_m187_findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT")) //    Output: ["AAAAACCCCC", "CCCCCAAAAA"]
        print(dInt.i56_m187_findRepeatedDnaSequences("AAAAAAAAAAAAA")) //    Output: ["AAAAACCCCC", "CCCCCAAAAA"]
    }
    func rotateArray(){
        var arr = [1,2,3,4,5,6,7]
        print(dInt.i57_m189_rotate(&arr, 3))
    /*    Output: [5,6,7,1,2,3,4]
        Explanation:
        Rotate 1 step → [7,1,2,3,4,5,6]
        Rotate 2 step → [6,7,1,2,3,4,5]
        Rotate 3 step → [5,6,7,1,2,3,4]*/
    }
    func numIslands() {

    }
    func countPrimes() {
        print(dInt.i59_m204_countPrimes(10))  // Output: 4  (2, 3, 5, 7)
        print(dInt.i59_m204_countPrimes(0))   // Output: 0
        print(dInt.i59_m204_countPrimes(1))   // Output: 0
        print(dInt.i59_m204_countPrimes(20))  // Output: 8  (2, 3, 5, 7, 11, 13, 17, 19)
    }
    func minSubArrayLen() {
        print(dInt.i61_m209_minSubArrayLen(7, [2,3,1,2,4,3]))   // ✅ 2  → [4,3]
        print(dInt.i61_m209_minSubArrayLen(4, [1,4,4]))         // ✅ 1  → [4]
        print(dInt.i61_m209_minSubArrayLen(11, [1,1,1,1,1,1,1])) // ✅ 0  → no subarray
    }
    func findOrder(){
        print(dInt.i62_m210_findOrder(2, [[1,0]]))                  // ✅ [0,1]
        print(dInt.i62_m210_findOrder(4, [[1,0],[2,0],[3,1],[3,2]])) // ✅ [0,1,2,3] or [0,2,1,3]
        print(dInt.i62_m210_findOrder(2, [[1,0],[0,1]]))            // ❌ []
    }
}
