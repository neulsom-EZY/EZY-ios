//
//  TopView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/06.
//

import UIKit

class TopView: UIView {
    
    //MARK: Properties
    lazy var backButton = UIButton()
    lazy var titleLabel = UILabel().then {
        $0.dynamicFont(fontSize: 22, currentFontName: "Poppins-SemiBold")
    }

    func topViewDataSetting(backButtonImage: UIImage, titleLabelText: String, textColor: UIColor){
        backButton.setImage(backButtonImage, for: .normal)
        
        titleLabel.text = titleLabelText
        titleLabel.textColor = textColor
    }
    
    func topViewLayoutSetting(screenHeight: Double, screenWeight: Double){
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(screenHeight/47.7)
            make.left.equalToSuperview().offset(screenWeight/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(screenHeight/30)
        }
    }
}
