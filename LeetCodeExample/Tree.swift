//
//  Tree.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 06/07/25.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Tree {
    func maxDepth(_ root: TreeNode?) -> Int {
        
        // Base case: If the node is nil (empty subtree), its depth is 0.
        guard let root = root else {
            return 0
        }

        // Recursively find the maximum depth of the left subtree.
        let leftDepth = maxDepth(root.left)
        // Recursively find the maximum depth of the right subtree.
        let rightDepth = maxDepth(root.right)

        // The maximum depth of the current tree is 1 (for the current node)
        // plus the maximum of the depths of its left and right subtrees.
        return 1 + max(leftDepth, rightDepth)
    }
    
    func createTree(from array: [Int?]) -> TreeNode? {
     
        guard !array.isEmpty else { return nil }
        let nodes: [TreeNode?] = array.map { $0.map { TreeNode($0) } }
        
        // Connect nodes
        for i in 0..<nodes.count {
            if let node = nodes[i] {
                let leftChildIndex = 2 * i + 1
                let rightChildIndex = 2 * i + 2
                
                if leftChildIndex < nodes.count {
                    node.left = nodes[leftChildIndex]
                }
                if rightChildIndex < nodes.count {
                    node.right = nodes[rightChildIndex]
                }
            }
        }
        return nodes[0]
    }
}

/// Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
/// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
///
/// This algorithm runs in O(n) time and without using the division operation.
///
/// - Parameter nums: The input array of integers.
/// - Returns: An array where answer[i] is the product of all elements in nums except nums[i].
func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    
    // Initialize the answer array with 1s.
    // This array will first store the product of elements to the left of each index.
    var answer = Array(repeating: 1, count: n)
    
    // MARK: - Left Pass: Calculate products of elements to the left of each index
    // `leftProduct` will accumulate the product of elements encountered so far from the left.
    var leftProduct = 1
    for i in 0..<n {
        // At index `i`, `answer[i]` stores the product of elements BEFORE `nums[i]`.
        answer[i] = leftProduct
        
        // Update `leftProduct` by multiplying it with the current element `nums[i]`.
        // This `leftProduct` will be used for the next index `i+1`.
        leftProduct *= nums[i]
    }
    
    // MARK: - Right Pass: Multiply with products of elements to the right of each index
    // `rightProduct` will accumulate the product of elements encountered so far from the right.
    var rightProduct = 1
    for i in (0..<n).reversed() { // Iterate from right to left
        // At index `i`, `answer[i]` currently holds the product of elements to its left.
        // We now multiply it by `rightProduct`, which is the product of elements AFTER `nums[i]`.
        answer[i] *= rightProduct
        
        // Update `rightProduct` by multiplying it with the current element `nums[i]`.
        // This `rightProduct` will be used for the previous index `i-1`.
        rightProduct *= nums[i]
    }
    
    return answer
}

// MARK: - Example Usage
/*
// Example 1
let nums1 = [1, 2, 3, 4]
let result1 = productExceptSelf(nums1)
print("Input: \(nums1)") // Expected: [24, 12, 8, 6]
print("Output: \(result1)") // Output: [24, 12, 8, 6]

// Example 2
let nums2 = [-1, 1, 0, -3, 3]
let result2 = productExceptSelf(nums2)
print("Input: \(nums2)") // Expected: [0, 0, 9, 0, 0]
print("Output: \(result2)") // Output: [0, 0, 9, 0, 0]

// Example 3: Single element
let nums3 = [7]
let result3 = productExceptSelf(nums3)
print("Input: \(nums3)") // Expected: [1] (product of empty set is 1)
print("Output: \(result3)") // Output: [1]

// Example 4: Two elements
let nums4 = [5, 10]
let result4 = productExceptSelf(nums4)
print("Input: \(nums4)") // Expected: [10, 5]
print("Output: \(result4)") // Output: [10, 5]
*/ 
