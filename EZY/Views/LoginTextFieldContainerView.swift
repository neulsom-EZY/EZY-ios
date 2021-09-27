//
//  LoginTextFieldContainerView.swift
//  EZY
//
//  Created by 노연주 on 2021/09/26.
//

import UIKit
import SnapKit
import Then

class LoginTextFieldContainerView: UIView {
    lazy var tfTitle = UILabel().then {
        $0.text = "닉네임"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 150, green: 141, blue: 255)
    }
    
    lazy var tf = UITextField().then {
        $0.placeholder = "닉네임을 입력해주세요."
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = .black
        $0.setPlaceholderColor(.rgb(red: 147, green: 147, blue: 147))
    }
    
    lazy var divView = UIView().then {
        $0.backgroundColor = .rgb(red: 150, green: 141, blue: 255)
    }
    
    
    func loginTfSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        tfTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        tf.snp.makeConstraints { make in
            make.top.equalTo(tfTitle.snp.bottom).offset(screenHeight/81.2)
            make.centerX.equalToSuperview()
            make.width.equalTo(screenWidth/1.37)
            make.height.equalTo(screenHeight/47.76)
        }
        
        divView.snp.makeConstraints { make in
            make.top.equalTo(tf.snp.bottom).offset(screenHeight/81.2)
            make.centerX.equalToSuperview()
            make.width.equalTo(screenWidth/1.34)
            make.height.equalTo(screenHeight/406)
        }
    }
}
