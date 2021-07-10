//
//  AdditionalButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/06.
//

import UIKit

class AdditionalButton : UIButton{
    let lb = UILabel().then{
        $0.dynamicFont(fontSize: 14, weight: .semibold)
        $0.textColor = .white
    }
    
    var title : String? {
        didSet{
            lb.text = title
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .EZY_BAC8FF
        isEnabled = true
        addSubview(lb)
        lb.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
