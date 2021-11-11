//
//  GroupModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/08.
//

import UIKit

class GroupAddModalView: UIView {
    
    //MARK: Properties
    lazy var backgroundView = UIView().then {
        //투명도가 있는 뷰 하위에 추가 되는 뷰에서 투명도 영향 받지 않게하기위해 alpha 대신 사용한다.
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    lazy var nickNameTextField = UITextField().then {
        $0.placeholder = "닉네임을 검색하세요."
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var groupNameTextField = UITextField().then {
        $0.placeholder = "그룹명을 입력하세요."
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var nicknameTextFieldBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    lazy var groupNameTextFieldBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    lazy var modalView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
    }
    
    lazy var modalTitleLabel = UILabel().then {
        $0.text = "그룹 추가"
        $0.textColor = UIColor(red: 161/255, green: 180/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var modalButton = UIButton().then {
        $0.setTitle("생 성", for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 161/255, green: 180/255, blue: 255/255, alpha: 1)
        $0.titleLabel?.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var groupMemberTitleLabel = UILabel().then {
        $0.text = "그룹원"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    }
    
    
    lazy var groupNameTitleLabel = UILabel().then {
        $0.text = "그룹명"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    }
    
    lazy var groupModalViewHideButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_UnSelectedNoSelectTagButtonImage"), for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        
        GroupModalLayoutSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func GroupModalDataSetting(modalTitleText: String, modalColor: UIColor){
        modalTitleLabel.text = modalTitleText
        modalTitleLabel.textColor = modalColor
        modalButton.backgroundColor = modalColor
    }
    
    func GroupModalLayoutSetting(){
        self.addSubview(backgroundView)
        backgroundView.addSubview(modalView)
        modalView.addSubview(modalTitleLabel)
        modalView.addSubview(modalButton)
        modalView.addSubview(groupMemberTitleLabel)
        modalView.addSubview(groupNameTitleLabel)
        modalView.addSubview(nicknameTextFieldBackgroundView)
        modalView.addSubview(groupNameTextFieldBackgroundView)
        groupNameTextFieldBackgroundView.addSubview(groupNameTextField)
        nicknameTextFieldBackgroundView.addSubview(nickNameTextField)
        modalView.addSubview(groupModalViewHideButton)

        backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
}

