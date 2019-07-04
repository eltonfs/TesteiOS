//
//  ValidationTextFieldTextTests.swift
//  TesteiOS-ZupTests
//
//  Created by Elton Santana on 03/07/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import XCTest
@testable import TesteiOSZup

class ValidationTextFieldTextTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidationTextFieldInit() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let sut = ValidationTextField(frame: .zero)
        
        XCTAssertNotNil(sut.bottonView, "ClearButton nil")
        XCTAssertNotNil(sut.textField, "TextField nil")
        XCTAssertNotNil(sut.clearButton, "Button nil")
        XCTAssertNotNil(sut.titleLabel, "TitleLabel nil")

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
