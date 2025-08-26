//
//  LRUCache.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 18/08/25.
//

import Foundation
class LRUCache {
    private class Node {
        let key: Int
        var value: Int
        var prev: Node?
        var next: Node?

        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }

    private let capacity: Int
    private var keyNodeMap = [Int: Node]()
    private var head: Node?
    private var tail: Node?
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let targetNode = keyNodeMap[key] else {
            return -1
        }
        removeNode(targetNode)
        insertToHead(targetNode)
        return targetNode.value
    }
    
    func put(_ key: Int, _ value: Int) {
        guard let targetNode = keyNodeMap[key] else {
            let newNode = Node(key, value)
            insertToHead(newNode)
            keyNodeMap[key] = newNode
            if let keyToRemove = tail?.key, keyNodeMap.count > capacity {
                removeKey(keyToRemove)
            }
            return
        }
        targetNode.value = value
        removeNode(targetNode)
        insertToHead(targetNode)
    }

    private func removeKey(_ key: Int) {
        if let node = keyNodeMap[key] {
            keyNodeMap[key] = nil
            removeNode(node)
        }
    }

    private func insertToHead(_ node: Node?) {
        guard let node else {
            return
        }
        if head == nil {
            head = node
            tail = node
        } else {
            node.prev = nil
            node.next = head
            head?.prev = node
            head = node
        }
    }

    private func removeNode(_ node: Node?) {
        guard let node else {
            return
        }
        if node.prev == nil && node.next == nil {
            head = nil
            tail = nil
        } else if let prev = node.prev, let next = node.next {
            prev.next = next
            next.prev = prev
            node.prev = nil
            node.next = nil
        } else if let prev = node.prev {
            prev.next = nil
            node.prev = nil
            tail = prev
        } else if let next = node.next {
            node.next = nil
            next.prev = nil
            head = next
        }
    }
}
