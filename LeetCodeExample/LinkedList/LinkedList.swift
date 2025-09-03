//
//  LinkedList.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 06/08/25.
//

import Foundation

struct LinkList {
    func printListNode(_ head: ListNode?) {
        print(LL4_convertListNodeToArray(head))
    }
    
    func LL1_mergeKLists(_ lists: [ListNode?]) -> ListNode? {
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
    func LL2_createListNode(from array: [Int]) -> ListNode? {
        guard !array.isEmpty else { return nil }
        let head = ListNode(array[0])
        var current = head
        for i in 1..<array.count {
            current.next = ListNode(array[i])
            current = current.next!
        }
        return head
    }
    func LL3_21_mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail: ListNode? = dummy
        var l1 = list1
        var l2 = list2
        
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                tail?.next = l1
                l1 = l1?.next
            } else {
                tail?.next = l2
                l2 = l2?.next
            }
            tail = tail?.next
        }
        
        // Attach remaining list
        tail?.next = l1 ?? l2
        
        return dummy.next
    }
    func LL3_mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
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
    func LL4_convertListNodeToArray(_ head: ListNode?) -> [Int]{
        var current = head
        var result: [Int] = []
        while current != nil {
            result.append(current!.val)
            current = current!.next
        }
        return result
    }
    func LL5_findMedian(array: [Int]) -> Double{
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
    func LL6_2_addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var curr: ListNode? = dummy
        var p = l1, q = l2
        var carry = 0
        while p != nil || q != nil {
            let x = p?.val ?? 0
            let y = q?.val ?? 0
            let sum = x + y + carry
            carry = sum / 10
            curr?.next = ListNode(sum % 10)
            curr = curr?.next
            p = p?.next
            q = q?.next
        }
        
        if carry > 0 {
            curr?.next = ListNode(carry)
        }
        
        return dummy.next
    }
    func LL7_206_reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head
        while curr != nil {
            let nextTemp = curr?.next
            curr?.next = prev
            prev = curr
            curr = nextTemp
        }
        return prev
    }
    
    
    func LL8_141_hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast { // found cycle
                return true
            }
        }
        return false
    }
    
    func LL1_23_mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var heap = Heap<ListNode>(priority: { $0.val < $1.val })
        
        // Add first node of each list
        for node in lists {
            if let n = node {
                heap.insert(n)
            }
        }
        
        let dummy = ListNode(0)
        var tail: ListNode? = dummy
        
        while let node = heap.extract() {
            tail?.next = node
            tail = node
            if let next = node.next {
                heap.insert(next)
            }
        }
        
        return dummy.next
    }
    
    func LL9_19_removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0, head) // Dummy node to handle edge cases
        var fast: ListNode? = dummy
        var slow: ListNode? = dummy
        
        // Move fast pointer n+1 steps ahead
        for _ in 0...n {
            fast = fast?.next
        }
        
        // Move both pointers until fast reaches end
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        // Remove the nth node
        slow?.next = slow?.next?.next
        
        return dummy.next
    }
    func LL10_143_reorderList(_ head: ListNode?) {
        guard head != nil && head?.next != nil else { return }
        
        // Step 1: Find middle
        var slow = head, fast = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // Step 2: Reverse second half
        var prev: ListNode? = nil
        var curr = slow?.next
        slow?.next = nil  // cut the list into two halves
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        // Step 3: Merge two halves
        var first = head
        var second = prev
        while second != nil {
            let tmp1 = first?.next
            let tmp2 = second?.next
            first?.next = second
            second?.next = tmp1
            first = tmp1
            second = tmp2
        }
    }
    func LL11_876_middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    private var prev: TreeNode? = nil
    
    mutating func LL12_114_flatten(_ root: TreeNode?) {
        guard let root = root else { return }
        
        // process right first
        LL12_114_flatten(root.right)
        LL12_114_flatten(root.left)
        
        root.right = prev
        root.left = nil
        prev = root
    }
    
    func LL13_25_reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var count = 0
        var node = head
        while count < k && node != nil {
            node = node?.next
            count += 1
        }
        if count == k {
            var prev: ListNode? = LL13_25_reverseKGroup(node, k) // reverse rest recursively
            var curr = head
            for _ in 0..<k {
                let nextNode = curr?.next
                curr?.next = prev
                prev = curr
                curr = nextNode
            }
            return prev
        }
        return head
    }
    func LL13_138_copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else { return nil }
        
        var curr: Node? = head
        
        // 1. Insert copy nodes
        while curr != nil {
            let copy = Node(curr!.val)
            copy.next = curr?.next
            curr?.next = copy
            curr = copy.next
        }
        
        // 2. Assign random pointers
        curr = head
        while curr != nil {
            curr?.next?.random = curr?.random?.next
            curr = curr?.next?.next
        }
        
        // 3. Separate lists
        curr = head
        let dummy = Node(0)
        var copyCurr: Node? = dummy
        
        while curr != nil {
            let copy = curr?.next
            copyCurr?.next = copy
            copyCurr = copy
            
            curr?.next = copy?.next
            curr = curr?.next
        }
        
        return dummy.next
    }
    func LL14_287_findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[0]
        
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast
        
        slow = nums[0]
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        return slow
    }
    
    // 148. Sort List
        func ll15_148_sortList(_ head: ListNode?) -> ListNode? {
            var list:[Int] = []
            sortNodes(head,&list)
            return head
        }

        func sortNodes(_ node:ListNode?,_ list:inout[Int]){
            if node == nil{
                list = list.sorted(by:{$0 < $1})
                return
            }
            list.append(node!.val)
            sortNodes(node?.next,&list)
            node?.val = list.last!
            let _ = list.popLast()
        }
    
}


