//
//  WithdrawalModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/07/19.
//

import UIKit

class WithdrawalModalView: UIView {

    lazy var shadowBackgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    lazy var modalBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "회원 탈퇴"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 104/255, green: 134/255, blue: 254/255, alpha: 1)
    }
    
    lazy var withdrawalCircleImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_WithdrawalImage")
    }
    
    lazy var withdrawalContentLabel = UILabel().then {
        $0.text = "정말 탈퇴하시겠습니까?"
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var okButton = UIButton().then {
        $0.setTitle("네!", for: .normal)
        $0.backgroundColor = UIColor(red: 131/255, green: 120/255, blue: 254/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var noButton = UIButton().then {
        $0.setTitle("아니요!", for: .normal)
        $0.backgroundColor = UIColor(red: 170/255, green: 163/255, blue: 252/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
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
        modalBackgroundView.addSubview(withdrawalCircleImageView)
        modalBackgroundView.addSubview(withdrawalContentLabel)
        modalBackgroundView.addSubview(okButton)
        modalBackgroundView.addSubview(noButton)
    }

}
