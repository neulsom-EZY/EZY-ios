//
//  RepeatSettingsCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/23.
//

import UIKit

class RepeatSettingCell : UICollectionViewCell{
    static let identifier = "RepeatSettingCell"
    let bglabel = UILabel().then {
        $0.clipsToBounds = true
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bglabel)
        contentView.backgroundColor = .clear
        layer.cornerRadius = frame.height/6.4
        bglabel.textAlignment = .center
        
        bglabel.snp.makeConstraints { (make) in
            make.center.equalTo(contentView.snp.center)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
