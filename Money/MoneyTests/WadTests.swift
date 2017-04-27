//
//  WadTests.swift
//  Money
//
//  Created by Jose Sanchez Rodriguez on 27/4/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import XCTest
@testable import Money

class WadTests: XCTestCase {
    
    //MARK: - Properties
    // Se declara un objeto Wad vacío y un objeto Wad con un amount de 42 para la currency USD
    var emptyWad : Wad = Wad()
    var singleBillWad = Wad(amount: 42, currency: "USD")
    
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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Test que valida que se puede crear una clase Euro
    func testCanCreateWad() {
        XCTAssertNotNil(emptyWad)
        XCTAssertNotNil(singleBillWad)
        
        XCTAssertEqual(emptyWad.billCount , 0)
        XCTAssertEqual(singleBillWad.billCount , 1)
    }
    
    // Test que comprueba si un objeto Bill es igual a otro objeto Bill
    func testEquality(){
        
        // identity
        XCTAssertEqual(emptyWad, emptyWad)
        XCTAssertEqual(singleBillWad, singleBillWad)
        
        XCTAssertNotEqual(emptyWad, singleBillWad)
        
        // equivalence
        let tenEuros = Wad(amount: 10, currency: "EUR")
        let tenDollars = Wad(amount: 10, currency: "USD")
        
        let fifty1 = Wad(amount: 50, currency: "USD")
        let fifty2 = Wad(amount: 10, currency: "EUR").plus(tenEuros).plus(tenDollars).plus(tenDollars).plus(tenEuros)
        let fifty3 = Wad(amount: 30, currency: "EUR").plus(tenDollars).plus(tenEuros)
        
        XCTAssertEqual(fifty1, fifty2)
        XCTAssertEqual(fifty1, fifty3)
        XCTAssertEqual(fifty2, fifty3)
    }
    
    // Test que valida que si suma de dos cantidades de la misma moneda es correcta
    func testSimpleAddition() {
        XCTAssertEqual(singleBillWad.plus(Wad(amount: 8, currency: "USD")), Wad(amount: 50, currency: "USD"))
    }
    
    // Test que valida una multiplicación simple
    func testSimpleMultiplication() {
        let eightyFour = singleBillWad.times(2)
        XCTAssertEqual(eightyFour, Wad(amount: 84, currency: "USD"))
    }
}
