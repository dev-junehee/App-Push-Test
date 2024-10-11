//
//  UpgradeValidationTest.swift
//  App-Push-Test-SampleTests
//
//  Created by junehee on 10/11/24.
//

import XCTest
@testable import App_Push_Test

final class UpgradeValidationTest: XCTestCase {
    
    var sut: Validator!
    
    var validUser = User(email: "junehee@test.com", password: "123456", check: "123456")
    var invalidUser = User(email: "dd", password: "5", check: "Zz")

    override func setUpWithError() throws {
        sut = Validator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testValidator_ValidID_ReturnTrue() throws {
        let valid = sut.isValidEmail(email: validUser.email)
        XCTAssertTrue(valid)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
