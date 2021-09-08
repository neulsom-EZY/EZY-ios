//
//  PlanDeleteModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/07/09.
//

import UIKit

class PlanDeleteModalView: UIView {

    lazy var shadowBackgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    lazy var modalBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "개인 일정 삭제"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var iconCircleBackground = UIView().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var iconImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_OurJob")
    }
    
    lazy var deleteButton = UIButton().then {
        $0.setTitle("삭 제", for: .normal)
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var cancelButton = UIButton().then {
        $0.setTitle("취 소", for: .normal)
        $0.backgroundColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var labelView = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var planTitleNameLabel = UILabel().then {
        $0.text = "아름이 산책시키기"
        $0.textColor = UIColor(red: 104/255, green: 134/255, blue: 254/255, alpha: 1)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var deleteQuestionsLabel = UILabel().then {
        $0.text = "일정을 삭제할까요?"
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
        modalBackgroundView.addSubview(deleteButton)
        modalBackgroundView.addSubview(cancelButton)
        modalBackgroundView.addSubview(labelView)
        labelView.addSubview(planTitleNameLabel)
        labelView.addSubview(deleteQuestionsLabel)
    }
}
