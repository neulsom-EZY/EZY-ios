//
//  PlanEmptyView.swift
//  EZY
//
//  Created by 김유진 on 2021/11/30.
//

import UIKit

class PlanEmptyView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let emptyImageView = UIImageView().then{ $0.image = UIImage(named: "EZY_EmptyImage") }
    
    private let emptyLabel = UITextView().then{
        $0.isScrollEnabled = false
        $0.isEditable = false
        $0.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        $0.text = "아직 계획이 없네요 !\n가치있는 하루를 위해 계획을 세워보세요"
        $0.textAlignment = .center
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI(){
        self.backgroundColor = .white
        
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [emptyLabel, emptyImageView].forEach { self.addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        emptyImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
            make.width.equalToSuperview().dividedBy(1.4)
        }
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyImageView.snp.bottom).offset(viewBounds.height/33.8)
            make.centerX.equalToSuperview()
        }
    }

}
