//
//  NetworkTest.swift
//  App-Push-Test-SampleTests
//
//  Created by junehee on 10/14/24.
//

import XCTest
@testable import App_Push_Test

final class NetworkTest: XCTestCase {

    // System Under Test
    var sut: NetworkManager!
    
    override func setUpWithError() throws {
        print(#function)
        sut = NetworkManager.shared
    }

    override func tearDownWithError() throws {
        print(#function)
        sut = nil
    }

    // fetchLotto response 중 bonusNo가 1~45 중에 해당하면 성공
    // Unit Test는 동기 테스트에 최적화 -> 비동기를 기다려주지 않는다. -> 비동기 코드는 별도로 작성해줘야 함
    /// `1) Expectation 2) Wait 3) Fulfill`
    
    /// 네트워크 통신이 잘 되는 상황에 대해서만 일관적인 결과가 발생
    /// 통신 자첵 안 되는 상황에서는결과가 달라진다. 즉 외부 환경에 영향을 받고 있다.
    /// 네트워크 통신과 무관한 상태로 테스트 코드를 작성하는 것이 중요하다. >>> `MockData` 사용!
    func test_NetworkManager_ValidBonusNo_ReturnSuccess() throws {
        print(#function)
        print("11111")
        
        
        /// `(1) Expectation`
        let promise = expectation(description: "Lotto Number completion Handler")
        
        sut.fetchLotto { lotto in
            print("22222")
            let value = lotto.bnusNo
            XCTAssertLessThanOrEqual(value, 45, "45보다 작아야 함")
            XCTAssertGreaterThanOrEqual(value, 2, "1 이상이어야 함")
            
            /// `(3) Fulfill`
            /// 정의해둔 expectation이 충족되는 시점에 호출해서 동작이 호출되었고, 마무리해도 된다고 알려줌!
            promise.fulfill()
        }
        
        /// `(2) Wait`
        /// 비동기 작업이 끝날 때까지 기다리지만, timeout 시간이 지나면 실패로 간주한다.
        wait(for: [promise], timeout: 5)
        print("33333")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
