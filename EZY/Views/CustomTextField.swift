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
        spacer.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        leftView = spacer
        leftViewMode = .always
        
        borderStyle = .none
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
