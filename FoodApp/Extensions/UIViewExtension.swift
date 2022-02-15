//
//  UIViewExtension.swift
//  FoodApp
//
//  Created by Admin on 2022-02-11.
//

import Foundation
import UIKit

extension UIView{
   @IBInspectable var cornerRadius : CGFloat {
       get {return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
