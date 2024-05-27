//
//  LandmaksUnitTests.swift
//  LandmaksUnitTests
//
//  Created by Md. Masud Rana on 5/27/24.
//

@testable import Landmaks
import XCTest

final class LandmaksUnitTests: XCTestCase {
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testFetchLandmarksSuccess() {
        // Given
        let repository = LandmarkRepository()

        // When
        var fetchedLandmarks: [LandmaksResponse]?
        var fetchError: Error?
        do {
            fetchedLandmarks = try repository.fetchLandmarks()
        } catch {
            fetchError = error
        }

        // Then
        XCTAssertNotNil(fetchedLandmarks)
        XCTAssertNil(fetchError)
        XCTAssertFalse(fetchedLandmarks!.isEmpty)
    }
}
