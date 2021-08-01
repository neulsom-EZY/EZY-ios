//
//  whiteBackgroundView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/20.
//

import UIKit

class WhiteBackgroundView: UIButton {

    lazy var backgroundView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 6
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    
    lazy var iconImageButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_Calendar.svg"), for: .normal)
    }
    
    
}
