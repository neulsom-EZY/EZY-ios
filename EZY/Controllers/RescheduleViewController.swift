//
//  RescheduleViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/19.
//

import UIKit

class RescheduleViewController: UIViewController {
    
    lazy var topView = TopView()
    
    lazy var calendarView = WhiteBackgroundView()
    
    lazy var timeView = WhiteBackgroundView()
    
    lazy var locationView = WhiteBackgroundView()
    
    lazy var titleBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 244/255, green: 246/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "제목"
        $0.textColor = UIColor(red: 128/255, green: 153/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var titleTextField = UITextField().then {
        $0.text = "강아지 산책 시키기"
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
            
        topViewSetting()
        
        layoutSetting()
        
        calendarViewSetting()
        
        timeViewSetting()
        
        locationViewSetting()
    }
    
    func layoutSetting(){
        self.view.addSubview(titleBackgroundView)
        titleBackgroundView.addSubview(titleLabel)
        titleBackgroundView.addSubview(titleTextField)
        
        titleBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/13.3)
            make.height.equalToSuperview().dividedBy(12)
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/19.8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/17.8)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(titleLabel.snp.right).offset(self.view.frame.width/17.8)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview()
        }
    }

    
    func calendarViewSetting(){
        self.view.addSubview(calendarView)
        calendarView.addSubview(calendarView.backgroundView)
        calendarView.backgroundView.addSubview(calendarView.iconImageView)
        
        calendarView.dataSetting(iconImage: UIImage(named: "EZY_Calendar.svg")!)
        
        calendarView.snp.makeConstraints { make in
            make.top.equalTo(titleBackgroundView.snp.bottom).offset(self.view.frame.height/30)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(calendarView.snp.height)
            make.left.equalTo(titleBackgroundView)
        }
        
        calendarView.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        calendarView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.4)
        }
    }
    
    
    func timeViewSetting(){
        self.view.addSubview(timeView)
        timeView.addSubview(timeView.backgroundView)
        timeView.backgroundView.addSubview(timeView.iconImageView)
        
        timeView.dataSetting(iconImage: UIImage(named: "EZY_TimeSquare.svg")!)
        
        timeView.snp.makeConstraints { make in
            make.top.equalTo(calendarView.snp.bottom).offset(self.view.frame.height/47.7)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(timeView.snp.height)
            make.left.equalTo(calendarView)
        }
        
        timeView.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        timeView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.4)
        }
    }
    
    func locationViewSetting(){
        self.view.addSubview(locationView)
        locationView.addSubview(locationView.backgroundView)
        locationView.backgroundView.addSubview(locationView.iconImageView)
        
        locationView.dataSetting(iconImage: UIImage(named: "EZY_Location.svg")!)
        
        locationView.snp.makeConstraints { make in
            make.top.equalTo(timeView.snp.bottom).offset(self.view.frame.height/47.7)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(timeView.snp.height)
            make.left.equalTo(timeView)
        }
        
        locationView.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        locationView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2)
        }
    }
    
    func topViewSetting() {
        self.view.addSubview(topView)
        topView.addSubview(topView.backButton)
        topView.addSubview(topView.titleLabel)
        
        topView.topViewDataSetting(backButtonImage: UIImage(named: "EZY_SettingBackButton")!, titleLabelText: "나의 할 일 변경",
                                   textColor: UIColor(red: 154/255, green: 174/255, blue: 253/255, alpha: 1))

        topView.topViewLayoutSetting(screenHeight: Double(self.view.bounds.height), screenWeight: Double(self.view.bounds.width))
        
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
    }
}
