//
//  TopBarView.swift
//  EZY
//
//  Created by 노연주 on 2021/06/23.
//

import UIKit

class TopBarView: UIView {
    lazy var goBackButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_GoBackBtn"), for: .normal)
    }
    
    lazy var EZY_Logo = UIImageView().then {
        $0.image = UIImage(named: "EZY_LOGOTYPE_2")
    }
    
    func topBarViewLayoutSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        goBackButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(screenHeight/9.12)
            make.left.equalToSuperview().offset(screenWidth/9.14)
            make.height.equalTo(screenHeight/50.75)
            make.width.equalTo(screenWidth/41.67)
        }
        
        EZY_Logo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(screenHeight/10.55)
            make.centerX.equalToSuperview()
            make.height.equalTo(screenHeight/20.3)
            make.width.equalTo(screenWidth/4.46)
        }
    }
}
