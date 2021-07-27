//
//  IdChangeViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/13.
//

import UIKit

class IdChangeViewController: UIViewController {
    
    //MARK: - Properties
    lazy var topView = TopView()
    
    lazy var idNickNameLabel = UILabel().then {
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
    
    lazy var idConditionLabel = UILabel().then {
        $0.text = "8자 이하, 영어 + 숫자최소 1개, 공백 허용x"
        $0.textColor = UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    lazy var changeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_IdChangeButtonImage"), for: .normal)
        $0.setTitle("변경하기", for: .normal)
        $0.alpha = 0.5
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(changeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    //MARK: - LifyCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topViewSetting()
        
        layoutSetting()
    }
    
    @objc func changeButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    func topViewSetting(){
        self.view.addSubview(topView)
        topView.addSubview(topView.backButton)
        topView.addSubview(topView.titleLabel)
        
        topView.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        
        topView.titleLabel.text = "아이디 변경"
        
        topView.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "아이디 변경", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
        
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
    
    func layoutSetting() {
        self.view.backgroundColor = .white
        self.view.addSubview(idNickNameLabel)
        self.view.addSubview(idTextField)
        self.view.addSubview(idUnderLineView)
        self.view.addSubview(idConditionLabel)
        self.view.addSubview(changeButton)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        idNickNameLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.titleLabel.snp.bottom).offset(self.view.frame.height/16.91)
            make.left.equalTo(topView.titleLabel)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(idNickNameLabel.snp.bottom)
            make.left.equalTo(idNickNameLabel)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(27)
        }
        
        idUnderLineView.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom)
            make.left.equalTo(idTextField)
            make.centerX.equalToSuperview()
            make.height.equalTo(2)
        }
        
        idConditionLabel.snp.makeConstraints { make in
            make.top.equalTo(idUnderLineView.snp.bottom).offset(self.view.frame.height/100)
            make.left.equalTo(idUnderLineView)
        }
        
        changeButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(-self.view.frame.height/23.8)
        }
    }
    
    @objc //MARK: 모달 창 올리기
    func keyboardWillShow(_ sender: Notification) {
        changeButton.frame.origin.y = self.view.frame.height/2
    }

    @objc //MARK: 모달 창 원래대로
    func keyboardWillHide(_ sender: Notification) {
        changeButton.frame.origin.y = self.view.frame.height-changeButton.frame.height-self.view.frame.height/23.8
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        idTextField.resignFirstResponder()
    }
}
