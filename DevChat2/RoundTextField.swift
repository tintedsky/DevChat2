//
//  RoundTextField.swift
//  DevChat2
//
//  Created by Hongbo Niu on 2017-09-30.
//  Copyright © 2017 Udemy. All rights reserved.
//

import UIKit

@IBDesignable
class RoundTextField: UITextField{
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    //bcakgroundColor is an attribute of UITextField itself.
    //Here we use bgColor, and we do not use layer.***
    @IBInspectable var bgColor: UIColor?{
        didSet{
            backgroundColor = bgColor
        }
    }
    
    @IBInspectable var placeholderColor: UIColor?{
        didSet{
            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
            let str = NSAttributedString(string: rawString, attributes: [NSForegroundColorAttributeName:placeholderColor!])
            self.attributedPlaceholder = str
        }
    }
}
