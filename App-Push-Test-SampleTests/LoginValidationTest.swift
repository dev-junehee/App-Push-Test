//
//  LoginValidationTest.swift
//  App-Push-Test-SampleTests
//
//  Created by junehee on 10/11/24.
//

import XCTest
@testable import App_Push_Test

final class LoginValidationTest: XCTestCase {

    // System Under Test: 시스템이 테스트하려는 대상
    var sut: ViewController!
    
    override func setUpWithError() throws {
        // 테스트를 하기 위해 인스턴스 생성 (Storyboard 일 때는 바로 인스턴스화 말고, 스토리보드와 연결된 뷰컨을 함께 가져와주어야 한다.)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        sut = vc
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil   // 테스트 이후에 초기화
    }

    /**
     테스트 함수 코드는 메서드명만 보더라도 어떤 테스트인지 알 수 있게 길고 자세하게 적는 편
     Snake Case 사용 가능
     */
    
    // ID
    /**
     실패 케이스를 테스트 하고싶다면?
     테스트 결과는 무조건 성공으로 나와야 하지만, 실패 케이스에 대한 테스트를 하기.
     즉 실패했다 == 실패 케이스를 성공했다 == 성공했다
    */
    func testViewController_ValidID_ReturnTrue() throws {
        sut.idTextField.text = "junehee@test.com"
        XCTAssertTrue(sut.isValidID(), "@ 없거나 6글자 미만입니다")
    }
    
    func testViewController_ValidID_ReturnFalse() throws {
        sut.idTextField.text = "junehee.test.com"
        XCTAssertFalse(sut.isValidID(), "@ 없어요")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
