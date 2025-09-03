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
         _ dpVM: DPViewModel = .init()) {
        self.slidingWindowVM = slidingWindowVM
        self.stringVM = stringViewModel
        self.arrayVM = arrayVM
        self.linkListVM = linkedListVM
        self.stackVM = stackVM
        self.heapVM = heapVM
        self.dpVM = dpVM
        data = [
            LeetCodeModel(title: "Two number sum from array"),
            LeetCodeModel(title: "Bracket Validation String"),
        ]
    }
    func findMaxDepth() {
        treeVM?.findMaxDepth()
    }
    // MARK: - ========================================== String ==========================================
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
    func largestNumber(){
        stringVM.largestNumber()
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
        stringVM.fizzBuzz()
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
    func longestPalindrome() {
        stringVM.longestPalindrome()
    }
    func countSubstrings(){
        stringVM.countSubstrings()
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
    // MARK: - ========================================== Array ==========================================
    func solveSudoku() {
        arrayVM.solveSudoku()
    }
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
    func maxSubArray(){
        arrayVM.maxSubArray()
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
    // MARK:  ========================================== deinit ===================================================
    deinit {
        debugPrint("LeetCodeViewModel deinit")
    }
}
