//
//  ErrandDetailViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/12.
//

import UIKit

class ErrandDetailViewController: UIViewController{
    
    //MARK: - Properties
    
    lazy var calendarViewButton = WhiteBackgroundView()
    
    lazy var timeViewButton = WhiteBackgroundView()
    
    lazy var locationViewButton = WhiteBackgroundView()
    
    lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_ErrandBackButtonImage"), for: .normal)
    }
    
    lazy var errandTitleLabel = UILabel().then {
        $0.text = "마카롱 사오기"
        $0.textColor = UIColor(red: 175/255, green: 173/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var errandLabel = UILabel().then {
        $0.text = "심부름"
        $0.textColor = UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var errandTitleView = UIView().then {
        $0.backgroundColor = UIColor(red: 244/255, green: 246/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    
    lazy var errandTitleQuestionLabel = UILabel().then {
        $0.text = "어떤 심부름을 부탁할까요?"
        $0.textColor = UIColor(red: 128/255, green: 153/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var errandTitleContentTextView = UITextView().then {
        $0.text = "디저트 가게에서 마카롱이랑 크로플이랑 맛있는 빵 사오기 디저트 가게에서 마카롱이랑 크로플이랑 맛있는 빵 사오기"
        $0.textAlignment = .left
        $0.backgroundColor = .clear
        $0.textColor = UIColor(red: 167/255, green: 167/255, blue: 167/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
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
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetting()
    }
    
    func layoutSetting() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(backButton)
        self.view.addSubview(errandTitleLabel)
        self.view.addSubview(errandLabel)
        self.view.addSubview(errandTitleView)
        errandTitleView.addSubview(errandTitleQuestionLabel)
        errandTitleView.addSubview(errandTitleContentTextView)
        
        self.view.addSubview(calendarViewButton)
        calendarViewButton.isEnabled = false
        calendarViewButton.addSubview(calendarViewButton.backgroundView)
        calendarViewButton.backgroundView.addSubview(calendarViewButton.iconImageButton)
        
        self.view.addSubview(timeViewButton)
        timeViewButton.isEnabled = false
        timeViewButton.addSubview(timeViewButton.backgroundView)
        timeViewButton.backgroundView.addSubview(timeViewButton.iconImageButton)
        
        self.view.addSubview(locationViewButton)
        locationViewButton.isEnabled = false
        locationViewButton.addSubview(locationViewButton.backgroundView)
        locationViewButton.backgroundView.addSubview(locationViewButton.iconImageButton)
        
        self.view.addSubview(calendarLabel)
        self.view.addSubview(timeLabel)
        self.view.addSubview(locationLabel)
        
        calendarViewButton.dataSetting(iconImage: UIImage(named: "EZY_Calendar.svg")!)
        timeViewButton.dataSetting(iconImage: UIImage(named: "EZY_TimeSquare.svg")!)
        locationViewButton.dataSetting(iconImage: UIImage(named: "EZY_Location.svg")!)

        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        errandTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/30)
        }
        
        errandLabel.snp.makeConstraints { make in
            make.left.equalTo(errandTitleLabel.snp.right).offset(self.view.frame.width/75)
            make.bottom.equalTo(errandTitleLabel).offset(-self.view.frame.height/160)
        }
        
        errandTitleView.snp.makeConstraints { make in
            make.left.equalTo(errandTitleLabel)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(7.3)
            make.top.equalTo(errandTitleLabel).offset(self.view.frame.height/19.8)
        }
        
        errandTitleQuestionLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(self.view.frame.width/22)
        }
        
        errandTitleContentTextView.snp.makeConstraints { make in
            make.left.equalTo(errandTitleQuestionLabel).offset(-self.view.frame.width/70)
            make.top.equalTo(errandTitleQuestionLabel.snp.bottom).offset(self.view.frame.height/90.2)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(self.view.frame.width/22)
        }
        
        calendarViewButton.snp.makeConstraints { make in
            make.top.equalTo(errandTitleView.snp.bottom).offset(self.view.frame.height/30)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(calendarViewButton.snp.height)
            make.left.equalTo(errandTitleView)
        }
        
        calendarViewButton.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        calendarViewButton.iconImageButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.4)
        }
        
        timeViewButton.snp.makeConstraints { make in
            make.top.equalTo(calendarViewButton.snp.bottom).offset(self.view.frame.height/47.7)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(timeViewButton.snp.height)
            make.left.equalTo(calendarViewButton)
        }
        
        timeViewButton.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        timeViewButton.iconImageButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.4)
        }
        
        locationViewButton.snp.makeConstraints { make in
            make.top.equalTo(timeViewButton.snp.bottom).offset(self.view.frame.height/47.7)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(timeViewButton.snp.height)
            make.left.equalTo(timeViewButton)
        }
        
        locationViewButton.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        locationViewButton.iconImageButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2)
        }
        
        calendarLabel.snp.makeConstraints { make in
            make.centerY.equalTo(calendarViewButton)
            make.left.equalTo(calendarViewButton.snp.right).offset(self.view.frame.width/13.8)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(timeViewButton)
            make.left.equalTo(timeViewButton.snp.right).offset(self.view.frame.width/13.8)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationViewButton)
            make.left.equalTo(locationViewButton.snp.right).offset(self.view.frame.width/13.8)
        }
    }
}
