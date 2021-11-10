//
//  PlanCompleteModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/07/08.
//

import UIKit

class PlanCompleteModalView: UIView {
    // MARK: - Properties
    let shadowBackgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    private let modalBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    let okButton = UIButton().then {
        $0.setTitle("네!", for: .normal)
        $0.backgroundColor = UIColor(red: 147/255, green: 145/255, blue: 254/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    let cancelButton = UIButton().then {
        $0.setTitle("아니요!", for: .normal)
        $0.backgroundColor = UIColor(red: 223/255, green: 223/255, blue: 223/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let labelView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let planTitleNameLabel = UILabel().then {
        $0.text = "산책하기"
        $0.textColor = UIColor(red: 104/255, green: 134/255, blue: 254/255, alpha: 1)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let completeQuestionsLabel = UILabel().then {
        $0.text = "일정을 완료할까요?"
        $0.dynamicFont(fontSize: 15, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let viewBounds = UIScreen.main.bounds

    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - helper
    private func configureUI(){
        addView()
        
        location()
    }
    
    // MARK: - addView
    private func addView(){
        self.addSubview(shadowBackgroundView)
        shadowBackgroundView.addSubview(modalBackgroundView)
        modalBackgroundView.addSubview(okButton)
        modalBackgroundView.addSubview(cancelButton)
        modalBackgroundView.addSubview(labelView)
        labelView.addSubview(planTitleNameLabel)
        labelView.addSubview(completeQuestionsLabel)
    }
    
    // MARK: - location
    private func location(){
        shadowBackgroundView.snp.makeConstraints { make in
            make.center.height.width.equalToSuperview()
        }
        
        modalBackgroundView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(6.29)
        }
        
        okButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-viewBounds.width/19.73)
            make.bottom.equalToSuperview().offset(-viewBounds.height/45.11)
            make.height.equalToSuperview().dividedBy(3.9)
            make.width.equalToSuperview().dividedBy(4.44)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.right.equalTo(okButton.snp.left).offset(-viewBounds.width/23.43)
            make.bottom.equalTo(okButton)
            make.height.width.equalTo(okButton)
        }
    }
    
    // MARK: - dataSetting
    private func dataSetting(colorText: String, text: String){
        // 받은 colorText에 글씨 개수에 따라서 layout 결정
        
    }
}
