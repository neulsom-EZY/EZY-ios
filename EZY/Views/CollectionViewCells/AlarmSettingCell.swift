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
                backgroundColor = .rgb(red: 183, green: 180, blue: 180)
                bglabel.textColor = .rgb(red: 253, green: 253, blue: 253)
            }
            else {
                bglabel.textColor = .rgb(red: 183, green: 180, blue: 180)
                backgroundColor = .rgb(red: 253, green: 253, blue: 253)
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
