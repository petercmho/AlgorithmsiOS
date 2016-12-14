//
//  Queue.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2016-12-13.
//  Copyright © 2016 Peter Ho. All rights reserved.
//

import Foundation

class Node<T> {
    var item: T
    var next: Node?
    
    init(item: T, next: Node?) {
        self.item = item
        self.next = next
    }
}

class Queue <T> {
    private var first: Node<T>?
    private var last: Node<T>?
    
    func isEmpty() -> Bool {
        return first == nil
    }
    
    func enqueue(item: T) {
        let oldLast = last
        last = Node<T>(item: item, next: nil)
        if isEmpty() {
            first = last
        } else {
            oldLast?.next = last
        }
    }
    
    func dequeue() -> T? {
        let item = first?.item
        first = first?.next
        if isEmpty() { last = nil }
        return item
    }
}
