//
//  PlanRequestRespondingViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/17.
//

import UIKit

class PlanRequestRespondingViewController: UIViewController {
    // MARK: - Properties
    private var errandTitle:String = ""
    
    private var errandTime:String = "11:00AM - 1:00PM"
    
    private let purpleColor: UIColor! = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)

    private let whitePurpleColor: UIColor! = UIColor(red: 227/255, green: 225/255, blue: 255/255, alpha: 1)
    
    private lazy var labelColor: [UIColor] = [purpleColor, whitePurpleColor]
    
    private let backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_RequestBackButton"), for: .normal)
        $0.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "지환님이\n심부름을 부탁하셨어요."
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = purpleColor
    }
    
    private lazy var contentLabel = UILabel().then {
        $0.text = "보여드릴게요!"
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: labelColor)
    }
    
    private let planShowView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 6
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    
    private lazy var planTitleLabel = UILabel().then {
        $0.text = "마카롱 사오기"
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 141/255, green: 138/255, blue: 255/255, alpha: 1)
    }
    
    private let planCalenderLabel = UILabel().then {
        $0.text = "2021. 05. 09 화요일"
        $0.textAlignment = .center
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "Poppins-Regular")
    }
    
    private let planTimeImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_TimeSquare")
    }
    
    private lazy var planTimeLabel = UILabel().then {
        $0.text = "11:00AM - 1:00PM"
        $0.textAlignment = .center
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "Poppins-Regular")
    }
    
    private let planLocationImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_location")
    }
    
    private let planLocationLabel = UILabel().then {
        $0.text = "광주소프트웨어마이스터고등학교"
        $0.textAlignment = .center
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "Poppins-Regular")
    }
    
    private let planExplanationView = UIView().then {
        $0.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    private let planCalenderImageView = UIImageView().then{
          $0.image = UIImage(named: "EZY_Calendar.svg")
    }
    
    private let planExplanationLabel = UILabel().then{
        $0.text = "회의에 꼭 참가해주세요."
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.textAlignment = .center
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    private let rejectionButton = UIButton().then{
        $0.setTitle("거 절", for: .normal)
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(rejectionButtonClicked(sender:)), for: .touchUpInside)
        $0.setTitleColor(UIColor(red: 207/255, green: 203/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor(red: 207/255, green: 203/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let acceptButton = UIButton().then {
        $0.setTitle("수 락", for: .normal)
        $0.backgroundColor = UIColor(red: 207/255, green: 203/255, blue: 255/255, alpha: 1)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(acceptButtonClicked(sender:)), for: .touchUpInside)
    }
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI(){
        self.view.backgroundColor = .white
        
        addView()
        
        location()
    }
    
    private func addView(){
        [backButton, titleLabel, (contentLabel),planShowView, rejectionButton, acceptButton].forEach { view.addSubview($0)}
        [planTitleLabel, planTimeImageView, planLocationImageView, planCalenderLabel, planTimeLabel, planLocationLabel, planExplanationView, planCalenderImageView].forEach { planShowView.addSubview($0) }
        planExplanationView.addSubview(planExplanationLabel)
    }
    
    private func location(){
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
            make.top.equalToSuperview().offset(self.view.frame.height/20)
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
            make.top.equalTo(planLocationLabel.snp.bottom).offset(self.view.frame.height/30)
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
    
    func errandInfoSetting(errandTitle: String, errandTime: String){
        self.errandTitle = errandTitle
        self.errandTime = errandTime
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
