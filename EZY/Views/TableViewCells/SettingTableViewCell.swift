//
//  SettingTableViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/07.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    //MARK: Properties
    static let settingTableViewCellIdentifier = "\(SettingTableViewCell.self)"
    
    lazy var cellBackgroundView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.9
        $0.layer.shadowRadius = 8
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
    }
    
    lazy var labelGroup = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var listTitleLabel = UILabel().then {
        $0.text = "그룹 관리"
        $0.textColor = UIColor.rgb(red: 101, green: 101, blue: 101)
        $0.dynamicFont(fontSize: 13, currentFontName: "Poppins-Light")
    }
    
    lazy var listDescriptionLabel = UILabel().then {
        $0.text = "팀 일정의 그룹을 관리합니다."
        $0.dynamicFont(fontSize: 8, currentFontName: "Poppins-SemiBold")
        $0.textColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1)
    }
    
    lazy var rightButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_SettingRightButton"), for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
    
    func configureUI(){
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(rightButton)
        labelGroup.addSubview(listTitleLabel)
        labelGroup.addSubview(listDescriptionLabel)
        cellBackgroundView.addSubview(labelGroup)
        
        labelGroup.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(contentView.frame.width/15.9)
            make.height.equalToSuperview().dividedBy(2)
        }

        cellBackgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.height.equalToSuperview().dividedBy(1.3)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(contentView.frame.width/13.3)
        }
        
        listTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        listDescriptionLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        rightButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-contentView.frame.width/13.8)
            make.height.equalToSuperview().dividedBy(5.25)
            make.width.equalToSuperview().dividedBy(47.11)
        }
        
    }

}
