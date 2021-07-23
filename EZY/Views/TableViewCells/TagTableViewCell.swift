//
//  TagTableViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/07/22.
//

import UIKit

class TagTableViewCell: UITableViewCell {
    
    
    static var reuseId = "\(TagTableViewCell.self)"
    
    lazy var tagLabelBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 6
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    
    lazy var tagNameLabel = UILabel().then {
        $0.text = "APP PROGRAMMING"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var tagSettingButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_TagSettingButton"), for: .normal)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        layoutSetting()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        layoutSetting()
    }
    
    func layoutSetting(){        
        self.contentView.addSubview(tagLabelBackgroundView)
        self.contentView.addSubview(tagSettingButton)
        tagLabelBackgroundView.addSubview(tagNameLabel)
        
        
        tagLabelBackgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(1.7)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
//            make.width.equalTo(tagNameLabel).offset(self.contentView.frame.width/20)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        tagSettingButton.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(12)
            make.height.equalToSuperview().dividedBy(20)
        }
        
        tagNameLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }

}
