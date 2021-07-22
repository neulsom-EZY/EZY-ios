//
//  CustomTextField.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/01.
//

import UIKit
import SnapKit
import Then
class CustomBtn : UIButton{
    
    var image : UIImage? {
        didSet{
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
