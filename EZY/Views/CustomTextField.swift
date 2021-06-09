//
//  CustomTextField.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/09.
//

import UIKit
import SnapKit
class CustomTextField: UITextField{

    init(placeholder : String) {
        super.init(frame: .zero)
        
        let spacer = UIView()

        leftView = spacer
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .EZY_6A6A6A
        keyboardAppearance = .dark
        backgroundColor = .EZY_F5F5F5
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor.EZY_CACACA])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
