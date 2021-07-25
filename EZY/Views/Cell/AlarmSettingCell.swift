//
//  alarmSettingCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/23.
//

import UIKit

class AlarmSettingCell : UICollectionViewCell{
    static let identifier = "AlarmSettingCell"
    let bglabel = UILabel().then {
        $0.clipsToBounds = true
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bglabel)
        contentView.backgroundColor = .EZY_FDFDFD
        bglabel.textAlignment = .center
        bglabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
