//
//  Graph.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2016-12-18.
//  Copyright © 2016 Peter Ho. All rights reserved.
//

import Foundation

class Graph {
    private let v: Int
    private var e: Int
    private var adj: [Bag<Int>]
    
    init(_ v: Int) {
        self.v = v
        self.e = 0
//        self.adj = [Bag<Int>](repeatElement(Bag<Int>(), count: v))
        self.adj = [Bag<Int>]()
        self.adj.reserveCapacity(v)
        for _ in 0..<v {
            self.adj.append(Bag<Int>())
        }
    }
    
    func addEdge(_ v: Int, _ w: Int) {
        self.adj[v].add(w)
        self.adj[w].add(v)
        e += 1
    }
    
    // TODO: Change the return type to Sequence
    func adj(_ v: Int) -> Bag<Int> {
        return self.adj[v]
    }
    
    func V() -> Int {
        return self.v
    }
    
    func E() -> Int {
        return self.e
    }
    
    static func degree(_ g: Graph, _ v: Int) -> Int {
        var degree = 0
        for _ in g.adj(v) {
            degree += 1
        }
        
        return degree
    }
    
    static func maxDegree(_ g: Graph) -> Int {
        var max = 0
        for v in 0..<g.V() {
            if degree(g, v) > max {
                max = degree(g, v)
            }
        }
        return max
    }
    
    static func averageDegree(_ g: Graph) -> Double {
        return 2.0 * Double(g.E() / g.V())
    }
    
    static func numberOfSelfLoops(_ g: Graph) -> Int {
        var count = 0
        for v in 0 ..< g.V() {
            for w in g.adj(v) {
                if v == w { count += 1 }
            }
        }
        return count / 2
    }
}
