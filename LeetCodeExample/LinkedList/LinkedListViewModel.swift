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
        let list1_1 = linkList.LL2_createListNode(from: [1, 2, 4])
        let list1_2 = linkList.LL2_createListNode(from: [1, 3, 4])
        let mergedList1 = linkList.LL3_mergeTwoLists(list1_1, list1_2)
        print("Merged List 1:")
        linkList.printListNode(mergedList1) // Expected: [1, 1, 2, 3, 4, 4]
        
        // Example 2
        let list2_1: ListNode? = nil
        let list2_2: ListNode? = nil
        let mergedList2 = linkList.LL3_mergeTwoLists(list2_1, list2_2)
        print("Merged List 2:")
        linkList.printListNode(mergedList2) // Expected: []
        
        // Example 3
        let list3_1: ListNode? = nil
        let list3_2 = linkList.LL2_createListNode(from: [0])
        let mergedList3 = linkList.LL3_mergeTwoLists(list3_1, list3_2)
        print("Merged List 3:")
        linkList.printListNode(mergedList3) // Expected: [0]
        
        // Additional Test Case
        let list4_1 = linkList.LL2_createListNode(from: [5])
        let list4_2 = linkList.LL2_createListNode(from: [1, 2, 4])
        let mergedList4 = linkList.LL3_mergeTwoLists(list4_1, list4_2)
        print("Merged List 4:")
        linkList.printListNode(mergedList4) // Expected: [1, 2, 4, 5]
    }
    
    func findMedian() {
        var list1_1 = linkList.LL2_createListNode(from: [1, 3])
        var list1_2 = linkList.LL2_createListNode(from: [2])
        var mergedNode = linkList.LL3_mergeTwoLists(list1_1, list1_2)
        var sortedArray = linkList.LL4_convertListNodeToArray(mergedNode)
        var median = linkList.LL5_findMedian(array: sortedArray)
        print(median) // Expected: 2.0
        
        list1_1 = linkList.LL2_createListNode(from: [1, 2])
        list1_2 = linkList.LL2_createListNode(from: [3,4])
        mergedNode = linkList.LL3_mergeTwoLists(list1_1, list1_2)
        sortedArray = linkList.LL4_convertListNodeToArray(mergedNode)
        median = linkList.LL5_findMedian(array: sortedArray)
        print(median) // Expected: 2.5
        
        list1_1 = linkList.LL2_createListNode(from: [0, 0])
        list1_2 = linkList.LL2_createListNode(from: [0,0])
        mergedNode = linkList.LL3_mergeTwoLists(list1_1, list1_2)
        sortedArray = linkList.LL4_convertListNodeToArray(mergedNode)
        median = linkList.LL5_findMedian(array: sortedArray)
        print(median) // Expected: 0.0
        
        list1_1 = linkList.LL2_createListNode(from: [])
        list1_2 = linkList.LL2_createListNode(from: [1])
        mergedNode = linkList.LL3_mergeTwoLists(list1_1, list1_2)
        sortedArray = linkList.LL4_convertListNodeToArray(mergedNode)
        median = linkList.LL5_findMedian(array: sortedArray)
        print(median) // Expected: 1.0
        
        list1_1 = linkList.LL2_createListNode(from: [1])
        list1_2 = linkList.LL2_createListNode(from: [])
        mergedNode = linkList.LL3_mergeTwoLists(list1_1, list1_2)
        sortedArray = linkList.LL4_convertListNodeToArray(mergedNode)
        median = linkList.LL5_findMedian(array: sortedArray)
        print(median) // Expected: 1.0
        
        list1_1 = linkList.LL2_createListNode(from: [1,2,5])
        list1_2 = linkList.LL2_createListNode(from: [3,4,6])
        mergedNode = linkList.LL3_mergeTwoLists(list1_1, list1_2)
        sortedArray = linkList.LL4_convertListNodeToArray(mergedNode)
        median = linkList.LL5_findMedian(array: sortedArray)
        print(median) // Expected: 3.5
        
        list1_1 = linkList.LL2_createListNode(from: [-5,0,10])
        list1_2 = linkList.LL2_createListNode(from: [-10,-3,7])
        mergedNode = linkList.LL3_mergeTwoLists(list1_1, list1_2)
        sortedArray = linkList.LL4_convertListNodeToArray(mergedNode)
        median = linkList.LL5_findMedian(array: sortedArray)
        print(median) //Expected: 0.0 (merged: [-10, -5, -3, 0, 7, 10])
    }
   
    func mergeKLists() {
        let list1 = linkList.LL2_createListNode(from: [1, 4, 5])
        let list2 = linkList.LL2_createListNode(from: [1, 3, 4])
        let list3 = linkList.LL2_createListNode(from: [2, 6])
        let merged = linkList.LL1_mergeKLists([list1, list2, list3])
        linkList.printListNode(merged)
       // debugPrint(merged as Any)
        //Output: [1,1,2,3,4,4,5,6]
//        Explanation: The linked-lists are:
//        [
//          1->4->5,
//          1->3->4,
//          2->6
//        ]
//        merging them into one sorted linked list:
//        1->1->2->3->4->4->5->6
    }
}
