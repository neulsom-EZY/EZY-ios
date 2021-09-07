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
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    override var isSelected: Bool{
        didSet{
            if isSelected{
                backgroundColor = .EZY_B7B4B4
                bglabel.textColor = .EZY_FDFDFD
            }
            else {
                bglabel.textColor = .EZY_B7B4B4
                backgroundColor = .EZY_FDFDFD
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bglabel)
        bglabel.textAlignment = .center
        bglabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
