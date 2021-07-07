//
//  ScheduleTypeCollectionViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/02.
//

import UIKit

class ScheduleTypeCollectionViewCell: UICollectionViewCell {
    static let ScheduleTypeCollectionViewIdentifier = "\(ScheduleTypeCollectionViewCell.self)"
    
    let label = UILabel().then{
        $0.text = "나의 할 일"
        $0.textColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    let icon: UIImageView = UIImageView(image: UIImage(named: "EZY_MyJob"))
    
    let circle = UIView().then {
        // circle
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 35/2
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.white.cgColor
        $0.backgroundColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
    }
    
    let mainView = UIView().then {
        $0.layer.cornerRadius = 20
        $0.layer.shadowOpacity = 0.11
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowRadius = 7
        $0.layer.masksToBounds = false
        $0.backgroundColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    func configureUI(){
        
        backgroundColor = .clear
        contentView.addSubview(mainView)
        mainView.addSubview(circle)
        mainView.addSubview(label)
        circle.addSubview(icon)
        
        icon.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2.2)
//            make.width.equalTo(icon.snp.height).dividedBy(1.3)
            make.width.equalTo(icon.snp.height)
        }
        
        mainView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        
        circle.snp.makeConstraints { (make) in
            make.height.width.equalTo(35)
            make.top.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(8)
        }
        
        label.snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.height.equalTo(14)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(20)
        }
    }
}

