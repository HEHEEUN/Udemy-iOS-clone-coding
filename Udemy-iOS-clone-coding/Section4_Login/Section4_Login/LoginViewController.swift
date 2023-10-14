//
//  ViewController.swift
//  Section4_Login
//
//  Created by 김희은 on 10/7/23.
//

import UIKit

class LoginViewController: UIViewController {
    var userInfo: UserInfo?

    var email = String()
    var password = String()
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAttribute()
    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.logInButton.backgroundColor = text.count > 2 ? UIColor.facebook : UIColor.disableButton
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
        // 회원가입 정보를 전달받아서
        //그것과 textField 데이터가 일치하면(로그인 위해 입력한)
        //로그인이 되어야 함
        guard let userInfo = self.userInfo else { return }
        
        if userInfo.email ==  self.email
            && userInfo.password == self.password {
            print("로그인 성공")
            //let vc = storyboard?.instantiateViewController(withIdentifier: "TestVC") as! TestViewController
            //self.present(vc, animated: true, completion: nil)
        }
        else { print("로그인 실패")}
    }
    
    @IBAction func registerButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        //self.present(registerViewController, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        
        // ARC - 강한 참조 / 약한 참조 -> ARC 낯춰줌
        registerViewController.userInfo = { [weak self] (userInfo) in self?.userInfo = userInfo
        }
    }
    
    private func setUpAttribute() {
        //registerButton
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebook
        
        let attributes = generateButtonAttribute(
            self.registerButton,
             texts: text1, text2,
             fonts: font1, font2,
             colors: color1, color2)
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
}

