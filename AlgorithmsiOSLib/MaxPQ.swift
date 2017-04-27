//
//  MaxPQ.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2017-01-10.
//  Copyright © 2017 Peter Ho. All rights reserved.
//

import Foundation

protocol Init {
    init()
}

class MaxPQ<Key: Comparable>
where Key: Init {
    private var pq: [Key?]
    private var n: Int
    private var comparator: Comparator?
    
    init(capacity: Int) {
        self.pq = Array<Key?>(repeating: nil, count: capacity + 1)
        self.n = 0
    }
    
    func isEmpty() -> Bool {
        return n == 0;
    }
    
    func size() -> Int {
        return n
    }
    
    func max() -> Key? {
        if isEmpty() { return nil }
        return pq[1]
    }
    
    private func resize(capacity: Int) {
        assert(capacity > n)
        var temp = Array<Key?>(repeating: nil, count: capacity)
        for (index, i) in self.pq.enumerated() {
            temp[index] = i
        }
        self.pq = temp
    }
    
    func insert(x: Key) {
        if n >= self.pq.capacity - 1 { resize(capacity: 2 * self.pq.capacity) }
        
        n += 1
        self.pq[n] = x
        swim(n);
    }
    
    func delMax() -> Key? {
        if isEmpty() { return nil }
        let max = self.pq[1]
        exch(1, n)
        n -= 1
        sink(1)
        self.pq[n+1] = nil
        if n > 0 && n == (self.pq.capacity - 1) / 4 {
            resize(capacity: self.pq.capacity / 2)
        }
        
        return max
    }
    
    private func swim(_ m: Int) {
        var k = m
        while k > 1 && less(k/2, k) {
            exch(k, k/2)
            k = k/2
        }
    }
    
    private func sink(_ m: Int) {
        var k = m
        while 2 * k <= n {
            var j = 2 * k
            if j < n && less(j, j + 1) { j += 1 }
            if !less(k, j) { break }
            exch(k, j)
            k = j
        }
    }
    
    private func less(_ i: Int, _ j: Int) -> Bool {
        if self.comparator == nil {
            return self.pq[i]! < self.pq[j]!
        } else {
            return self.comparator!(i, j) == .orderedAscending
        }
    }
    
    private func exch(_ i: Int, _ j: Int) {
        let swap = self.pq[i]
        self.pq[i] = self.pq[j]
        self.pq[j] = swap
    }
}

