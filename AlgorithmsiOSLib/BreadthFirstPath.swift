//
//  BreadthFirstPath.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2016-12-29.
//  Copyright © 2016 Peter Ho. All rights reserved.
//

import Foundation

class BreadthFirstPath {
    private var marked: [Bool]
    private var edgeTo: [Int?]
    private var level: [Int]
    private let s: Int
    
    init(_ graph: Graph, _ s: Int) {
        self.marked = Array<Bool>(repeating: false, count: graph.V())
        self.edgeTo = Array<Int?>(repeating: nil, count: graph.V())
        self.level = Array<Int>(repeating: 0, count: graph.V())
        self.s = s
        bfs(graph, s)
    }
    
//    func bfs(_ graph: Graph, _ v: Int) {
//        let visit = Queue<Int>()
//        var count = 0
//        visit.enqueue(v)
//        self.level[v] = count
//        
//        while let w = visit.dequeue() {
//            if !marked[w] {
//                marked[w] = true
//                for i in graph.adj(w) {
//                    if !self.marked[i] {
//                        visit.enqueue(i)
//                        edgeTo[i] = w
//                    }
//                }
//            }
//        }
//    }
    
    func bfs(_ graph: Graph, _ s: Int) {
        let visit = Queue<Int>()
        self.marked[s] = true
        visit.enqueue(s)
    
        while let w = visit.dequeue() {
            for i in graph.adj(w) {
                if !self.marked[i] {
                    visit.enqueue(i)
                    self.marked[i] = true
                    self.edgeTo[i] = w
                }
            }
        }
        
    }
    
    func hasPathTo(_ v: Int) -> Bool {
        return marked[v]
    }
    
    func pathTo(_ v: Int) -> [Int] {
        let reversePath = Stack<Int>()
        var w = v
        while let u = self.edgeTo[w] {
            reversePath.push(w)
            w = u
        }
        reversePath.push(s)
        
        return Array<Int>(reversePath)
    }
}
