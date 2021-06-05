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
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(screenHeight/30)
            make.left.equalTo(backButton)
        }

        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(screenHeight/13.3)
            make.left.equalToSuperview().offset(20)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
    }
}
