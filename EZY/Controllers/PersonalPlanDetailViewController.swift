//
//  ScheduleDetailViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/08.
//

import UIKit

class PersonalPlanDetailViewController: UIViewController {
    
    var planDeleteModalView = PlanDeleteModalView()
    
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
        $0.image = UIImage(named: "EZY_Location")
    }
    
    lazy var timeIconImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_TimeSquare")
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
        $0.text = "2021. 07. 09 금요일"
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
    
    lazy var explanationContentTextView = UITextView().then {
        $0.text = "송정역 이디야 카페송정역 이디야 카페송정역 이디야 카페송정역 이디야 카페송정역 이디야 카페송정역 이디야 카페송정역 이디야 카페송정역 이디야 카페송정역 이디야 카페송정역 이디야 카페송정역 이디야 카페"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
        $0.backgroundColor = .clear
    }
    
    lazy var tagLabel = UILabel().then {
        $0.text = "태그"
        $0.textColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var tagStudyButton = UIButton().then {
        $0.setTitle("공부", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var planDeleteButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_DeleteButton"), for: .normal)
    }
    
    lazy var planModifyButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_PlanModify"), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSetting()
        
        planDeleteModalViewSetting()
    }
    
    func planDeleteModalViewSetting(){
        self.view.addSubview(planDeleteModalView)
        
        planDeleteModalView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        planDeleteModalView.shadowBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        planDeleteModalView.modalBackgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.1)
            make.height.equalToSuperview().dividedBy(3.59)
            make.centerY.centerX.equalToSuperview()
        }
        
        planDeleteModalView.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        planDeleteModalView.iconCircleBackground.snp.makeConstraints { make in
            make.top.equalTo(planDeleteModalView.titleLabel.snp.bottom).offset(self.view.frame.height/54.1)
            make.centerX.equalToSuperview()
            make.height.equalTo(self.view).dividedBy(15.6)
            make.width.equalTo(planDeleteModalView.iconCircleBackground.snp.height)
            
            planDeleteModalView.iconCircleBackground.layer.cornerRadius = (self.view.frame.height/15.6)/2
        }
        
        planDeleteModalView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2)
        }
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
        self.view.addSubview(explanationBackgroundView)
        self.view.addSubview(tagLabel)
        self.view.addSubview(tagStudyButton)
        self.view.addSubview(planDeleteButton)
        self.view.addSubview(planModifyButton)
        self.timeBackgroundView.addSubview(timeIconImageView)
        self.calendarBackgroundView.addSubview(calendarIconImageView)
        self.locationBackgroundView.addSubview(locationIconImageView)
        explanationBackgroundView.addSubview(explanationTitleLabel)
        explanationBackgroundView.addSubview(explanationContentTextView)
        
        planModifyButton.addTarget(self, action: #selector(planModifyButtonClicked(sender:)), for: .touchUpInside)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        planModifyButton.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.right.equalTo(planDeleteButton.snp.left).offset(-self.view.frame.width/34)
            make.width.height.equalTo(planDeleteButton)
        }
        
        planDeleteButton.snp.makeConstraints { make in
            make.centerY.equalTo(planModifyButton)
            make.right.equalToSuperview().offset(-self.view.frame.width/13.3)
            make.width.equalToSuperview().dividedBy(18.75)
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
            make.height.width.equalToSuperview().dividedBy(2.2)
        }
        
        timeIconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.3)
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
        
        explanationContentTextView.snp.makeConstraints { make in
            make.left.equalTo(explanationTitleLabel.snp.right).offset(self.view.frame.width/40)
            make.top.equalToSuperview().offset(self.view.frame.width/40)
            make.right.equalToSuperview().offset(-self.view.frame.width/17.8)
            make.bottom.equalToSuperview().offset(-self.view.frame.width/20)
        }
        
        tagLabel.snp.makeConstraints { make in
            make.left.equalTo(explanationBackgroundView)
            make.top.equalTo(explanationBackgroundView.snp.bottom).offset(self.view.frame.height/38.6)
        }
        
        tagStudyButton.snp.makeConstraints{ make in
            make.top.equalTo(tagLabel.snp.bottom).offset(self.view.frame.height/47.7)
            make.left.equalTo(tagLabel)
            make.height.equalToSuperview().dividedBy(25.3)
            make.width.equalToSuperview().dividedBy(4.4)
            
            tagStudyButton.layer.cornerRadius = (self.view.frame.height/25.3)/2
        }
        
    }
    
    @objc func planModifyButtonClicked(sender:UIButton){
        let nextViewController = PersonalPlanChangeViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

}
