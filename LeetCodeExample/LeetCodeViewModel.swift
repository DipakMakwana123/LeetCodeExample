//
//  LeetCodeViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 05/07/25.
//

import Foundation




class LeetCodeViewModel: ObservableObject {
    
    private var leetCode: LeetCode
    private var linkList: LinkList
    private var slidingWindowVM: SlidingWindowViewModel
    private var stringVM: StringViewModel
    private var arrayVM: DArrayViewModel
    private var linkedListVM: LinkedListViewModel
    private var stackVM: StackViewModel
    
    @Published var data: [LeetCodeModel]
    
    init(leetCode: LeetCode = LeetCode() ,
         _ linkList: LinkList = .init(),
         _ slidingWindowVM: SlidingWindowViewModel = .init(),
         _ stringViewModel: StringViewModel = .init(),
         _ arrayVM: DArrayViewModel = .init(),
         _ linkedListVM: LinkedListViewModel = .init(),
         _ stackVM: StackViewModel = .init()) {
        self.slidingWindowVM = slidingWindowVM
        self.leetCode = leetCode
        self.linkList = linkList
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
        leetCode.findMaxDepth(array: [3, 9, 20, nil, nil, 15, 7])
    }
    // MARK: - String
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
    func isMatch() {
        stringVM.isMatch()
    }
    // MARK: - Array
    func productOfArrayExceptSelf() {
        arrayVM.productOfArrayExceptSelf()
    }
    func dailyTemperatures() {
        arrayVM.dailyTemperatures()
    }
    func merge() {
        arrayVM.merge()
    }
    func findMedian() {
        linkedListVM.findMedian()
    }
    func trapingRainWater() {
        arrayVM.trapingRainWater()
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
    // MARK: Linked List
    func mergeKLists() {
        linkList.mergeKLists()
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
