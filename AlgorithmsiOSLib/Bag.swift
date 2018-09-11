//
//  Bag.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2016-12-19.
//  Copyright © 2016 Peter Ho. All rights reserved.
//

import Foundation

// Note: When nested generic type is supported, move the Node class inside Bag
class BagNode<T> {
    let item: T
    var next: BagNode<T>?
    
    init(_ item: T, _ next: BagNode<T>?) {
        self.item = item
        self.next = next
    }
}

class Bag<T : Equatable>: Sequence {
    private var count = 0
    private var first: BagNode<T>?
    
    func add(_ x: T) {
        let oldFirst = self.first
        self.first = BagNode<T>(x, oldFirst)
        self.count += 1
    }
    
    func size() -> Int {
        return self.count
    }
    
    func remove(_ x: T) {
        first = removeItem(x, from: first)
    }
    
    private func removeItem(_ x: T, from: BagNode<T>?) -> BagNode<T>? {
        guard let node = from else { return nil }
        
        if node.item == x {
            self.count -= 1
            return node.next
        } else {
            node.next = removeItem(x, from: node.next)
            return node
        }
    }
    
    // MARK: - Sequence
    func makeIterator() -> ListIterator<T> {
        return ListIterator<T>(self.first)
    }
}

class ListIterator<T>: IteratorProtocol {
    private var current: BagNode<T>?
    
    init(_ first: BagNode<T>?) {
        self.current = first
    }
    
    // MARK: - IteratorProtocol
    func next() -> T? {
        let item = self.current?.item
        self.current = self.current?.next
        
        return item
    }
}
