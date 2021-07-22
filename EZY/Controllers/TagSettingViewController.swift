//
//  TagSettingViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/22.
//

import UIKit

class TagSettingViewController: UIViewController {
    
    lazy var backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_TagManagementBackButtonImage"), for: .normal)
    }
    
    lazy var mainTitleLabel = UILabel().then {
        $0.text = "태그 설정"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "Poppins-SemiBold")
    }
    
    lazy var tagDeleteButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_DeleteButton"), for: .normal)
    }
    
    lazy var tagNameTitleLabel = UILabel().then {
        $0.text = "태그 이름"
        $0.textColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var tagNameTextField = UITextField().then {
        $0.placeholder = "태그 이름을 입력해주세요"
        $0.text = "APP PROGRAMMING"
        $0.textColor = UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var tagNameTextFieldUnderLineView = UIView().then{
        $0.backgroundColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSetting()
        
    }
    
    func layoutSetting(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(backButton)
        self.view.addSubview(mainTitleLabel)
        self.view.addSubview(tagDeleteButton)
        self.view.addSubview(tagNameTitleLabel)
        self.view.addSubview(tagNameTextField)
        self.view.addSubview(tagNameTextFieldUnderLineView)
        
        backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/50)
        }
        
        tagDeleteButton.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.right.equalToSuperview().offset(-self.view.frame.width/12)
            make.height.width.equalTo(backButton)
        }
        
        tagNameTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(mainTitleLabel)
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(self.view.frame.height/24.6)
        }
        
        tagNameTextField.snp.makeConstraints { make in
            make.left.equalTo(tagNameTitleLabel).offset(self.view.frame.width/30)
            make.centerX.equalToSuperview()
            make.top.equalTo(tagNameTitleLabel.snp.bottom)
            make.height.equalToSuperview().dividedBy(25.3)
        }
        
        tagNameTextFieldUnderLineView.snp.makeConstraints { make in
            make.left.equalTo(tagNameTitleLabel)
            make.centerX.equalToSuperview()
            make.height.equalTo(2)
            make.top.equalTo(tagNameTextField.snp.bottom)
        }
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }

}
