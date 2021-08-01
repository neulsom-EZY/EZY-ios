//
//  TagDeleteModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/07/22.
//

import UIKit

class TagDeleteModalView: UIView {

    lazy var shadowBackgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    lazy var modalBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "태그 삭제"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 104/255, green: 134/255, blue: 254/255, alpha: 1)
    }
    
    lazy var iconCircleBackground = UIView().then {
        $0.backgroundColor = UIColor(red: 104/255, green: 134/255, blue: 254/255, alpha: 1)
    }
    
    lazy var iconImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_OurJob")
    }
    
    lazy var cancleButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.backgroundColor = UIColor(red: 104/255, green: 134/255, blue: 254/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var deleteButton = UIButton().then {
        $0.setTitle("삭제", for: .normal)
        $0.backgroundColor = UIColor(red: 154/255, green: 174/255, blue: 252/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var labelView = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var tagTitleNameLabel = UILabel().then {
        $0.text = "APP Programming"
        $0.textColor = UIColor(red: 104/255, green: 134/255, blue: 254/255, alpha: 1)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var completeQuestionsLabel = UILabel().then {
        $0.text = "태그를 삭제할까요?"
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
        iconCircleBackground.addSubview(iconImageView)
        modalBackgroundView.addSubview(cancleButton)
        modalBackgroundView.addSubview(deleteButton)
        modalBackgroundView.addSubview(labelView)
        labelView.addSubview(tagTitleNameLabel)
        labelView.addSubview(completeQuestionsLabel)
    }
}
