//
//  PlanRequestRespondingViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/17.
//

import UIKit

class PlanRequestRespondingViewController: UIViewController {
    
    var errandTitle:String = ""
    var errandTime:String = ""
    
    var purpleColor: UIColor! = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    
    var whitePurpleColor: UIColor! = UIColor(red: 227/255, green: 225/255, blue: 255/255, alpha: 1)
    
    lazy var labelColor: [UIColor] = [purpleColor, whitePurpleColor]
    
    lazy var backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_RequestBackButton"), for: .normal)
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "지환님이\n심부름을 부탁하셨어요."
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 27, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = purpleColor
    }
    
    lazy var contentLabel = UILabel().then {
        $0.text = "보여드릴게요!"
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: labelColor)
    }
    
    lazy var planShowView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 6
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    
    lazy var planTitleLabel = UILabel().then {
        $0.text = errandTitle
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 141/255, green: 138/255, blue: 255/255, alpha: 1)
    }
    
    lazy var planCalenderLabel = UILabel().then {
        $0.text = "2021. 05. 09 화요일"
        $0.textAlignment = .center
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "Poppins-Regular")
    }
    
    lazy var planTimeImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_TimeSquare")
    }
    
    lazy var planTimeLabel = UILabel().then {
        $0.text = errandTime
        $0.textAlignment = .center
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "Poppins-Regular")
    }
    
    lazy var planLocationImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_Location")
    }
    
    lazy var planLocationLabel = UILabel().then {
        $0.text = "광주소프트웨어마이스터고등학교"
        $0.textAlignment = .center
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "Poppins-Regular")
    }
    
    lazy var planExplanationView = UIView().then {
        $0.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    lazy var planCalenderImageView = UIImageView().then{
          $0.image = UIImage(named: "EZY_Calendar.svg")
    }
    
    lazy var planExplanationLabel = UILabel().then{
        $0.text = "회의에 꼭 참가해주세요."
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.textAlignment = .center
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    lazy var rejectionButton = UIButton().then{
        $0.setTitle("거 절", for: .normal)
        $0.backgroundColor = .white

        $0.setTitleColor(UIColor(red: 207/255, green: 203/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor(red: 207/255, green: 203/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var acceptButton = UIButton().then {
        $0.setTitle("수 락", for: .normal)
        $0.backgroundColor = UIColor(red: 207/255, green: 203/255, blue: 255/255, alpha: 1)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        layoutSetting()
    }
    
    func layoutSetting(){
        self.view.addSubview(backButton)
        self.view.addSubview(titleLabel)
        self.view.addSubview(contentLabel)
        self.view.addSubview(planShowView)
        self.view.addSubview(rejectionButton)
        self.view.addSubview(acceptButton)
        planShowView.addSubview(planTitleLabel)
        planShowView.addSubview(planTimeImageView)
        planShowView.addSubview(planLocationImageView)
        planShowView.addSubview(planCalenderLabel)
        planShowView.addSubview(planTimeLabel)
        planShowView.addSubview(planLocationLabel)
        planShowView.addSubview(planExplanationView)
        planShowView.addSubview(planCalenderImageView)
        planExplanationView.addSubview(planExplanationLabel)
        
        acceptButton.addTarget(self, action: #selector(acceptButtonClicked(sender:)), for: .touchUpInside)
        rejectionButton.addTarget(self, action: #selector(rejectionButtonClicked(sender:)), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)


        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/30)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(titleLabel.snp.bottom)
        }
        
        planShowView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
            make.width.equalToSuperview().dividedBy(1.2)
            make.top.equalTo(contentLabel.snp.bottom).offset(self.view.frame.height/20)
        }
        
        planTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/18)
        }
        
        planCalenderImageView.snp.makeConstraints { make in
            make.top.equalTo(planTitleLabel.snp.bottom).offset(self.view.frame.height/29)
            make.width.equalToSuperview().dividedBy(17.3)
            make.height.equalTo(planCalenderImageView.snp.width)
            make.centerX.equalToSuperview()
        }
        
        planCalenderLabel.snp.makeConstraints { make in
            make.top.equalTo(planCalenderImageView.snp.bottom).offset(self.view.frame.height/81.2)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        planTimeImageView.snp.makeConstraints { make in
            make.top.equalTo(planCalenderLabel.snp.bottom).offset(self.view.frame.height/29)
            make.width.height.equalTo(planCalenderImageView).multipliedBy(1.2)
            make.centerX.equalToSuperview()
        }
        
        planTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(planTimeImageView.snp.bottom).offset(self.view.frame.height/81.2)
            make.centerX.equalToSuperview()
        }
        
        planLocationImageView.snp.makeConstraints { make in
            make.top.equalTo(planTimeLabel.snp.bottom).offset(self.view.frame.height/29)
            make.width.height.equalTo(planTimeImageView)
            make.centerX.equalToSuperview()
        }
        
        planLocationLabel.snp.makeConstraints { make in
            make.top.equalTo(planLocationImageView.snp.bottom).offset(self.view.frame.height/81.2)
            make.centerX.equalToSuperview()
        }
        
        planExplanationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.height/45)
            make.top.equalTo(planLocationLabel.snp.bottom).offset(self.view.frame.height/45)
            make.bottom.equalToSuperview().offset(-self.view.frame.height/45)
        }
        
        planExplanationLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        rejectionButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/5.2)
            make.width.equalToSuperview().dividedBy(3.75)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(planShowView.snp.bottom).offset(self.view.frame.height/29)
            
            rejectionButton.layer.cornerRadius = (self.view.frame.height/20.3)/2
        }
        
        acceptButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/5.2)
            make.width.equalToSuperview().dividedBy(3.75)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(planShowView.snp.bottom).offset(self.view.frame.height/29)
            
            acceptButton.layer.cornerRadius = (self.view.frame.height/20.3)/2
        }
    }
    
    @objc func acceptButtonClicked(sender:UIButton){
        let notificationVC = NotificationViewController()
        notificationVC.isErrendAccept = true
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rejectionButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}
