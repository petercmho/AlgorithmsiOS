//
//  BST.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2017-04-25.
//  Copyright © 2017 Peter Ho. All rights reserved.
//

import Foundation

class BST<Key: Comparable, Value>: Sequence, IteratorProtocol {
    private var root: Node?
    
    fileprivate class Node {
        fileprivate var key: Key;
        fileprivate var val: Value;
        fileprivate var left, right: Node?
        fileprivate var size: Int
        
        init(key: Key, val: Value, size: Int) {
            self.key = key
            self.val = val
            self.size = size
        }
    }
    
    func next() -> Value? {
        return nil
    }
    
    func isEmpty() -> Bool {
        return size() == 0
    }
    
    func size() -> Int {
        return size(self.root)
    }
    
    private func size(_ x: Node?) -> Int {
        if x == nil { return 0 }
        else { return x!.size }
    }
    
    func contains(key: Key) -> Bool {
        return get(key) != nil;
    }
    
    func get(_ key: Key) -> Value? {
        return get(self.root, key: key)
    }
    
    private func get(_ x: Node?, key: Key) -> Value? {
        if x == nil { return nil }
        if key < x!.key { return get(x!.left, key: key) }
        else if key > x!.key { return get(x!.right, key: key) }
        else { return x!.val }
    }
    
    func put(key: Key?, val: Value?) {
        if key == nil { return }
        if val == nil {
            delete(key)
            return
        }
        self.root = put(node: self.root, key: key!, val: val!)
    }
    
    private func put(node: Node?, key: Key, val: Value) -> Node? {
        if node == nil { return Node(key: key, val: val, size: 1) }
        if key < node!.key { node!.left = put(node: node!.left, key: key, val: val) }
        else if key > node!.key { node!.right = put(node: node!.right, key: key, val: val) }
        else { node!.val = val }
        node!.size = size(node!.left) + size(node!.right) + 1
        return node
    }
    
    func deleteMin() {
        if isEmpty() { return }
        self.root = deleteMin(node: self.root)
    }
    
    private func deleteMin(node: Node?) -> Node? {
        if node?.left == nil { return node?.right }
        node?.left = deleteMin(node: node?.left)
        return node
    }
    
    func delete(_ key: Key?) {
        if key == nil { return }
        self.root = delete(node: root, key: key!)
    }
    
    private func delete(node: Node?, key: Key) -> Node? {
        guard var node = node
            else { return nil }
        
        if key < node.key { node.left = delete(node: node.left, key: key) }
        else if key < node.key { node.right = delete(node: node.right, key: key) }
        else {
            if node.right == nil { return node.left }
            if node.left == nil { return node.right }
            let t = node;
            node = min(node: t.right)!
            node.right = deleteMin(node: t.right)
            node.left = t.left
        }
        node.size = size(node.left) + size(node.right) + 1
        return node
    }
    
    func min() -> Key? {
        if isEmpty() { return nil }
        return min(node: self.root)?.key
    }
    
    private func min(node: Node?) -> Node? {
        if node?.left == nil { return node }
        else { return min(node: node?.left) }
    }
}
