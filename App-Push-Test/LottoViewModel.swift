//
//  LottoViewModel.swift
//  App-Push-Test
//
//  Created by junehee on 10/14/24.
//

import Foundation


/**
 LottoViewModel 입장에서는 NetworkProvider 내부 구현이 어떻게 되어있는지 모른다.
 fetchLotto 메서드가 있구나 정도만 알 수 있다.
 생성과 사용을 분리. 관심사를 분리한 것!
 NetworkProvider를 태책하고 있는 구현체가 변경되더라도 LottoViewModel에는 영향을 미치지 않는다. 
 */
class LottoViewModel {
    
    private let networkProvider: NetworkProvider
    
    init(networkProvider: NetworkProvider) {
        self.networkProvider = networkProvider
    }
    
    func transform() {
        networkProvider.fetchLotto(completionHandler: <#T##(Lotto) -> Void#>)
    }
    
}




/**
 `의존성 (Dependency)`
 A가 B에 의존한다 == B에서 변화가 생기면 A에도 영향을 미친다
 DI랑 DIP
 DI를 한다고 해서 DIP를 준수하는 거은 안디ㅏ.
 DIP를 구현하는 방법 중 하나로 DI를 사용할 수 있다.
 */

protocol 레시피 {
    func foodA ()
    func foodB()
}

class 휴님 {
    var 식당 = 브랜반점()
    
    init(식당: 브랜반점 = 브랜반점()) {
        self.식당 = 식당
    }
    
    func 밥먹가() {
        식당.점심()
    }
}

class 브랜반점 {
    let 주인장: 레시피 = 브랜님()
    
    func 점심() {
        주인장.foodA()
        주인장.foodB()
    }
}

class 브랜님: 레시피 {
    func foodA() {
        print("음식 A")
    }
    
    func foodB() {
        print("음식 B")
    }
}
