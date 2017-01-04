//
//  Bipartite.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2017-01-03.
//  Copyright © 2017 Peter Ho. All rights reserved.
//

class Bipartite {
    private var marked: [Bool?]
    private var bipartite: Bool
    
    init(_ graph: Graph) {
        self.marked = Array<Bool?>(repeating: nil, count: graph.V())
        self.bipartite = true
        
        for i in 0..<graph.V() {
            if self.marked[i] == nil {
                self.bipartite = dfs(graph, i, true)
            }
            if !self.bipartite {
                return
            }
        }
    }
    
    func dfs(_ graph: Graph, _ v: Int, _ mark: Bool) -> Bool {
        self.marked[v] = mark
        
        for i in graph.adj(v) {
            if self.marked[i] == nil {
                self.bipartite = dfs(graph, i, !mark)
            } else if self.marked[i] == mark {
                self.bipartite = false
                break
            }
        }
        
        return self.bipartite
    }
    
    func isBipartite() -> Bool {
        return self.bipartite
    }
}
