//
//  Stack.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2016-12-14.
//  Copyright © 2016 Peter Ho. All rights reserved.
//

import Foundation

class StackNode<T> {
    let item: T
    var next: StackNode<T>?
    
    init(_ item: T, _ next: StackNode<T>?) {
        self.item = item
        self.next = next
    }
}

class Stack<T>: Sequence {
    private var count = 0
    private var first: StackNode<T>?
    
    func isEmpty() -> Bool {
        return first == nil
    }
    
    func size() -> Int {
        return self.count
    }
    
    func push(_ item: T) {
        let oldFirst = first
        first = StackNode(item, oldFirst)
        count += 1
    }
    
    func pop() -> T? {
        let item = first?.item
        first = first?.next
        count -= 1
        return item
    }
    
    func makeIterator() -> StackIterator<T> {
        return StackIterator(self.first)
    }
//    
//    func enumerated() -> EnumeratedSequence<Stack<T>> {
//        <#code#>
//    }
}

class StackIterator<T>: IteratorProtocol {
    var current: StackNode<T>?
    
    init(_ first: StackNode<T>?) {
        self.current = first
    }
    
    func next() -> T? {
        let lastCurrent = self.current
        self.current = lastCurrent?.next
        return lastCurrent?.item
    }
}
