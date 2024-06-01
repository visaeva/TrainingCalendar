//
//  TrainingCalendarUITests1.swift
//  TrainingCalendarUITests1
//
//  Created by Victoria Isaeva on 01.06.2024.
//

import XCTest

final class TrainingCalendarUITests1: XCTestCase {
    private let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testTapOnFirstDayOfMonth() {
        let app = XCUIApplication()
        let activitiesText = app.staticTexts["Activities"]
        XCTAssertTrue(activitiesText.exists, "Activities on the screen")
    }
    
    func testHorizontalScrollCalendar() {
        let scrollView = app.scrollViews.firstMatch
        XCTAssertTrue(scrollView.exists, "Horizontal scroll")
        scrollView.swipeLeft()
        scrollView.swipeRight()
    }
    
}

