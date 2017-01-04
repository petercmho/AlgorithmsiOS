//
//  ConnectedComponents.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2017-01-03.
//  Copyright © 2017 Peter Ho. All rights reserved.
//

import Foundation

class ConnectedComponents {
    var id: [Int]
    var marked: [Bool]
    var size: [Int]
    var count: Int
    
    init(_ graph: Graph) {
        self.id = Array<Int>(repeating: 0, count: graph.V())
        self.marked = Array<Bool>(repeating: false, count: graph.V())
        self.size = [Int]()
        self.count = 0
        
        for i in 0..<graph.V() {
            if !self.marked[i] {
                self.size.append(0)
                dfs(graph, i)
                self.count += 1
            }
        }
        
    }
    
    func dfs(_ graph: Graph, _ v: Int) {
        self.marked[v] = true
        self.id[v] = count
        self.size[count] += 1
        for i in graph.adj(v) {
            if !self.marked[i] {
                dfs(graph, i)
            }
        }
    }
    
    func isConnected(_ v: Int, _ w: Int) -> Bool {
        return self.id[v] == self.id[w]
    }
    
    func getCount() -> Int {
        return self.count
    }
    
    func getSize(_ v: Int) -> Int {
        return self.size[self.id[v]]
    }
}
