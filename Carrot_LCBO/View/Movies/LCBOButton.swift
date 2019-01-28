//
//  LCBOButton.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 25/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit

@IBDesignable

class LCBOButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension UIView{
    
    @IBInspectable var borderColor : UIColor{
        get {
            let color = self.layer.borderColor ?? UIColor.white.cgColor
            return UIColor(cgColor: color)
        }
        
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat{
        get {
            return self.layer.borderWidth
        }
        
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat{
        get {
            return self.layer.cornerRadius
        }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}
