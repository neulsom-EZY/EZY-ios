//
//  ChangePasswardWritePasswardViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/11/19.
//

import UIKit

class ChangePasswordPasswordAfterLoginViewController: UIViewController{
    //MARK: - Properties
    private let topView = TopView().then{
        $0.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        $0.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "비밀번호 변경", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
    }
    
    private let lineInputView = LineInputView().then{
        $0.dataSetting(titleText: "비밀번호", placeHolderText: "비밀번호를 입력해주세요", conditionText: "영어 숫자 조합 8자 이상, 특수문자 가능, 공백 허용x")
    }
    
    private let changeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_ChangeButtonImage"), for: .normal)
        $0.setTitle("비밀번호 변경하기", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(changeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    //MARK: - LifyCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        self.view.backgroundColor = .white
        [topView, lineInputView, changeButton].forEach { self.view.addSubview($0) }
    }
    
    // MARK: - location
    private func location() {
        lineInputView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/17.65)
            make.height.equalToSuperview().dividedBy(13)
            make.centerX.equalToSuperview()
        }
        
        changeButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(-self.view.frame.height/23.8)
        }
        
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
    }
    
    // MARK: - Selectors
    @objc private func changeButtonClicked(sender:UIButton){
        if isValidPassword(Password: lineInputView.getNickNameText()) == true{
            let vc = SettingViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }else{
            lineInputView.checkNickNameIsEmpty()
        }
    }
    
    @objc private func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - isValidPassword
    private func isValidPassword(Password: String?) -> Bool {
        guard Password != nil else { return false }
            
        let PasswordRegEx = ("(?=.*[A-Za-z~!@#$%^&*])(?=.*[0-9]).{8,}")
        let pred = NSPredicate(format:"SELF MATCHES %@", PasswordRegEx)
        return pred.evaluate(with: Password)
    }
}
