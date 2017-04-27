//
//  BillTests.swift
//  MoneyTests
//
//  Created by Jose Sanchez Rodriguez on 27/4/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import XCTest
@testable import Money

class BillTests: XCTestCase {
    
    //MARK: - Properties
    let five = Bill(amount: 5)
    let otherFive = Bill(amount: 5)
    let ten = Bill(amount: 10)
    var broker : Broker!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // Se declara el objeto Broker y se añade el factor de conversión de EUR a USD con un ratio de 2
        broker = Broker()
        broker.addRate(from: "EUR", to: "USD", rate: 2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        //broker = Broker()
        //broker.addRate(from: "EUR", to: "USD", rate: 2)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Test que valida que se puede crear una clase Euro
    func testCanCreateMoney() {
        XCTAssertNotNil(Bill())
    }
    
    // Test que valida una multiplicación simple
    func testSimpleMultiplication(){
        let ten = five.times(2)
        XCTAssertEqual(ten._amount, 10)
    }
    
    // Test que comprueba si un objeto Euro es igual a otro objeto Euro
    func testEquality(){
        XCTAssertEqual(otherFive, otherFive)
        XCTAssertEqual(five, otherFive)
        
        XCTAssertNotEqual(five, ten)
    }
    
    // Test que comprueba si un objeto Euro es igual a otro objeto Euro teniendo en cuenta el hashValue
    func testThatObjectWithEqualHashAreEqual(){
        XCTAssertEqual(five.hashValue, otherFive.hashValue)
        XCTAssertNotEqual(ten.hashValue, otherFive.hashValue)
    }
    
    // Test que comprueba si la suma de dos objetos Euro es correcta
    func testSimpleAddition(){
        XCTAssertEqual(ten, five.plus(otherFive))
        XCTAssertNotEqual(ten, ten.plus(otherFive))
    }
    
    // Test que comprueba la reducción de una moneda
    func testSimpleReduction(){
        XCTAssertEqual(try! five.reduced(to: "EUR", broker: broker), five)
    }
}
