//
//  AlgorithmsiOSLibTests.swift
//  AlgorithmsiOSLibTests
//
//  Created by Peter Ho on 2016-12-13.
//  Copyright © 2016 Peter Ho. All rights reserved.
//

import XCTest
@testable import AlgorithmsiOSLib

class AlgorithmsiOSLibTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testQueue() {
        let intQueue = Queue<Int>()
        
        XCTAssertTrue(intQueue.isEmpty())
        
        intQueue.enqueue(5)
        intQueue.enqueue(6)
        intQueue.enqueue(1)
        intQueue.enqueue(10)
        
        XCTAssertFalse(intQueue.isEmpty())
        XCTAssert(intQueue.dequeue() == 5)
        XCTAssert(intQueue.dequeue() == 6)
        XCTAssert(intQueue.dequeue() == 1)
        XCTAssert(intQueue.dequeue() == 10)
        
        XCTAssertTrue(intQueue.isEmpty())
    }
    
    func testStack() {
        let intStack = Stack<Int>()
        
        XCTAssertTrue(intStack.isEmpty())
        XCTAssertTrue(intStack.size() == 0)
        
        intStack.push(8)
        intStack.push(3)
        intStack.push(10)
        
        XCTAssertTrue(intStack.size() == 3)
        XCTAssertFalse(intStack.isEmpty())
        
        XCTAssertTrue(intStack.pop() == 10)
        XCTAssertTrue(intStack.pop() == 3)
        XCTAssertTrue(intStack.pop() == 8)
        
        XCTAssertTrue(intStack.isEmpty())
    }
    
    func testBag() {
        let intBag = Bag<Int>()
        let inputValues = [22, 16, 8, -2, 57, 47, -78]
        let size = inputValues.count
        
        XCTAssertTrue(intBag.size() == 0)
        
        for value in inputValues {
            intBag.add(value)
        }
        
        XCTAssertTrue(intBag.size() == size)
        var index = 1
        
        for i in intBag {
            // Assume Bag's implementation same as stack
            XCTAssertTrue(i == inputValues[size - index])
            print("Bag[\(index)] = \(i)")
            index += 1
        }
        
        intBag.remove(8)
        XCTAssertTrue(intBag.size() == size - 1)
        
        index = 1
        for i in intBag{
            print("Bag[\(index)] = \(i)")
            index += 1
        }
    }
    
    func createSampleGraph1() -> Graph {
        let graph = Graph(13)
        graph.addEdge(0, 1)
        graph.addEdge(0, 2)
        graph.addEdge(0, 5)
        graph.addEdge(0, 6)
        graph.addEdge(3, 4)
        graph.addEdge(3, 5)
        graph.addEdge(4, 5)
        graph.addEdge(4, 6)
        graph.addEdge(7, 8)
        graph.addEdge(9, 10)
        graph.addEdge(9, 11)
        graph.addEdge(9, 12)
        graph.addEdge(11, 12)
        
        return graph
    }
    
    func createBipartiteGraph() -> Graph {
        let graph = Graph(7)
        graph.addEdge(0, 1)
        graph.addEdge(0, 2)
        graph.addEdge(0, 5)
        graph.addEdge(0, 6)
        graph.addEdge(1, 3)
        graph.addEdge(2, 3)
        graph.addEdge(2, 4)
        graph.addEdge(4, 5)
        graph.addEdge(4, 6)
        
        return graph
    }
    
    func testGraph() {
        let graph = createSampleGraph1()
        
        XCTAssertTrue(graph.V() == 13)
        XCTAssertTrue(graph.E() == 13)
        XCTAssertTrue(graph.adj(0).size() == 4)
        
        let iterator = graph.adj(0).makeIterator()
        if let item = iterator.next() { XCTAssertTrue(item == 6) }
        if let item = iterator.next() { XCTAssertTrue(item == 5) }
        if let item = iterator.next() { XCTAssertTrue(item == 2) }
        if let item = iterator.next() { XCTAssertTrue(item == 1) }
        
        XCTAssertTrue(Graph.degree(graph, 0) == 4)
        XCTAssertTrue(Graph.degree(graph, 1) == 1)
        XCTAssertTrue(Graph.degree(graph, 2) == 1)
        XCTAssertTrue(Graph.degree(graph, 3) == 2)
        XCTAssertTrue(Graph.degree(graph, 4) == 3)
        XCTAssertTrue(Graph.degree(graph, 5) == 3)
        XCTAssertTrue(Graph.degree(graph, 6) == 2)
        XCTAssertTrue(Graph.degree(graph, 7) == 1)
        XCTAssertTrue(Graph.degree(graph, 8) == 1)
        XCTAssertTrue(Graph.degree(graph, 9) == 3)
        XCTAssertTrue(Graph.degree(graph, 10) == 1)
        XCTAssertTrue(Graph.degree(graph, 11) == 2)
        XCTAssertTrue(Graph.degree(graph, 12) == 2)
        
        XCTAssertTrue(Graph.maxDegree(graph) == 4)
        XCTAssertTrue(Graph.averageDegree(graph) == 2.0)
        XCTAssertTrue(Graph.numberOfSelfLoops(graph) == 0)
    }
    
    func testLSD() {
        var testData = ["dab", "add", "cab", "fad", "fee", "bad", "dad", "bee", "fed", "bed", "ebb", "ace"]
        LSD.indexCount(&testData, 3)
        for s in testData {
            print(s)
        }
    }
    
    func testDepthFirstPath() {
        let graph = createSampleGraph1()
        let depthFirstPath = DepthFirstPath(graph, 1)
        
        print("Depth First Path from 1 to 4")
        
        guard let pathTo = depthFirstPath.pathTo(4) else { return }
        for v in pathTo {
            print(v)
        }
    }
    
    func testBreadthFirstPath() {
        let graph = createSampleGraph1()
        let breadthFirstPath = BreadthFirstPath(graph, 1)
        
        print("Breadth First Path from 1 to 4")
        for v in breadthFirstPath.pathTo(4) {
            print(v)
        }
        
        print("Breadth First Path form 1 to 3")
        for v in breadthFirstPath.pathTo(3) {
            print(v)
        }
        
        XCTAssertTrue(breadthFirstPath.distTo(1) == 0)
        XCTAssertTrue(breadthFirstPath.distTo(0) == 1)
        XCTAssertTrue(breadthFirstPath.distTo(6) == 2)
        XCTAssertTrue(breadthFirstPath.distTo(4) == 3)
        XCTAssertNil(breadthFirstPath.distTo(7))
        XCTAssertTrue(breadthFirstPath.distTo(5) == 2)
        XCTAssertTrue(breadthFirstPath.distTo(3) == 3)
        
        XCTAssertFalse(breadthFirstPath.distTo(3) == 4)
    }
    
    func testConnectedComponent() {
        let graph = createSampleGraph1()
        let connectedComponent = ConnectedComponents(graph)
        
        XCTAssertTrue(connectedComponent.isConnected(0, 1))
        XCTAssertTrue(connectedComponent.isConnected(0, 5))
        XCTAssertTrue(connectedComponent.isConnected(0, 6))
        XCTAssertTrue(connectedComponent.isConnected(0, 2))
        XCTAssertTrue(connectedComponent.isConnected(0, 3))
        XCTAssertTrue(connectedComponent.isConnected(0, 4))
        XCTAssertTrue(connectedComponent.isConnected(7, 8))
        XCTAssertTrue(connectedComponent.isConnected(9, 10))
        XCTAssertTrue(connectedComponent.isConnected(10, 11))
        XCTAssertTrue(connectedComponent.isConnected(10, 12))
        XCTAssertTrue(connectedComponent.getCount() == 3)
        XCTAssertTrue(connectedComponent.getSize(0) == 7)
        XCTAssertTrue(connectedComponent.getSize(7) == 2)
        XCTAssertTrue(connectedComponent.getSize(10) == 4)
        XCTAssertFalse(connectedComponent.getSize(1) == 8)
    }
    
    func testBipartite() {
        print("Test Biparatite graph")
        var graph = createBipartiteGraph()
        var bipartite = Bipartite(graph)
        
        XCTAssertTrue(bipartite.isBipartite())
        
        print("Test non-bipartite graph")
        graph = createSampleGraph1()
        bipartite = Bipartite(graph)
        XCTAssertFalse(bipartite.isBipartite())
        print("The odd number cycle is ")
        for i in bipartite.getCycle() {
            print(i)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
