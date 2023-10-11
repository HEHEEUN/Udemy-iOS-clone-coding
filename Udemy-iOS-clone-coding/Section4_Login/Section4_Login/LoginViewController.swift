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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}

