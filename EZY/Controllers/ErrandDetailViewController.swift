//
//  ErrandDetailViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/12.
//

import UIKit

class ErrandDetailViewController: UIViewController{
    
    //MARK: - Properties
    lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_ErrandBackButtonImage"), for: .normal)
    }
    
    lazy var errandTitleLabel = UILabel().then {
        $0.text = "마카롱 사오기"
        $0.textColor = UIColor(red: 175/255, green: 173/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var errandLabel = UILabel().then {
        $0.text = "심부름"
        $0.textColor = UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var errandTitleView = UIView().then {
        $0.backgroundColor = UIColor(red: 244/255, green: 246/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    
    lazy var errandTitleQuestionLabel = UILabel().then {
        $0.text = "어떤 심부름을 부탁할까요?"
        $0.textColor = UIColor(red: 128/255, green: 153/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var errandTitleContentTextView = UITextView().then {
        $0.text = "디저트 가게에서 마카롱이랑 크로플이랑 맛있는 빵 사오기"
        $0.textAlignment = .left
        $0.backgroundColor = .clear
        $0.textColor = UIColor(red: 167/255, green: 167/255, blue: 167/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetting()
    }
    
    func layoutSetting() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(backButton)
        self.view.addSubview(errandTitleLabel)
        self.view.addSubview(errandLabel)
        self.view.addSubview(errandTitleView)
        errandTitleView.addSubview(errandTitleQuestionLabel)
        errandTitleView.addSubview(errandTitleContentTextView)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        errandTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/30)
        }
        
        errandLabel.snp.makeConstraints { make in
            make.left.equalTo(errandTitleLabel.snp.right).offset(self.view.frame.width/75)
            make.bottom.equalTo(errandTitleLabel).offset(-self.view.frame.height/160)
        }
        
        errandTitleView.snp.makeConstraints { make in
            make.left.equalTo(errandTitleLabel)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(7.3)
            make.top.equalTo(errandTitleLabel).offset(self.view.frame.height/19.8)
        }
        
        errandTitleQuestionLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(self.view.frame.width/22)
        }
        
        errandTitleContentTextView.snp.makeConstraints { make in
            make.left.equalTo(errandTitleQuestionLabel).offset(-self.view.frame.width/70)
            make.top.equalTo(errandTitleQuestionLabel.snp.bottom).offset(self.view.frame.height/90.2)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(self.view.frame.width/22)
            
        }
    }
}
