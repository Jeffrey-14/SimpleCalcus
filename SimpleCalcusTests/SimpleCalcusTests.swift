//
//  SimpleCalcusTests.swift
//  SimpleCalcusTests
//
//  Created by Nana Yaw on 10/26/25.
//

import XCTest
@testable import SimpleCalcus // Import your app module

class SimpleCalcusTests: XCTestCase {
    var calculator: CalculatorLogic!

    override func setUp() {
        super.setUp()
        calculator = CalculatorLogic()
    }

    override func tearDown() {
        calculator = nil
        super.tearDown()
    }

    func testAddition() {
        let result = calculator.add(2.0, 3.0)
        XCTAssertEqual(result, 5.0, accuracy: 0.0001)
    }
    func testAddition1() {
        let result = calculator.add(5.0, 3.0)
        XCTAssertEqual(result, 8.0, accuracy: 0.0001)
    }

    func testSubtraction() {
        let result = calculator.subtract(5.0, 3.0)
        XCTAssertEqual(result, 2.0, accuracy: 0.0001)
    }
    
    func testSubtraction1() {
        let result = calculator.subtract(9.0, 3.0)
        XCTAssertEqual(result, 6.0, accuracy: 0.0001)
    }

    func testMultiplication() {
        let result = calculator.multiply(4.0, 3.0)
        XCTAssertEqual(result, 12.0, accuracy: 0.0001)
    }

    func testDivision() throws {
        let result = try calculator.divide(6.0, 2.0)
        XCTAssertEqual(result, 3.0, accuracy: 0.0001)
    }

    func testDivisionByZero() {
        XCTAssertThrowsError(try calculator.divide(6.0, 0.0)) { error in
            XCTAssertEqual(error.localizedDescription, "Division by zero")
        }
    }
}
