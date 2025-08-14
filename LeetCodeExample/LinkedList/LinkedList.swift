//
//  LinkedList.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 06/08/25.
//

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode? // next is an Optional, meaning it can be nil
    public init() {
        self.val = 0;
        self.next = nil;
    }
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
    }
}
// Helper: Min-Heap / Priority Queue
struct PriorityQueue {
    private var heap: [ListNode] = []

    mutating func push(_ node: ListNode) {
        heap.append(node)
        heap.sort { $0.val < $1.val }
    }

    mutating func pop() -> ListNode? {
        guard !heap.isEmpty else { return nil }
        return heap.removeFirst()
    }

    var isEmpty: Bool {
        return heap.isEmpty
    }
}

struct LinkList {
    func mergeKLists() {
        let list1 = createListNode(from: [1, 4, 5])
        let list2 = createListNode(from: [1, 3, 4])
        let list3 = createListNode(from: [2, 6])
        let merged = mergeKLists([list1, list2, list3])
        printListNode(merged)
      //  debugPrint(merged as Any)

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
    
    func printListNode(_ head: ListNode?) {
        print(convertListNodeToArray(head))
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var queue = PriorityQueue()
    
        // Add initial nodes to queue
        for list in lists {
            if let node = list {
                queue.push(node)
            }
        }

        let dummy = ListNode(0)
        var current = dummy

        while !queue.isEmpty {
            if let smallest = queue.pop() {
                current.next = smallest
                current = current.next!
                if let next = smallest.next {
                    queue.push(next)
                }
            }
        }

        return dummy.next
    }
    func createListNode(from array: [Int]) -> ListNode? {
        guard !array.isEmpty else { return nil }
        let head = ListNode(array[0])
        var current = head
        for i in 1..<array.count {
            current.next = ListNode(array[i])
            current = current.next!
        }
        return head
    }
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // Create a dummy head node to simplify handling the beginning of the merged list.
        let dummyHead: ListNode = ListNode()
        // 'current' pointer will always point to the last node added to the merged list.
        var current: ListNode = dummyHead
        // Use optional variables to iterate through the input lists.
        var l1: ListNode? = list1
        var l2: ListNode? = list2
        // Loop as long as both lists have nodes remaining.
        while let node1 = l1, let node2 = l2 {
            // Compare the values of the current nodes.
            if node1.val <= node2.val {
                // If node1's value is smaller or equal, append node1 to the merged list.
                current.next = node1
                // Move list1's pointer to its next node.
                l1 = node1.next
            } else {
                // If node2's value is smaller, append node2 to the merged list.
                current.next = node2
                // Move list2's pointer to its next node.
                l2 = node2.next
            }
            // Move the 'current' pointer to the node that was just appended.
            // We just assigned current.next, so it's guaranteed not to be nil.
            current = current.next!
        }
        // After the loop, one of the lists might still have remaining nodes.
        // Append the rest of the non-nil list to the merged list.
        if l1 != nil {
            current.next = l1
        } else if l2 != nil {
            current.next = l2
        }
        // The merged list starts from dummyHead.next, as dummyHead was just a placeholder.
        return dummyHead.next
    }
    func convertListNodeToArray(_ head: ListNode?) -> [Int]{
        var current = head
        var result: [Int] = []
        while current != nil {
            result.append(current!.val)
            current = current!.next
        }
        return result
    }
    func findMedian(array: [Int]) -> Double{
        var median: Double = 0.0
        let cnt = array.count
        if cnt % 2 == 1 {
            // Odd number of elements: median is the middle element
            let middleIndex = cnt / 2 // Integer division automatically gets the correct index
            median =  Double(array[middleIndex])
        } else {
            // Even number of elements: median is the average of the two middle elements
            let rightMiddleIndex = cnt / 2
            let leftMiddleIndex = rightMiddleIndex - 1
            median =  Double(array[leftMiddleIndex] + array[rightMiddleIndex]) / 2.0
        }
        return median
    }
}
