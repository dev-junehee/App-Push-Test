//
//  ViewController.swift
//  App-Push-Test
//
//  Created by junehee on 10/7/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var pwCheckTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.accessibilityIdentifier = "loginButton"
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
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

