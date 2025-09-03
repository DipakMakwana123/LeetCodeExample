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
        let merged = linkList.LL1_23_mergeKLists([list1, list2, list3])
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
    func addTwoNumbers() {
        // l1 = [2,4,3], l2 = [5,6,4]
        // 342 + 465 = 807 → output: [7,0,8]
        let l1 = ListNode(2, ListNode(4, ListNode(3)))
        let l2 = ListNode(5, ListNode(6, ListNode(4)))
        
        var result = linkList.LL6_2_addTwoNumbers(l1, l2)
        while result != nil {
            print(result!.val, terminator: " ") // 7 0 8
            result = result?.next
        }
    }
    func hasCycle(){
        let node1 = ListNode(3)
        let node2 = ListNode(2)
        let node3 = ListNode(0)
        let node4 = ListNode(-4)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node2 // cycle here
        print(linkList.LL8_141_hasCycle(node1)) // true

    }
    func mergeTwoLists() {
        let l1 = ListNode(1, ListNode(2, ListNode(4)))
        let l2 = ListNode(1, ListNode(3, ListNode(4)))
        var merged = linkList.LL3_21_mergeTwoLists(l1, l2)
        while merged != nil {
            print(merged!.val, terminator: " ") // 1 1 2 3 4 4
            merged = merged?.next
        }
    }
    func removeNthFromEnd() {
        let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
        var result = linkList.LL9_19_removeNthFromEnd(head, 2)
        while result != nil {
            print(result!.val, terminator: " ") // Output: 1 2 3 5
            result = result?.next
        }
    }
    func reorderList() {
        let head: ListNode? = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
        linkList.LL10_143_reorderList(head)
        var curr = head
        while curr != nil {
            print(curr!.val, terminator: " ")  // Output: 1 5 2 4 3
            curr = curr?.next
        }
    }
    func middleNode(){
        let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
        if let middle = linkList.LL11_876_middleNode(head) {
            print(middle.val) // Output: 3
        }
    }
    func flatten() {
//Input:  1
//       / \
//      2   5
//     / \   \
//    3   4   6
        // Output : 1 -> 2 -> 3 -> 4 -> 5 -> 6
    }
    func reverseKGroup() {
        let head: ListNode? = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
        let k = 2
        print(linkList.LL13_25_reverseKGroup(head, k) ?? nil ?? ListNode(0))
    }
    func copyRandomList(){
        
    }
    func findDuplicate(){
        print(linkList.LL14_287_findDuplicate([1,3,4,2,2])) // Output: 2
        print(linkList.LL14_287_findDuplicate([3,1,3,4,2])) // Output: 3

    }
    func sortList() {
        func buildList(_ arr: [Int]) -> ListNode? {
            let dummy = ListNode(0)
            var current = dummy
            for num in arr {
                current.next = ListNode(num)
                current = current.next!
            }
            return dummy.next
        }

        func printList(_ head: ListNode?) {
            var head = head
            var result = [Int]()
            while head != nil {
                result.append(head!.val)
                head = head?.next
            }
            print(result)
        }
        
        let list1 = buildList([4,2,1,3])
        printList(linkList.ll15_148_sortList(list1))   // [1,2,3,4]

        let list2 = buildList([-1,5,3,4,0])
        printList(linkList.ll15_148_sortList(list2))   // [-1,0,3,4,5]

        let list3 = buildList([])
        printList(linkList.ll15_148_sortList(list3))   // []
    }
    
}
