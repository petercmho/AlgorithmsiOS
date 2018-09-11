//
//  DepthFirstPath.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2016-12-26.
//  Copyright © 2016 Peter Ho. All rights reserved.
//

import Foundation

class DepthFirstPath {
    private var marked: [Bool]
    private var edgeTo: [Int?]
    private let s: Int
    
    init(_ graph: Graph, _ s: Int) {
        self.s = s
        self.marked = Array<Bool>(repeating: false, count: graph.V())
        self.edgeTo = Array<Int?>(repeating: nil, count: graph.V())
        
        dfs(graph, s)
    }
    
    func dfs(_ graph: Graph, _ v: Int) {
        let visit = Stack<(Int, ListIterator<Int>)>()
        visit.push((v, graph.adj(v).makeIterator()))
        marked[v] = true;
        
        while let (v, itor) = visit.pop() {
            if let w = itor.next(), !marked[w] {
                marked[w] = true;
                edgeTo[w] = v;
                visit.push((v, itor))
                visit.push((w , graph.adj(w).makeIterator()))
            }
        }
    }
    
    func dfsNonRecursive(_ graph: Graph, _ v: Int) {
        let visit = Stack<Int>()
        visit.push(v);
        
        while let v = visit.pop() {
            marked[v] = true;
            for w in graph.adj(v) {
                if !marked[w] {
                    visit.push(w);
                    edgeTo[w] = v;
                }
            }
        }
    }
    
    func dfsNoStack(_ g: Graph, _ v: Int) {
        marked[v] = true;
        for w in g.adj(v) {
            if !marked[w] {
                dfsNoStack(g, w)
                edgeTo[w] = v
            }
        }
    }
    
    func hasPathTo(_ v: Int) -> Bool {
        return marked[v]
    }
    
    func pathTo(_ v: Int) -> [Int]? {
        if !hasPathTo(v) { return nil };
        
        let path = Stack<Int>()
        var w = v
        while let v = edgeTo[w] {
            path.push(w)
            w = v
        }
        path.push(s)
        
        return Array<Int>(path)
    }
}
