//
//  UiView+Extension.swift
//  LoginProject
//
//  Created by 공서은 on 2022/03/29.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius:CGFloat {
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
