//
//  CustomTextField.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/01.
//

import UIKit

class CustomButton : UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let view = UIView()
        let image = UIImage()
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 1.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowRadius = 10
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
