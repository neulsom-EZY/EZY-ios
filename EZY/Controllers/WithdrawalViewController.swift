//
//  WithdrawalViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/13.
//

import UIKit

class WithdrawalViewController: UIViewController {
    
    //MARK: - Properties
    lazy var topView = TopView()
    
    lazy var idNameLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "아이디/닉네임"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var idTextField = UITextField().then {
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.placeholder = "아이디를 입력해주세요"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    lazy var idUnderLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var pwNameLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "비밀번호"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var pwTextField = UITextField().then {
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    lazy var pwUnderLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var withdrawalButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_IdChangeButtonImage"), for: .normal)
        $0.setTitle("탈퇴하기", for: .normal)
        $0.alpha = 0.5
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(withdrawalButtonClicked(sender:)), for: .touchUpInside)
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topViewSetting()
        
        layoutSetting()
    }
    
    @objc func withdrawalButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    func layoutSetting(){
        self.view.backgroundColor = .white
        self.view.addSubview(idNameLabel)
        self.view.addSubview(idTextField)
        self.view.addSubview(idUnderLineView)
        self.view.addSubview(pwNameLabel)
        self.view.addSubview(pwTextField)
        self.view.addSubview(pwUnderLineView)
        self.view.addSubview(withdrawalButton)
                
        idNameLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.titleLabel.snp.bottom).offset(self.view.frame.height/16.91)
            make.left.equalTo(topView.titleLabel)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(idNameLabel.snp.bottom)
            make.left.equalTo(idNameLabel)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(27)
        }
        
        idUnderLineView.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom)
            make.left.equalTo(idTextField)
            make.centerX.equalToSuperview()
            make.height.equalTo(2)
        }
        
        pwNameLabel.snp.makeConstraints { make in
            make.top.equalTo(idUnderLineView.snp.bottom).offset(self.view.frame.height/16.91)
            make.left.equalTo(idUnderLineView)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(pwNameLabel.snp.bottom)
            make.left.equalTo(pwNameLabel)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(27)
        }
        
        pwUnderLineView.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom)
            make.left.equalTo(pwTextField)
            make.centerX.equalToSuperview()
            make.height.equalTo(2)
        }
        
        withdrawalButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(-self.view.frame.height/23.8)
        }
    }
    
    func topViewSetting(){
        self.view.addSubview(topView)
        topView.addSubview(topView.backButton)
        topView.addSubview(topView.titleLabel)
        
        topView.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        
        topView.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "회원 탈퇴", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
        
        topView.backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(topView.backButton.snp.width)
        }
        
        topView.titleLabel.snp.makeConstraints { make in
            make.left.equalTo(topView.backButton)
            make.top.equalTo(topView.backButton.snp.bottom).offset(self.view.frame.height/30)
        }
        
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
    }
}

