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
}
