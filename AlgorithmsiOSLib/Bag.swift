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

class Bag<T>: Sequence {
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
