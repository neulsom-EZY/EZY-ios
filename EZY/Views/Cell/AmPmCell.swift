//
//  AmPmCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/01.
//

import UIKit

class AmPmCell : UICollectionViewCell{
    static let identifier = "AmPm"
    let bglabel = UILabel().then {
        $0.clipsToBounds = true
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bglabel)
        
        bglabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
