//
//  NetworkMockTest.swift
//  App-Push-Test-SampleTests
//
//  Created by junehee on 10/14/24.
//

import XCTest
@testable import App_Push_Test

final class NetworkMockTest: XCTestCase {
    
    var sut: NetworkProvider!

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        sut.fetchLotto { lotto in
            print(lotto)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
