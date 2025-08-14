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
