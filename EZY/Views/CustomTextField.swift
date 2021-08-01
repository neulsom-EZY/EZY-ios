//
//  CustomTextField.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/09.
//

import UIKit
class CustomTextField : UITextField {
    
    init(placeholder : String) {
        super.init(frame: .zero)
        
        let spacer = UIView()
//        spacer.setDimensions(height: 50, width: 12)
        spacer.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        leftView = spacer
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        backgroundColor = UIColor.EZY_F5F5F5
//        setHeight(height: 50)
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : UIColor.EZY_6A6A6A])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
