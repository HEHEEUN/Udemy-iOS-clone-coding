//
//  ViewController.swift
//  Section4_Login
//
//  Created by 김희은 on 10/7/23.
//

import UIKit

class LoginViewController: UIViewController {

    var email = String()
    var password = String()
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAttribute()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
    }
    
    @IBAction func registerButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        //self.present(registerViewController, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(registerViewController, animated: true)
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

