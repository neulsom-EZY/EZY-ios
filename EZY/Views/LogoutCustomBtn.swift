//
//  LogoutCustomBtn.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/10/28.
//

import UIKit

class LogoutCustomBtn : UIButton{
    //MARK: - Properties
    private let logoutIv = UIImageView(image: UIImage(named: "EZY_Fast_car")).then{
        $0.contentMode = .scaleAspectFit
    }
    private let logoutLabel = UILabel().then{
        $0.text = "로그아웃하기"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
    }
    //MARK: - initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 4, blur: 15, spread: 0)
        layer.cornerRadius = 10
        backgroundColor = .white
        addView()
    }
    //MARK: - Required Coder initializer
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - AddSubView
    private func addView(){
        addSubview(logoutIv)
        addSubview(logoutLabel)
    }
    //MARK: - layoutSubView
    override func layoutSubviews() {
        super.layoutSubviews()

        logoutIv.snp.makeConstraints{
            $0.top.equalToSuperview().inset(bounds.height/7.09)
            $0.height.equalTo(bounds.height/2.025)
            $0.left.right.equalToSuperview().inset(bounds.width/3.5)
        }
        logoutLabel.snp.makeConstraints {
            $0.top.equalTo(logoutIv.snp.bottom).offset(bounds.height/7.23)
            $0.centerX.equalToSuperview()
        }
    }

}
