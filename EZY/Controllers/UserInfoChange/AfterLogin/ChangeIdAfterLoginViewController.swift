//
//  IdChangeViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/13.
//

import UIKit

class ChangeIdAfterLoginViewController: UIViewController {
    
    // MARK: - Properties
    private let topView = TopView().then{
        $0.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        $0.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "닉네임 변경", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
    }
    
    private let lineInputView = LineInputView().then{
        $0.dataSetting(titleText: "닉네임", placeHolderText: "닉네임을 입력해주세요", conditionText: "1 ~ 10자 사이 영어로 작성해주세요!")
    }
    
    private let changeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_ChangeButtonImage"), for: .normal)
        $0.setTitle("닉네임 변경하기", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(changeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    // MARK: - LifyCycle
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
            make.centerY.equalToSuperview().offset(self.view.frame.height/40)
        }
        
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
    }
    
    // MARK: - Selectors
    @objc private func changeButtonClicked(sender:UIButton){
        if isValidId(id: lineInputView.getInfoText()) == true{
            navigationController?.popViewController(animated: true)
        }else{
            lineInputView.checkInfoTextIsEmpty()
        }
    }
    
    @objc private func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - isValidId
    private func isValidId(id: String?) -> Bool {
        guard id != nil else { return false }
        
        let idRegEx = "[A-Za-z]{1,10}"
        let pred = NSPredicate(format:"SELF MATCHES %@", idRegEx)
        return pred.evaluate(with: id)
    }
}
