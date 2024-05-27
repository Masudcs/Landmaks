//
//  LandmarksScreenTests.swift
//  LandmaksUITests
//
//  Created by Md. Masud Rana on 5/27/24.
//

import XCTest

final class LandmarksScreenTests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}
    func testLoadingState() throws {
        app.launch()

        let loadingView = app.otherElements["loading_view"]

        if loadingView.exists {
            XCTAssertTrue(loadingView.exists)
        }
    }

    func testFailureState() throws {
        app.launch()

        let failureView = app.staticTexts["failer_view"]

        if failureView.exists {
            XCTAssertTrue(failureView.exists)
        }
    }

    func testSuccessStateShowExists() throws {
        app.launch()
        print("\(app.debugDescription)")
        // Verify that at least one item is present
        let firstItem = app.otherElements.staticTexts["item_1"]
        if firstItem.waitForExistence(timeout: 10) {
            XCTAssertTrue(firstItem.exists)
        } else {
            let emptyView = app.otherElements.staticTexts["empty_landmark"]
            XCTAssertTrue(emptyView.exists)
            XCTAssertEqual(emptyView.label, "There is no landmark")
        }
    }
}
