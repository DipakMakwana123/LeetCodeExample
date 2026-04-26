//
//  LeetCodeViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 05/07/25.
//

import Foundation
class LeetCodeViewModel: ObservableObject {

    private var slidingWindowVM: SlidingWindowViewModel
    private var stringVM: StringViewModel
    private var arrayVM: DArrayViewModel
    private var linkListVM: LinkedListViewModel
    private var stackVM: StackViewModel
    private var treeVM: TreeViewModel?
    private var heapVM: HeapViewModel?
    private var searchVM: SearchViewModel?
    private var dpVM: DPViewModel?
    private var devideConquerVM: DevideConquerViewModel?
    private var dIntVM: DIntViewModel?
    private var dDoubleVM: DDoubleViewModel?
    private var wipViewModel: WiproViewModel?
    @Published var data: [LeetCodeModel]
    
    init(
         _ linkList: LinkList = .init(),
         _ slidingWindowVM: SlidingWindowViewModel = .init(),
         _ stringViewModel: StringViewModel = .init(),
         _ arrayVM: DArrayViewModel = .init(),
         _ linkedListVM: LinkedListViewModel = .init(),
         _ stackVM: StackViewModel = .init(),
         _ treeVM: TreeViewModel = .init(),
         _ heapVM: HeapViewModel = .init(),
         _ searchVM: SearchViewModel = .init(),
         _ dpVM: DPViewModel = .init(),
         _ devideConquerVM: DevideConquerViewModel = .init(),
         _ dIntVM: DIntViewModel = .init(),
    _ dDoubleVM: DDoubleViewModel = .init(),
         _ wipViewModel: WiproViewModel = .init()) {
        self.slidingWindowVM = slidingWindowVM
        self.stringVM = stringViewModel
        self.arrayVM = arrayVM
        self.linkListVM = linkedListVM
        self.stackVM = stackVM
        self.heapVM = heapVM
        self.dpVM = dpVM
        self.dIntVM = dIntVM
        self.devideConquerVM = devideConquerVM
        self.dDoubleVM = dDoubleVM
        self.searchVM = searchVM
        self.wipViewModel = wipViewModel
        data = [
            LeetCodeModel(title: "Two number sum from array"),
            LeetCodeModel(title: "Bracket Validation String"),
        ]
    }
    // MARK: - ========================================== Tree ==========================================
    func findMaxDepth() {
        treeVM?.findMaxDepth()
    }
    // MARK: - ========================================== Double ==========================================
    func myPow() {
        dDoubleVM?.myPow()
    }
    
    // MARK: - ========================================== Int ==========================================
    func reverseBits() {
        dIntVM?.reverseBits()
    }
    func isHappy() {
        dIntVM?.isHappy()
    }
    func containsDuplicate(){
        dIntVM?.containsDuplicate()
    }
    func containsNearbyDuplicate() {
        dIntVM?.containsNearbyDuplicate()
    }
    func isPowerOfTwo() {
        dIntVM?.isPowerOfTwo()
    }
    func addDigits() {
        dIntVM?.addDigits()
    }
    func isUgly() {
        dIntVM?.isUgly()
    }
    func missingNumber() {
        dIntVM?.missingNumber()
    }
    func isPowerOfThree() {
        dIntVM?.isPowerOfThree()
    }
    func mySqrt() {
        dIntVM?.mySqrt()
    }
    func isPerfectSquare() {
        dIntVM?.isPerfectSquare()
    }
    func countSubstrings(){
        dIntVM?.countSubstrings()
    }
    func titleToNumber() {
        dIntVM?.titleToNumber()
    }
    func summaryRanges() {
        dIntVM?.summaryRanges()
    }
    func longestPalindrome() {
        dIntVM?.longestPalindrome()
    }
    func thirdMax() {
        dIntVM?.thirdMax()
    }
    func countSegments() {
        dIntVM?.countSegments()
    }
    func arrangeCoins() {
        dIntVM?.arrangeCoins()
    }
    func findDisappearedNumbers() {
        dIntVM?.findDisappearedNumbers()
    }
    func findContentChildren() {
        dIntVM?.findContentChildren()
    }
    func hammingDistance() {
        dIntVM?.hammingDistance()
    }
    func findComplement(){
        dIntVM?.findComplement()
    }
    func licenseKeyFormatting() {
        dIntVM?.licenseKeyFormatting()
    }
    func findMaxConsecutiveOnes() {
        dIntVM?.findMaxConsecutiveOnes()
    }
    func findPoisonedDuration() {
        dIntVM?.findPoisonedDuration()
    }
    func reverse() {
        dIntVM?.reverse()
    }
    func intToRoman() {
        dIntVM?.intToRoman()
    }
    func divide() {
        dIntVM?.divide()
    }
    func countAndSay() {
        dIntVM?.countAndSay()
    }
    func jump(){
        dIntVM?.jump()
    }
    func permute() {
        dIntVM?.permute()
    }
    func permuteUnique() {
        dIntVM?.permuteUnique()
    }
    func rotate() {
        dIntVM?.rotate()
    }
    func maxSubArray(){
        dIntVM?.maxSubArray()
    }
    func spiralOrder(){
        dIntVM?.spiralOrder()
    }
    func canJump() {
        dIntVM?.canJump()
    }
    func mergeIntervals() {
        dIntVM?.mergeIntervals()
    }
    func generateMatrix() {
        dIntVM?.generateMatrix()
    }
    func minPathSumuniquePaths() {
        dIntVM?.uniquePaths()
    }
    func uniquePathsWithObstacles() {
        dIntVM?.uniquePathsWithObstacles()
    }
    func fractionToDecimal() {
        dIntVM?.fractionToDecimal()
    }
    func numIslands() {
        dIntVM?.numIslands()
    }
    func countPrimes() {
        dIntVM?.countPrimes()
    }
    func trailingZeroes() {
        dIntVM?.trailingZeroes()
    }
    func rotateArray(){
        dIntVM?.rotateArray()
    }
    func findRepeatedDnaSequences() {
        dIntVM?.findRepeatedDnaSequences()
    }
    func minPathSum(){
        dIntVM?.minPathSum()
    }
//    func search() {
//        dIntVM?.search()
//    }
    func findPeakElement() {
        dIntVM?.findPeakElement()
    }
    func maximumGap() {
        dIntVM?.maximumGap()
    }
    func compareVersion() {
        dIntVM?.compareVersion()
    }
    func canCompleteCircuit() {
        dIntVM?.canCompleteCircuit()
    }
    func singleNumber() {
        dIntVM?.singleNumber()
    }
    func minimumTotal() {
        dIntVM?.minimumTotal()
    }
    func minSubArrayLen() {
        dIntVM?.minSubArrayLen()
    }
    func findOrder(){
        dIntVM?.findOrder()
    }
    // MARK: - ========================================== String ==========================================
    func isInterleave(){
        stringVM.isInterleave()
    }
    func restoreIpAddresses() {
        stringVM.restoreIpAddresses()
    }
    func exist() {
        stringVM.exist()
    }
    func minDistance() {
        stringVM.minDistance()
    }
    func simplifyPath() {
        stringVM.simplifyPath()
    }
    func multiply() {
        stringVM.multiply()
    }
    func generateParenthesis(){
        stringVM.generateParenthesis()
    }
    func findWords() {
        stringVM.findWords()
    }
    func repeatedSubstringPattern(){
        stringVM.repeatedSubstringPattern()
    }
    func addStrings() {
        stringVM.addStrings()
    }
    func isSubsequence() {
        stringVM.isSubsequence()
    }
    func findTheDifference() {
        stringVM.findTheDifference()
    }
    func canConstruct() {
        stringVM.canConstruct()
    }
    func reverseVowels() {
        stringVM.reverseVowels()
    }
    func reverseString() {
        stringVM.reverseString()
    }
    func wordPattern() {
        stringVM.wordPattern()
    }
   
    func findSubstring() {
        stringVM.findSubstring()
    }
    func isValidAfter180DegreeRotation() {
        stringVM.isValidAfter180DegreeRotation()
    }
    func isAnagramFrequencyMap() {
        stringVM.isAnagramFrequencyMap()
    }
    func checkBracketStringValidation() {
        stringVM.checkBracketStringValidation()
    }
    func decodeString(){
        stringVM.decodeString()
    }
    func largestNumber(){
        dIntVM?.largestNumber()
    }
    func isMatch() {
        stringVM.isMatch()
    }
    func groupAnagrams() {
        stringVM.groupAnagrams()
    }
    func encodeDecode() {
        stringVM.encodeDecode()
    }
    func lengthOfLongestSubstring() {
        stringVM.lengthOfLongestSubstring()
    }
    func longestCommonPrefix() {
        stringVM.longestCommonPrefix()
    }
    func fizzBuzz(){
        dIntVM?.fizzBuzz()
    }
    func characterReplacement() {
        stringVM.characterReplacement()
    }
    func lengthOfLongestSubstring2(){
        stringVM.lengthOfLongestSubstring2()
    }
    func minWindow2() {
        stringVM.minWindow()
    }
    func isAnagram2(){
        stringVM.isAnagram()
    }
    func groupAnagrams2() {
        stringVM.groupAnagrams()
    }
    func isPalindrome2() {
        stringVM.isPalindrome2()
    }
    func longestPalindromeString() {
        stringVM.longestPalindrome()
    }
    func isPalindrome() {
        stringVM.isPalindrome()
    }
    func letterCombinations() {
        stringVM.letterCombinations()
    }
    func fullJustify() {
        stringVM.fullJustify()
    }
    func addBinary() {
        stringVM.addBinary()
    }
    func solveSudoku() {
        stringVM.solveSudoku()
    }
    func convert() {
        stringVM.convert()
    }

    // MARK: - ========================================== Array ==========================================
    
    func sortColors() {
        arrayVM.sortColors()
    }
    func longestConsecutive(){
        arrayVM.longestConsecutive()
    }
    func productOfArrayExceptSelf() {
        arrayVM.productOfArrayExceptSelf()
    }
    func dailyTemperatures() {
        arrayVM.dailyTemperatures()
    }
    func merge() {
        arrayVM.merge()
    }
    func majorityElement(){
        arrayVM.majorityElement()
    }
    func maxArea() {
        arrayVM.maxArea()
    }
    func maxProfit() {
        arrayVM.maxProfit()
    }
    func findMinFuelStationToReachDestination() {
        arrayVM.findMinFuelStationToReachDestination()
    }
    func setBricks() {
        arrayVM.setBricks()
    }
    func twoSum() {
        arrayVM.twoSum()
    }
    func getSumOfTwoNumber() {
        arrayVM.getSumOfTwoNumber()
    }
    func firstMissingPositive() {
        arrayVM.firstMissingPositive()
    }
   
    func maxProduct(){
        arrayVM.maxProduct()
    }
    func findMin(){
        arrayVM.findMin()
    }
    func isValidSudoku(){
        arrayVM.isValidSudoku()
    }
    func totalFruit() {
        arrayVM.totalFruit()
    }
    func A16_search(){
        arrayVM.A16_search()
    }
    func A17_twoSum(){
        arrayVM.A17_twoSum()
    }
    func threeSum() {
        arrayVM.threeSum()
    }
    func isAlienSorted() {
        arrayVM.isAlienSorted()
    }
    func nextPermutation() {
        arrayVM.nextPermutation()
    }
    func removeDuplicate() {
        arrayVM.removeDuplicate()
    }
    func searchRange(){
        arrayVM.searchRange()
    }
    func trap(){
        arrayVM.trap()
    }
    func findMedianSortedArrays(){
        arrayVM.findMedianSortedArrays()
    }
    func isAnagram(){
        arrayVM.isAnagram()
    }
    func topKFrequent(){
        arrayVM.topKFrequent()
    }
    func romanToInt() {
        arrayVM.romanToInt()
    }
    func removeDuplicates() {
        arrayVM.removeDuplicates()
    }
    func findFirstIndexFromSting () {
        arrayVM.findFirstIndexFromSting()
    }
    func searchInsert() {
        arrayVM.searchInsert()
    }
    func lengthOfLastWord() {
        arrayVM.lengthOfLastWord()
    }
    func plusOne() {
        arrayVM.plusOne()
    }
    func intersection() {
        arrayVM.intersection()
    }
    func intersect() {
        arrayVM.intersect()
    }
    // MARK: - ========================================== Linked List ==========================================
    func findMedian() {
        linkListVM.findMedian()
    }
    func addTwoNumbers() {
        linkListVM.addTwoNumbers()
    }
    func mergeKLists() {
        linkListVM.mergeKLists()
    }
    func hasCycle(){
        linkListVM.hasCycle()
    }
    func mergeTwoLists() {
        linkListVM.mergeTwoLists()
    }
    func removeNthFromEnd() {
        linkListVM.removeNthFromEnd()
    }
    func reorderList() {
        linkListVM.reorderList()
    }
    func middleNode(){
     linkListVM.middleNode()
    }
    func flatten() {
        linkListVM.flatten()
    }
    func reverseKGroup() {
        linkListVM.reverseKGroup()
    }
    func copyRandomList(){
        linkListVM.copyRandomList()
    }
    func findDuplicate(){
        linkListVM.findDuplicate()
    }
    func sortList() {
        linkListVM.sortList()
    }
    func deleteDuplicates() {
        linkListVM.deleteDuplicates()
    }
    
    // MARK: ========================================== Sliding Window ==========================================
    func minWindow() {
        slidingWindowVM.minWindow()
    }
    func maxSlidingWindow() {
        slidingWindowVM.maxSlidingWindow()
    }
    // MARK:  ========================================== Stack ===================================================
    func validParenthese() {
        stackVM.validParenthese()
    }
    func minStack() {
        stackVM.minStackOperation()
    }
    func evalRPN() {
        stackVM.evalRPN()
    }
    func lruCache() {
        stackVM.lruCache()
    }
    func carFleet() {
        stackVM.carFleet()
    }
    func minRemoveToMakeValid() {
        stackVM.minRemoveToMakeValid()
    }
    func largestRectangleArea() {
        stackVM.largestRectangleArea()
    }
    func longestValidParentheses() {
        stackVM.longestValidParentheses()
    }
    func maxStack() {
        stackVM.S7_716_MaxStack()
    }
    // MARK:  ========================================== Heap ===================================================
    func minHeapOperation() {
        heapVM?.minHeapOperation()
    }
    func lastStoneWeight() {
        heapVM?.lastStoneWeight()
    }
    func findKthLargest() {
        heapVM?.findKthLargest()
    }
    func kClosest() {
        heapVM?.kClosest()
    }
    func leastInterval(){
        heapVM?.leastInterval()
    }
    func highFive() {
        heapVM?.highFive()
    }
    func employeeFreeTime(){
        heapVM?.employeeFreeTime()
    }
    func findMedianUsingQ() {
        heapVM?.findMedian()
    }
    // MARK:  ========================================== Search ===================================================
    func search() {
        searchVM?.search()
    }
    func searchMatrix() {
        searchVM?.searchMatrix()
    }
    func minEatingSpeed() {
        searchVM?.minEatingSpeed()
    }
    // MARK:  ========================================== Dyamic Programing ===================================================
    func rob() {
        dpVM?.rob()
    }
    func climbStairs() {
        dpVM?.climbStairs()
    }
    func minCostClimbingStairs() {
        dpVM?.minCostClimbingStairs()
    }
    func coinChange() {
        dpVM?.coinChange()
    }
    func generate() {
        dpVM?.generate()
    }
    func wordBreak() {
        dpVM?.wordBreak()
    }
    func combinationSum() {
        dpVM?.combinationSum()
    }
    func rob2() {
        dpVM?.rob2()
    }
    // MARK:  ========================================== Devide & Conqure ===================================================
    func secondLargestNumber() {
        devideConquerVM?.secondLargestNumber()
    }
    func reverseNumber() {
        devideConquerVM?.reverseNumber()
    }
    func makeArrayIdentical() {
        devideConquerVM?.makeArrayIdentical()
    }
    // MARK:  ========================================== Wipro ===================================================

    func minBitsFlips() {
        wipViewModel?.minBitsFlips()
    }
    func topPerformingItems() {
        wipViewModel?.topPerformingItems()
    }
    func minStops() {
        wipViewModel?.minStops()
    }
    func lightStateAfterDays() {
        wipViewModel?.lightStateAfterDays()
    }
    func countParticipants() {
        wipViewModel?.countParticipants()
    }

     // MARK:  ========================================== deinit ===================================================
    deinit {
        debugPrint("LeetCodeViewModel deinit")
    }
}
