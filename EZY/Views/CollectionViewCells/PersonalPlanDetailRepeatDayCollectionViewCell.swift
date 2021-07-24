//
//  RepeatDayCollectionViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/07/24.
//

import UIKit

class PersonalPlanDetailRepeatDayCollectionViewCell: UICollectionViewCell {
    static var reuseId = "\(PersonalPlanDetailRepeatDayCollectionViewCell.self)"
    
    lazy var cellBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 182/255, green: 175/255, blue: 255/255, alpha: 1)
    }
    
    lazy var dayLabel = UILabel().then {
        $0.text = "월"
        $0.textColor = UIColor.white
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    //MARK: LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutSetting()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutSetting()
    }
    
    func layoutSetting(){
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(dayLabel)
        
        cellBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
            
            cellBackgroundView.layer.cornerRadius = contentView.frame.height/2
        }
        
        dayLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
}
