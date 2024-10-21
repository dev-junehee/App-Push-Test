//
//  ViewController.swift
//  App-Push-Test
//
//  Created by junehee on 10/7/24.
//

import UIKit
import WidgetKit

class ViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var pwCheckTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NetworkManager.shared.fetchLotto { lotto in
        //     print(lotto)
        // }
        loginButton.accessibilityIdentifier = "loginButton"
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        // 그룹으로 연결한 공간에 UD 저장하기
        // UserDefaults(suiteName: "group.com.junehee.test")?.set("mynick", forKey: "nickname")
        // let result = UserDefaults(suiteName: "group.com.junehee.test")?.string(forKey: "nickname")
        // print(result)
        
        // UserDefaults Extension으로 확장하여 사용할 때
        UserDefaults.groupShared.string(forKey: "den")
        
        WidgetCenter.shared.reloadTimelines(ofKind: "FirstWidget")  // 신호를 받아서 무조건 위젯을 업데이트 시키는 함수
        
        
        if isValidID() && isValidPW() && isEqualPW() {
            resultLabel.text = "성공"
        } else {
            resultLabel.text = "실패"
        }
    }

    func isValidID() -> Bool {
        guard let email = idTextField.text else { return false }
        return email.contains("@") && email.count >= 6
    }
    
    func isValidPW() -> Bool {
        guard let password = pwTextField.text else { return false }
        return password.count >= 6 && password.count < 10
    }
    
    func isEqualPW() -> Bool {
        guard let password = pwTextField.text,
              let check = pwCheckTextField.text else { return false }
        return password == check
    }

}

