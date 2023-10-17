//
//  SecondViewController.swift
//  Section5_TableView
//
//  Created by 김희은 on 10/17/23.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate {
    func doChange() {
        PreviousViewController?.label.text = self.textField.text
    }
    
    var PreviousViewController : FirstViewController?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonDismiss(_ sender: Any) {
        doChange() // 화면이 없어짐과 동시에 doChange() 선언
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PreviousViewController?.delegate = self // PreviousViewController의 Delegate를 내가 위임받았음을 전달
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
