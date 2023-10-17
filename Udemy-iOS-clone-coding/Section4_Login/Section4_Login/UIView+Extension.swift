//
//  UIView+Extension.swift
//  Section4_Login
//
//  Created by 김희은 on 10/14/23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius > newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
