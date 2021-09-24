//
//  SelectLocationModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/07/08.
//

import UIKit

class SelectLocationModalView: UIView {
    
    let locationLabelColorArray = [UIColor(red: 131/255, green: 120/255, blue: 255/255, alpha: 1), UIColor(red: 189/255, green: 188/255, blue: 255/255, alpha: 1)]

    lazy var shadowBackgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    lazy var modalBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "위치 선택"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 131/255, green: 120/255, blue: 253/255, alpha: 1)
    }
    
    lazy var iconCircleBackground = UIView().then {
        $0.backgroundColor = UIColor(red: 131/255, green: 120/255, blue: 255/255, alpha: 1)
    }
    
    lazy var iconImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_WhiteLocation")
    }
    
    lazy var okButton = UIButton().then {
        $0.setTitle("네!", for: .normal)
        $0.backgroundColor = UIColor(red: 170/255, green: 163/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var cancelButton = UIButton().then {
        $0.setTitle("아니요!", for: .normal)
        $0.backgroundColor = UIColor(red: 131/255, green: 120/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }

    
    lazy var modalLocationLabel = UILabel().then {
        $0.text = "광주소프트웨어마이스터고등학교"
        $0.updateGradientTextColor_vertical(gradientColors: locationLabelColorArray)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var selectQuestionsLabel = UILabel().then {
        $0.text = "위치를 선택할까요?"
        $0.dynamicFont(fontSize: 15, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutSetting(){
        self.addSubview(shadowBackgroundView)
        shadowBackgroundView.addSubview(modalBackgroundView)
        modalBackgroundView.addSubview(titleLabel)
        modalBackgroundView.addSubview(iconCircleBackground)
        modalBackgroundView.addSubview(okButton)
        modalBackgroundView.addSubview(cancelButton)
        modalBackgroundView.addSubview(modalLocationLabel)
        modalBackgroundView.addSubview(selectQuestionsLabel)
        iconCircleBackground.addSubview(iconImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
}
