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
    private var linkedListVM: LinkedListViewModel
    private var stackVM: StackViewModel
    private var treeVM: TreeViewModel?
    
    @Published var data: [LeetCodeModel]
    
    init(
         _ linkList: LinkList = .init(),
         _ slidingWindowVM: SlidingWindowViewModel = .init(),
         _ stringViewModel: StringViewModel = .init(),
         _ arrayVM: DArrayViewModel = .init(),
         _ linkedListVM: LinkedListViewModel = .init(),
         _ stackVM: StackViewModel = .init(),
         _ treeVM: TreeViewModel = .init()) {
        self.slidingWindowVM = slidingWindowVM
        self.stringVM = stringViewModel
        self.arrayVM = arrayVM
        self.linkedListVM = linkedListVM
        self.stackVM = stackVM
        
        data = [
            LeetCodeModel(title: "Two number sum from array"),
            LeetCodeModel(title: "Bracket Validation String"),
        ]
    }
    func findMaxDepth() {
        treeVM?.findMaxDepth()
    }
    // MARK: - String
    func findSubstring() {
        stringVM.findSubstring()
    }
    func validParenthese() {
        stringVM.validParenthese()
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
    // MARK: - Array
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
    // MARK: - Linked List
    func findMedian() {
        linkedListVM.findMedian()
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
    // MARK: Linked List
    func mergeKLists() {
        linkedListVM.mergeKLists()
    }
    func maxSlidingWindow() {
        slidingWindowVM.maxSlidingWindow()
    }
    func lengthOfLongestSubstring() {
        stringVM.lengthOfLongestSubstring()
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
    // MARK: Sliding Window
    func minWindow() {
        slidingWindowVM.minWindow()
    }
    // MARK: Stack 
    func minStack() {
        stackVM.minStack()
    }
    
    deinit {
        debugPrint("LeetCodeViewModel deinit")
    }
}
