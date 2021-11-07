//
//  AuthCodeTextFieldView.swift
//  EZY
//
//  Created by 노연주 on 2021/10/30.
//

import UIKit

class AuthCodeTextFieldView: UIView {

    private let putLabel = UILabel().then {
        $0.text = "문자로 전송된 코드 4자리를 입력해주세요!"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-UltraLight")
        $0.textColor = .rgb(red: 106, green: 106, blue: 106)
    }
    
    let tf1 = UITextField().then {
        $0.textColor = .rgb(red: 152, green: 152, blue: 152)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = .rgb(red: 250, green: 250, blue: 250)
        $0.borderStyle = .roundedRect
        $0.textAlignment = .center
    }
    
    let tf2 = UITextField().then {
        $0.textColor = .rgb(red: 152, green: 152, blue: 152)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = .rgb(red: 250, green: 250, blue: 250)
        $0.borderStyle = .roundedRect
        $0.textAlignment = .center
    }
    
    let tf3 = UITextField().then {
        $0.textColor = .rgb(red: 152, green: 152, blue: 152)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = .rgb(red: 250, green: 250, blue: 250)
        $0.borderStyle = .roundedRect
        $0.textAlignment = .center
    }
    
    let tf4 = UITextField().then {
        $0.textColor = .rgb(red: 152, green: 152, blue: 152)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = .rgb(red: 250, green: 250, blue: 250)
        $0.borderStyle = .roundedRect
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    func configureUI(){
        self.addSubview(putLabel)
        self.addSubview(tf1)
        self.addSubview(tf2)
        self.addSubview(tf3)
        self.addSubview(tf4)
        
        putLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        tf1.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(5.10)
            make.height.equalToSuperview().dividedBy(1.72)
        }
        
        tf2.snp.makeConstraints { make in
            make.left.equalTo(tf1.snp.right).offset(16)
            make.bottom.equalToSuperview()
            make.width.equalTo(tf1)
            make.height.equalTo(tf1)
        }

        tf3.snp.makeConstraints { make in
            make.right.equalTo(tf4.snp.left).offset(-16)
            make.bottom.equalToSuperview()
            make.width.equalTo(tf2)
            make.height.equalTo(tf2)
        }
        
        tf4.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(tf3)
            make.height.equalTo(tf3)
        }
    }

}
