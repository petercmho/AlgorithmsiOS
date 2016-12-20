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

class Stack<T> {
    private var count = 0
    private var first: StackNode<T>?
    
    func isEmpty() -> Bool {
        return first == nil
    }
    
    func size() -> Int {
        return self.count
    }
    
    func push(item: T) {
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
}
