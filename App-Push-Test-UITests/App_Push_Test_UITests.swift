//
//  App_Push_Test_UITests.swift
//  App-Push-Test-UITests
//
//  Created by junehee on 10/11/24.
//

import XCTest

final class App_Push_Test_UITests: XCTestCase {
    
    /// 테스트 시작 전 초기화를 위한 코드
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    /// 테스트가 끝나면 정리해주는 코드
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// 어떤 요소를 테스트할지 작성
    func testLoginExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["IdTextField"].tap()
        app.textFields["IdTextField"].typeText("hello")
        
        app.textFields["PWTextField"].tap()
        app.textFields["PWTextField"].typeText("123456789")
        
        app.textFields["PWCheckTextField"].tap()
        app.textFields["PWCheckTextField"].typeText("123456789")
        
        app.buttons["loginButton"].tap()
        
        // XCTAssertTrue(app.staticTexts["실패"].exists)
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
