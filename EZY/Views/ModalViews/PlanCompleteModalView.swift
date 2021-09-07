//
//  PlanCompleteModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/07/08.
//

import UIKit

class PlanCompleteModalView: UIView {
    
    lazy var shadowBackgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    lazy var modalBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    lazy var okButton = UIButton().then {
        $0.setTitle("네!", for: .normal)
        $0.backgroundColor = UIColor(red: 147/255, green: 145/255, blue: 254/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var cancelButton = UIButton().then {
        $0.setTitle("아니요!", for: .normal)
        $0.backgroundColor = UIColor(red: 223/255, green: 223/255, blue: 223/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var labelView = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var planTitleNameLabel = UILabel().then {
        $0.text = "산책하기"
        $0.textColor = UIColor(red: 104/255, green: 134/255, blue: 254/255, alpha: 1)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var completeQuestionsLabel = UILabel().then {
        $0.text = "일정을 완료할까요?"
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
        modalBackgroundView.addSubview(okButton)
        modalBackgroundView.addSubview(cancelButton)
        modalBackgroundView.addSubview(labelView)
        labelView.addSubview(planTitleNameLabel)
        labelView.addSubview(completeQuestionsLabel)
    }
}
