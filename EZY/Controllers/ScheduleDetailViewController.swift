//
//  ScheduleDetailViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/08.
//

import UIKit

class ScheduleDetailViewController: UIViewController {
    
    lazy var locationBackgroundView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 6
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    
    lazy var timeBackgroundView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 6
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    
    lazy var calendarBackgroundView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 6
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    
    lazy var locationIconImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_Calendar.svg")
    }
    
    lazy var timeIconImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_Calendar.svg")
    }

    lazy var calendarIconImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_Calendar.svg")
    }
    
    lazy var backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_DetailBackButton"), for: .normal)
    }
    
    lazy var planNameLabel = UILabel().then {
        $0.text = "아름이 산책시키기"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "Poppins-SemiBold")
    }
    
    lazy var planTypeLabel = UILabel().then {
        $0.text = "나의 할 일"
        $0.textColor = UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var calendarLabel = UILabel().then {
        $0.text = "2021. 05. 09 화요일"
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 16, currentFontName: "Poppins-Regular")
    }
    
    lazy var timeLabel = UILabel().then {
        $0.text = "11:00AM - 1:00PM"
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 16, currentFontName: "Poppins-Regular")
    }
    
    lazy var locationLabel = UILabel().then {
        $0.text = "송정역 이디야 카페"
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 16, currentFontName: "Poppins-Regular")
    }
    
    lazy var explanationBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 246/255, green: 243/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    
    lazy var explanationTitleLabel = UILabel().then {
        $0.text = "설명"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSetting()
        
    }
    
    func layoutSetting(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(planNameLabel)
        self.view.addSubview(backButton)
        self.view.addSubview(planTypeLabel)
        self.view.addSubview(timeBackgroundView)
        self.view.addSubview(calendarBackgroundView)
        self.view.addSubview(timeBackgroundView)
        self.view.addSubview(locationBackgroundView)
        self.view.addSubview(locationLabel)
        self.view.addSubview(timeLabel)
        self.view.addSubview(calendarLabel)
        self.timeBackgroundView.addSubview(timeIconImageView)
        self.calendarBackgroundView.addSubview(calendarIconImageView)
        self.locationBackgroundView.addSubview(locationIconImageView)
        self.view.addSubview(explanationBackgroundView)
        explanationBackgroundView.addSubview(explanationTitleLabel)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        planNameLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/30)
        }
        
        planTypeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(planNameLabel).offset(-self.view.frame.width/90)
            make.left.equalTo(planNameLabel.snp.right).offset(self.view.frame.width/30)
        }
        
        calendarBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(planNameLabel.snp.bottom).offset(self.view.frame.height/30)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(calendarBackgroundView.snp.height)
            make.left.equalTo(planNameLabel)
        }
        
        timeBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(calendarBackgroundView.snp.bottom).offset(self.view.frame.height/30)
            make.height.width.equalTo(calendarBackgroundView)
            make.left.equalTo(calendarBackgroundView)
        }
        
        locationBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(timeBackgroundView.snp.bottom).offset(self.view.frame.height/30)
            make.height.width.equalTo(timeBackgroundView)
            make.left.equalTo(timeBackgroundView)
        }
        
        calendarLabel.snp.makeConstraints { make in
            make.centerY.equalTo(calendarBackgroundView)
            make.left.equalTo(calendarBackgroundView.snp.right).offset(self.view.frame.width/13.8)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(timeBackgroundView)
            make.left.equalTo(timeBackgroundView.snp.right).offset(self.view.frame.width/13.8)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationBackgroundView)
            make.left.equalTo(locationBackgroundView.snp.right).offset(self.view.frame.width/13.8)
        }
        
        locationIconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.5)
        }
        
        timeIconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.5)
        }
        
        calendarIconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.5)
        }
        
        explanationBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(locationBackgroundView)
            make.height.equalToSuperview().dividedBy(12)
            make.top.equalTo(locationBackgroundView.snp.bottom).offset(self.view.frame.height/30)        }
        
        explanationTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.width/20)
            make.left.equalToSuperview().offset(self.view.frame.width/17.8)
        }
        
    }

}
