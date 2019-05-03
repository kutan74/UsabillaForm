//
//  UsabillaFormValidatorTests.swift
//  UsabillaTests
//
//  Created by KUTAN ÇINGISIZ on 3.05.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import XCTest
@testable import Usabilla

class UsabillaFormValidatorTests: XCTestCase {
    let formValidtor = UsabillaFormValidator()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
    }
    
    func testInvalidFormId() {
        XCTAssertThrowsError(try formValidtor.validateRequestedForm(id: "")) { error in
            XCTAssertEqual(error as! UsabillaError, UsabillaError.noFormIdProvided)
        }
    }
    
    func testInvalidSurveyQuestions() {
        XCTAssertThrowsError(try formValidtor.validateRequestedSurveyForm(for: [])) { error in
            XCTAssertEqual(error as! UsabillaError, UsabillaError.noSurveyQuestionProvided)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
