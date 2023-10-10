//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by jybong on 10/10/23.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    typealias DoubleList = LinkedList<Double>
    typealias DoubleNode = LinkedList<Double>.Node<Double>
    typealias OperatorList = LinkedList<Operator>
    typealias OperatorNode = LinkedList<Operator>.Node<Operator>
    
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_operands에값이없을때_result호출시_0반환한다() throws {
        // given
        let doubleList = DoubleList()
        let node = OperatorNode(data: .add)
        let operatorList = OperatorList(head: node, tail: node)
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 0.0
        
        // when
        let result = try sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_operators에값이없고_operands에값1이있을때_result호출시_1을반환한다() throws {
        // given
        let node = DoubleNode(data: 1.0)
        let doubleList = DoubleList(head: node, tail: node)
        let operatorList = OperatorList()
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 1.0
        
        // when
        let result = try sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_operans에2와3과4값이있고_operator에add와subtract일때_result호출시_1을반환한다() throws {
        // given
        let firstNode = DoubleNode(data: 2.0)
        let secondNode = DoubleNode(data: 3.0)
        let thirdNode = DoubleNode(data: 4.0)
        let doubleList = DoubleList(head: firstNode, tail: thirdNode)
        firstNode.next = secondNode
        secondNode.next = thirdNode
        
        let addNode = OperatorNode(data: .add)
        let subtractNode = OperatorNode(data: .subtract)
        let operatorList = OperatorList(head: addNode, tail: subtractNode)
        addNode.next = subtractNode
        
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 1.0
        
        // when
        let result = try sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    
    func test_operans에2와2와4값이있고_operator에divide와mutiply일때_result호출시_4를반환한다() throws {
        // given
        let firstNode = DoubleNode(data: 2.0)
        let secondNode = DoubleNode(data: 2.0)
        let thirdNode = DoubleNode(data: 4.0)
        let doubleList = DoubleList(head: firstNode, tail: thirdNode)
        firstNode.next = secondNode
        secondNode.next = thirdNode
        
        let addNode = OperatorNode(data: .divide)
        let subtractNode = OperatorNode(data: .multiply)
        let operatorList = OperatorList(head: addNode, tail: subtractNode)
        addNode.next = subtractNode
        
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 4.0
        
        // when
        let result = try sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
}
