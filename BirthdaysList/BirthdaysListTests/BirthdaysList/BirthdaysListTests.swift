//
//  BirthdaysListTests.swift
//  BirthdaysListTests
//
//  Created by Mohammed Abd El-Aty on 17/02/2022.
//

import XCTest
@testable import BirthdaysList

class BirthdaysListTests: XCTestCase {

    var birthdaysListService: BirthdaysLisServicetMock?

    override func setUpWithError() throws {
        self.birthdaysListService = BirthdaysLisServicetMock(urlString: "test-data")
    }

    override func tearDownWithError() throws {
        self.birthdaysListService = nil
    }

    func testCanDecodeData() {
        let requestExpectation = expectation(description: "Request should finish")

        self.birthdaysListService?.getBirthdaysList() { (result) -> Void in
            switch result {
            case .success(let resultModel):
                XCTAssertTrue(resultModel.results?.count ?? 0 > 0)
                requestExpectation.fulfill()
            case .failure(_): break
            }
        }

        waitForExpectations(timeout: 10, handler: nil)
    }

}
