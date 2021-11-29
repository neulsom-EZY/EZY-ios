//
//  TopView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/06.
//

import UIKit

class TopView: UIView {
    // MARK: - Properties
    let backButton = UIButton()
    
    private let viewBounds = UIScreen.main.bounds
    
    private let titleLabel = UILabel().then {
        $0.dynamicFont(fontSize: 22, currentFontName: "Poppins-SemiBold")
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
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [backButton, titleLabel].forEach { self.addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(viewBounds.height/47.7)
            make.left.equalToSuperview().offset(viewBounds.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(viewBounds.height/30)
        }
    }

    // MARK: - topViewDataSetting
    func topViewDataSetting(backButtonImage: UIImage, titleLabelText: String, textColor: UIColor){
        backButton.setImage(backButtonImage, for: .normal)
        titleLabel.text = titleLabelText
        titleLabel.textColor = textColor
    }
}
