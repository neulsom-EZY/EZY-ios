//
//  ChangePhoneNumPutViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/11/08.
//

import UIKit

class ChangePhoneNumPhoneNumViewController: UIViewController {
    //MARK: - Properties
    private let topView = TopView().then{
        $0.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        $0.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "전화번호 변경", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
    }
    
    private let lineInputView = LineInputView().then{
        $0.dataSetting(titleText: "전화번호", placeHolderText: "변경할 전화번호를 입력해주세요", conditionText: "하이픈(-)없이 작성해주세요!")
    }
    
    private let changeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_ChangeButtonImage"), for: .normal)
        $0.setTitle("계속하기", for: .normal)
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
        if isValidPhoneNumber(PhoneNumber: lineInputView.getNickNameText()){
            let nextViewController = ChangePhoneNumAuthCodeViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else{
            lineInputView.checkNickNameIsEmpty()
        }
    }
    
    @objc private func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - isValidPhoneNumber
    private func isValidPhoneNumber(PhoneNumber: String?) -> Bool {
        guard PhoneNumber != nil else { return false }
        
        let idRegEx = "^01([0-9])([0-9]{3,4})([0-9]{4})$"
        let pred = NSPredicate(format:"SELF MATCHES %@", idRegEx)
        return pred.evaluate(with: PhoneNumber)
    }
}
