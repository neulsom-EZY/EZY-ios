//
//  AddButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/05.
//

import UIKit

class AddButton:UIButton{
    
    var title: String?{
        didSet{
            setTitle(title, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .EZY_BAC8FF.withAlphaComponent(1)
        setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        isEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
