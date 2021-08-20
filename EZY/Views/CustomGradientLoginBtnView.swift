//
//  CustomGradientLoginBtnView.swift
//  EZY
//
//  Created by 노연주 on 2021/06/24.
//

import UIKit
import SnapKit
import Then

class CustomGradientLoginBtnView : UIButton {
    var title: String? {
        didSet{
            setTitle(title, for: .normal)
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setTitle("로그인", for: .normal)
        setBackgroundImage(UIImage(named: "EZY_LoginButtonBackImg"), for: .normal)
        setTitleColor(UIColor.EZY_FFFFFF, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
