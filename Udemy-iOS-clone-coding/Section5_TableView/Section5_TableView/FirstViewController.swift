//
//  ViewController.swift
//  Section5_TableView
//
//  Created by 김희은 on 10/17/23.
//

import UIKit

protocol ChangeLabelDelegate {
    func doChange()
}
class FirstViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBAction func buttonGoNextVC(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        
        nextVC.PreviousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    var delegate : ChangeLabelDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

