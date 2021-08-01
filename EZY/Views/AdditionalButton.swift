//
//  AdditionalButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/06.
//

import UIKit

class AdditionalButton : UIButton{
    
    var title : String? {
        didSet{
            setTitle(title, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        backgroundColor = .EZY_BAC8FF
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        isEnabled = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
