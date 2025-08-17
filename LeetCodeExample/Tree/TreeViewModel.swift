//
//  TreeViewModel.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 14/08/25.
//

import Foundation

struct TreeViewModel {
    private var tree: Tree
    
    init(_ tree: Tree = .init()) {
        self.tree = tree
    }
    func findMaxDepth() {
        let array = [3, 9, 20, nil, nil, 15, 7]
        let treeNode =  tree.createTree(from: array)
        _ = tree.maxDepth(treeNode)
    }
}
