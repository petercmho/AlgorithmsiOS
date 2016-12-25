//
//  DepthFirstPath.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2016-12-26.
//  Copyright © 2016 Peter Ho. All rights reserved.
//

import Foundation

class DepthFirstPath {
    private let graph: Graph
    private let v: Int
    private var marked: [Bool]
    private var edgeTo: [Int?]
    
    init(_ graph: Graph, _ v: Int) {
        self.graph = graph
        self.v = v
        self.marked = Array<Bool>(repeating: false, count: graph.V())
        self.edgeTo = Array<Int?>(repeating: nil, count: graph.V())
    }
    
    static func dfs(_ graph: Graph, _ v: Int) {
        
    }
}
