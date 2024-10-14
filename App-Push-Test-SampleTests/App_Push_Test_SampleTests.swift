//
//  App_Push_Test_SampleTests.swift
//  App-Push-Test-SampleTests
//
//  Created by junehee on 10/11/24.
//

import XCTest

final class App_Push_Test_SampleTests: XCTestCase {
    
    var number = 3
    
    /// 초기 세팅을 늘 처음처럼 맞춰주는 작업을 진행
    /// 테스트를 계속 일관적인 상태로 유지해주기 위함!
    override func setUpWithError() throws {
        print("SetUp")
    }
    
    override func tearDownWithError() throws {
        print("TearDown")
    }
    
    /**
     TDD: 테스트 주도 개발
     BDD: 행동 주도 개발
     
     Given: 제공해주고 있는 환경
     When: 메서드
     Then: 기대 결과
     */
    func testExample() throws {
        print("Test Example")
        let a = 2
        let b = 2
        
        number = 4
        
        XCTAssertEqual(a + b, number, "덧셈 실수했어!")
    }
    
    func testMinusExample() {
        print("testMinusExample")
        
        let a = 5
        let b = 2
        
        XCTAssertEqual(a - b, number)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
