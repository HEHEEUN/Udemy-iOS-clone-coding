//
//  RegisterViewController.swift
//  Section4_Login
//
//  Created by 김희은 on 10/7/23.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    
    //유효성검사를 위한 프로퍼티
    var isValidEmail = false
    var isValidName = false
    var isValidNickName = false
    var isValidPassword = false
    
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
        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    //IBAction을 코드로 사용하여 다르게 구현하는 방식
    @objc
    func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            print("email")
        case nameTextField:
            print("name")
        case nickNameTextField:
            print("nickName")
        case passwordTextField:
            print("password")
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
}
