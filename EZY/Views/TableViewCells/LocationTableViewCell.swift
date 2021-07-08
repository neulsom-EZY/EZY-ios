//
//  locationTableViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/07/08.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    static let reuseId = "\(LocationTableViewCell.self)"
        
    let alphabetLabelColorArray = [UIColor(red: 232/255, green: 229/255, blue: 255/255, alpha: 1), UIColor(red: 196/255, green: 191/255, blue: 255/255, alpha: 1)]
    
    lazy var alphabetLabel = UILabel().then {
        $0.text = "A"
        $0.dynamicFont(fontSize: 25, currentFontName: "Poppins-Bold")
        $0.updateGradientTextColor_vertical(gradientColors: alphabetLabelColorArray)
    }
    
    lazy var labelView = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var locationTitleNameLabel = UILabel().then {
        $0.text = "광주소프트웨어마이스터고등학교"
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var locationLabel = UILabel().then {
        $0.text = "광주 광산구 상무대로 312"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor(red: 203/255, green: 203/255, blue: 203/255, alpha: 1)
    }
    
    lazy var subLocationLabel = UILabel().then {
        $0.text = "(우) 62423(지번) 송정동 710-3"
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1)
    }
    
    lazy var divideLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
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
        contentView.addSubview(alphabetLabel)
        contentView.addSubview(divideLineView)
        contentView.addSubview(labelView)
        labelView.addSubview(locationTitleNameLabel)
        labelView.addSubview(locationLabel)
        labelView.addSubview(subLocationLabel)
        
        alphabetLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        locationTitleNameLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
        }
        
        locationLabel.snp.makeConstraints { make in
            make.bottom.left.equalToSuperview()
        }
        
        subLocationLabel.snp.makeConstraints { make in
            make.left.equalTo(locationLabel.snp.right).offset(contentView.frame.width/40)
            make.bottom.equalTo(locationLabel)
        }
        
        divideLineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(0.5)
            make.width.equalToSuperview()
        }
        
        labelView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.7)
            make.left.equalTo(alphabetLabel.snp.right).offset(contentView.frame.width/20)
            make.right.equalToSuperview()
        }
    }

}
