//
//  RegisterViewController.swift
//  Section4_Login
//
//  Created by 김희은 on 10/7/23.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    
    // 유효성검사를 위한 프로퍼티
    // 프로퍼티 옵저버 isValidEmail이라는 곳에서 값을 입력받을 때마다 didset 메소드가 호출됨
    // didset : 세팅이 된 후에 호출
    var isValidEmail = false {
        didSet {
            self.validateUserInfo()
        }
    }
    var isValidName = false{
        didSet {
            self.validateUserInfo()
        }
    }
    var isValidNickName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    var isValidPassword = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    //Button
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var logInButton: UIButton!
    
    //TextFields
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textFields: [UITextField]  {
        [emailTextField, nameTextField, nickNameTextField, passwordTextField]
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField()
        setUpAttribute()
        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    //IBAction을 코드로 사용하여 다르게 구현하는 방식
    @objc
    func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
        case nameTextField:
            self.isValidName = text.count > 2
        case nickNameTextField:
            self.isValidNickName = text.count > 2
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
        default:
            fatalError("Missing TextFieldd...")
        }
    }
    
    // MARK: - Helpers
    //textField와 textfieldEditignChanged를 연결하기 위한 헬퍼
    private func setUpTextField() {
        
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
        
        /*
        emailTextField.addTarget(self, action: #Selector(textFieldEditingChanged(_:)), for: .editingChanged)
        nameTextField.addTarget(self, action: #Selector(textFieldEditingChanged(_:)), for: .editingChanged)
        nickNameTextField.addTarget(self, action: #Selector(textFieldEditingChanged(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #Selector(textFieldEditingChanged(_:)), for: .editingChanged)
        //emailTextfield에서 event가 오면 Target을 누가 처리할 것인지 정해주는 함수
        //RegisterViewController에서 처리할 것, textFieldEditingChanged에메소드 내에서 액션을 처리할 것, 어떠한 이벤트에 대해 처리할 지를 for를 통해 .editingChanged로 만들 것
        */
    }
    
    // 사용자가 입력한 회원정보를 확인하고 -> UI 업데이트
    private func validateUserInfo() {
        if isValidName
            && isValidEmail
            && isValidPassword
            && isValidNickName {
            UIView.animate(withDuration: 0.33){
                self.signUpButton.backgroundColor = UIColor.facebook
            }
        } else {
            UIView.animate(withDuration: 0.33){
                self.signUpButton.backgroundColor = UIColor.disableButton
            }
        }
    }
    
    private func setUpAttribute() {
        //registerButton
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebook
        
        let attributes = generateButtonAttribute(
            self.logInButton,
             texts: text1, text2,
             fonts: font1, font2,
             colors: color1, color2)
        self.logInButton.setAttributedTitle(attributes, for: .normal)
    }
}

// 정규표현식
extension String {
    // password - 대소문자, 특수문자, 숫자 포함 8자 이상일 때 -> True
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    // email - @ 포함 2글자 이상일 때 -> True
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate.init(format: "SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
}

