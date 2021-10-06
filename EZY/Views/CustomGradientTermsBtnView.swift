//
//  CustomGradientTermsBtnView.swift
//  EZY
//
//  Created by 노연주 on 2021/06/24.
//

import UIKit
import SnapKit
import Then

class CustomGradientTermsBtnView : UIButton {
    var title: String? {
        didSet{
            setTitle(title, for: .normal)
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setTitle("가입하기", for: .normal)
        setBackgroundImage(UIImage(named: "EZY_TermsButton"), for: .normal)
        setTitleColor(UIColor.EZY_FFFFFF, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
