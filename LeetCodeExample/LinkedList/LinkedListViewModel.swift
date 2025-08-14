//
//  LinkedListViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 14/08/25.
//

import Foundation

struct LinkedListViewModel {
    
    
    private var linkList: LinkList
    
    init(linkList: LinkList = .init()) {
        self.linkList = linkList
    }
    
    func mergeTwoArray() {
        // Example 1
        let list1_1 = linkList.createListNode(from: [1, 2, 4])
        let list1_2 = linkList.createListNode(from: [1, 3, 4])
        let mergedList1 = linkList.mergeTwoLists(list1_1, list1_2)
        print("Merged List 1:")
        linkList.printListNode(mergedList1) // Expected: [1, 1, 2, 3, 4, 4]
        
        // Example 2
        let list2_1: ListNode? = nil
        let list2_2: ListNode? = nil
        let mergedList2 = linkList.mergeTwoLists(list2_1, list2_2)
        print("Merged List 2:")
        linkList.printListNode(mergedList2) // Expected: []
        
        // Example 3
        let list3_1: ListNode? = nil
        let list3_2 = linkList.createListNode(from: [0])
        let mergedList3 = linkList.mergeTwoLists(list3_1, list3_2)
        print("Merged List 3:")
        linkList.printListNode(mergedList3) // Expected: [0]
        
        // Additional Test Case
        let list4_1 = linkList.createListNode(from: [5])
        let list4_2 = linkList.createListNode(from: [1, 2, 4])
        let mergedList4 = linkList.mergeTwoLists(list4_1, list4_2)
        print("Merged List 4:")
        linkList.printListNode(mergedList4) // Expected: [1, 2, 4, 5]
        
    }
    
    func findMedian() {
        var list1_1 = linkList.createListNode(from: [1, 3])
        var list1_2 = linkList.createListNode(from: [2])
        var mergedNode = linkList.mergeTwoLists(list1_1, list1_2)
        var sortedArray = linkList.convertListNodeToArray(mergedNode)
        var median = linkList.findMedian(array: sortedArray)
        print(median) // Expected: 2.0
        
        
        list1_1 = linkList.createListNode(from: [1, 2])
        list1_2 = linkList.createListNode(from: [3,4])
        mergedNode = linkList.mergeTwoLists(list1_1, list1_2)
        sortedArray = linkList.convertListNodeToArray(mergedNode)
        median = linkList.findMedian(array: sortedArray)
        print(median) // Expected: 2.5
        
        list1_1 = linkList.createListNode(from: [0, 0])
        list1_2 = linkList.createListNode(from: [0,0])
        mergedNode = linkList.mergeTwoLists(list1_1, list1_2)
        sortedArray = linkList.convertListNodeToArray(mergedNode)
        median = linkList.findMedian(array: sortedArray)
        print(median) // Expected: 0.0
        
        list1_1 = linkList.createListNode(from: [])
        list1_2 = linkList.createListNode(from: [1])
        mergedNode = linkList.mergeTwoLists(list1_1, list1_2)
        sortedArray = linkList.convertListNodeToArray(mergedNode)
        median = linkList.findMedian(array: sortedArray)
        print(median) // Expected: 1.0
        
        list1_1 = linkList.createListNode(from: [1])
        list1_2 = linkList.createListNode(from: [])
        mergedNode = linkList.mergeTwoLists(list1_1, list1_2)
        sortedArray = linkList.convertListNodeToArray(mergedNode)
        median = linkList.findMedian(array: sortedArray)
        print(median) // Expected: 1.0
        
        list1_1 = linkList.createListNode(from: [1,2,5])
        list1_2 = linkList.createListNode(from: [3,4,6])
        mergedNode = linkList.mergeTwoLists(list1_1, list1_2)
        sortedArray = linkList.convertListNodeToArray(mergedNode)
        median = linkList.findMedian(array: sortedArray)
        print(median) // Expected: 3.5
        
        list1_1 = linkList.createListNode(from: [-5,0,10])
        list1_2 = linkList.createListNode(from: [-10,-3,7])
        mergedNode = linkList.mergeTwoLists(list1_1, list1_2)
        sortedArray = linkList.convertListNodeToArray(mergedNode)
        median = linkList.findMedian(array: sortedArray)
        print(median) //Expected: 0.0 (merged: [-10, -5, -3, 0, 7, 10])
    }
}
