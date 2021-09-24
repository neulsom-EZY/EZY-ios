//
//  SettingTableViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/07.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    static let settingTableViewCellIdentifier = "\(SettingTableViewCell.self)"
    
    private let labelGroup = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let listTitleLabel = UILabel().then {
        $0.textColor = UIColor.rgb(red: 101, green: 101, blue: 101)
        $0.dynamicFont(fontSize: 12.5, currentFontName: "Poppins-Light")
    }
    
    private let listDescriptionLabel = UILabel().then {
        $0.dynamicFont(fontSize: 8, currentFontName: "Poppins-SemiBold")
        $0.textColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1)
    }
    
    private let rightButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_SettingRightButton"), for: .normal)
    }
    
    private let lineView = UIView().then{
        $0.backgroundColor = UIColor.rgb(red: 236, green: 236, blue: 236)
    }
    
    //MARK: - lifeCycles
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
    
    //MARK: - helper
    func configureUI(){

        addview()
        
        layoutSetting()
        
    }
    
    //MARK: - layoutSetting of view
    func layoutSetting(){
        labelGroup.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(contentView.frame.width/7.5)
            make.height.equalToSuperview().dividedBy(2.5)
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
        
        lineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.23)
            make.height.equalTo(0.5)
        }
    }
    
    //MARK: - addSubview
    func addview(){
        contentView.addSubview(rightButton)
        labelGroup.addSubview(listTitleLabel)
        labelGroup.addSubview(listDescriptionLabel)
        contentView.addSubview(labelGroup)
        contentView.addSubview(lineView)
    }

}
