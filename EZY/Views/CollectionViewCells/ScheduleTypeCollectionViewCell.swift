//
//  ScheduleTypeCollectionViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/02.
//

import UIKit

class ScheduleTypeCollectionViewCell: UICollectionViewCell {
    static let ScheduleTypeCollectionViewIdentifier = "\(ScheduleTypeCollectionViewCell.self)"
    
    let viewBounds = UIScreen.main.bounds
    
    let planTypeLabel = UILabel().then{
        $0.text = "나의 할 일"
        $0.textColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    let planTypeIconImageView: UIImageView = UIImageView(image: UIImage(named: "EZY_MyJob"))
    
    private let circle = UIView().then {
        $0.layer.masksToBounds = true
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.white.cgColor
        $0.backgroundColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
    }
    
    private let mainView = UIView().then {
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
    
    private func configureUI(){
        addView()
        
        location()

    }
    
    private func addView(){
        backgroundColor = .clear
        contentView.addSubview(mainView)
        mainView.addSubview(circle)
        mainView.addSubview(planTypeLabel)
        circle.addSubview(planTypeIconImageView)
    }
    
    private func location(){
        mainView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        
        circle.snp.makeConstraints { (make) in
            make.height.equalToSuperview().dividedBy(3.71)
            make.width.equalTo(circle.snp.height)
            make.top.equalToSuperview().offset(viewBounds.height/60)
            make.right.equalToSuperview().offset(-viewBounds.height/60)
            
            circle.layer.cornerRadius = viewBounds.height/6.24/3.71/2
        }
        
        planTypeIconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2.2)
            make.width.equalTo(planTypeIconImageView.snp.height)
        }
        
        planTypeLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(viewBounds.height/40)
            make.bottom.equalToSuperview().offset(-viewBounds.height/40)
        }
    }
}

