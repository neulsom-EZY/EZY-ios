//
//  GroupModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/08.
//

import UIKit

class GroupModalView: UIView {

    //MARK: Properties
    lazy var backgroundView = UIView().then {
        //투명도가 있는 뷰 하위에 추가 되는 뷰에서 투명도 영향 받지 않게하기위해 alpha 대신 사용한다.
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    lazy var groupNameTextField = UITextField().then {
        $0.placeholder = "닉네임을 검색하세요."
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 10)
    }
    
    lazy var textFieldBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    lazy var modalView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
    }
    
    lazy var modalTitleLabel = UILabel().then {
        $0.text = "모달추가"
        $0.textColor = UIColor(red: 255/255, green: 191/255, blue: 191/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var modalButton = UIButton().then {
        $0.setTitle("생 성", for: .normal)
        $0.layer.cornerRadius = 10
        $0.titleLabel?.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")

    }
    
    lazy var groupMemberTitleLabel = UILabel().then {
        $0.text = "그룹원"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    }

    func GroupModalDataSetting(modalTitleText: String, modalColor: UIColor){
        modalTitleLabel.text = modalTitleText
        modalTitleLabel.textColor = modalColor
        modalButton.backgroundColor = modalColor
    }
    
    func GroupModalLayoutSetting(screenHeight: Double, screenWeight: Double){
        backgroundView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
        
        modalView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.3)
            make.height.equalToSuperview().dividedBy(2.3)
            make.top.equalToSuperview().offset(screenHeight/10)
            make.centerX.equalToSuperview()
        }
        
        modalTitleLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(screenHeight/33.8)
        }
        
        modalButton.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview().offset(-screenHeight/33.8)
            make.height.equalTo(33)
            make.width.equalTo(70)
        }
        
        groupMemberTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(modalTitleLabel)
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(screenHeight/45)
        }
        
        textFieldBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(groupMemberTitleLabel)
            make.height.equalTo(38)
            make.top.equalTo(groupMemberTitleLabel.snp.bottom).offset(screenHeight/135.3)
        }
        
        groupNameTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview()
        }
    }

}
