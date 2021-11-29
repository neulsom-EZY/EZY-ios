//
//  LogOutAlertView.swift
//  EZY
//
//  Created by 노연주 on 2021/11/29.
//

import UIKit

class LogOutAlterView: UIView {
    
    private let logoutLabel = UILabel().then {
        $0.text = "정말 로그아웃하시겠습니까?"
        $0.textColor = .rgb(red: 101, green: 101, blue: 101)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let okButton = UIButton().then {
        $0.setTitle("네", for: .normal)
        $0.backgroundColor = .rgb(red: 131, green: 120, blue: 255)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let noButton = UIButton().then {
        $0.setTitle("아니요!", for: .normal)
        $0.backgroundColor = .rgb(red: 170, green: 163, blue: 255)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutSetting(){
        self.addSubview(logoutLabel)
        self.addSubview(okButton)
        self.addSubview(noButton)
    }

}
