//
//  UsabillaExamplesUITests.swift
//  UsabillaExamplesUITests
//
//  Created by KUTAN ÇINGISIZ on 3.05.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import XCTest

class UsabillaExamplesUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFeedBackForm() {
        app.launch()
        app.buttons["feedBackButton"].tap()
        
        XCTAssertTrue(app.isDisplayingFormViewController)
        XCTAssertTrue(app.isDisplayingFormView)
        XCTAssertTrue(app.isDisplayingFeedBackView)
        
        // Tap the "Done" button
        app.buttons["Done"].tap()
        
        // Form should no longer be visible
        XCTAssertFalse(app.isDisplayingFormViewController)
        XCTAssertFalse(app.isDisplayingFormView)
        XCTAssertFalse(app.isDisplayingFeedBackView)
    }
    
    func testRatingForm() {
        app.launch()
        app.buttons["ratingButton"].tap()
        
        XCTAssertTrue(app.isDisplayingFormViewController)
        XCTAssertTrue(app.isDisplayingFormView)
        XCTAssertTrue(app.isDisplayingRatingView)
        
        // Tap the "Done" button
        app.buttons["sendButton"].tap()
        
        // Form should no longer be visible
        XCTAssertFalse(app.isDisplayingFormViewController)
        XCTAssertFalse(app.isDisplayingFormView)
        XCTAssertFalse(app.isDisplayingRatingView)
    }
    
    func testSurvey() {
        app.launch()
        app.buttons["surveyButton"].tap()
        
        XCTAssertTrue(app.isDisplayingSurvey)
        XCTAssertTrue(app.isDisplayingSurveyTableView)
        XCTAssertTrue(app.isDisplayingSurveyTableViewCells)
        
        // Tap the "Submit" button
        app.buttons["submit"].tap()
        
        // Form should no longer be visible
        XCTAssertFalse(app.isDisplayingSurvey)
        XCTAssertFalse(app.isDisplayingSurveyTableView)
    }
}

extension XCUIApplication {
    var isDisplayingFormViewController: Bool {
        return otherElements["formViewController"].exists
    }
    
    var isDisplayingFormView: Bool {
        return otherElements["formView"].exists
    }
    
    var isDisplayingFeedBackView: Bool {
        return otherElements["feedBackView"].exists
    }
    
    var isDisplayingRatingView: Bool {
        return otherElements["ratingView"].exists
    }
    
    var isDisplayingSurvey: Bool {
        return otherElements["surveyViewController"].exists
    }
    
    var isDisplayingSurveyTableView: Bool {
        return tables["surveyTableView"].exists
    }
    
    var isDisplayingSurveyTableViewCells: Bool {
        return tables["surveyTableView"].cells.element(matching: .cell, identifier: "tableViewCell").exists
    }
}
