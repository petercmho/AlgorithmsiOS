//
//  Stack.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2016-12-14.
//  Copyright © 2016 Peter Ho. All rights reserved.
//

import Foundation

class Stack<T> {
    private var first: Node<T>?
    
    func isEmpty() -> Bool {
        return first == nil
    }
    
    func push(item: T) {
        let oldFirst = first
        first = Node(item: item, next: oldFirst)
    }
    
    func pop() -> T? {
        let item = first?.item
        first = first?.next
        return item
    }
}
