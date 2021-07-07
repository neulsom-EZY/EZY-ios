//
//  SelectTimeModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/07/06.
//

import UIKit

class SelectTimeModalView: UIView {

    lazy var backgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    lazy var modalBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    lazy var modalTitleLabel = UILabel().then {
        $0.text = "시간 선택"
        $0.textColor = UIColor(red: 168/255, green: 224/255, blue: 197/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var startMorningLabel = UILabel().then {
        $0.text = "오전"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var startAfternoon = UILabel().then {
        $0.text = "오후"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var endMorningLabel = UILabel().then {
        $0.text = "오전"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var endAfternoon = UILabel().then {
        $0.text = "오후"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var deleteButton = UIButton().then {
        $0.setTitle("삭 제", for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 168/255, green: 224/255, blue: 197/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var startSelectBarView = UIView().then {
        $0.backgroundColor = UIColor(red: 168/255, green: 224/255, blue: 197/255, alpha: 1).withAlphaComponent(0.6)
    }
    
    lazy var endSelectBarView = UIView().then {
        $0.backgroundColor = UIColor(red: 168/255, green: 224/255, blue: 197/255, alpha: 1).withAlphaComponent(0.6)
    }
    
    lazy var startSelectBackButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 168/255, green: 224/255, blue: 197/255, alpha: 1)
    }
    
    lazy var endSelectBackButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 168/255, green: 224/255, blue: 197/255, alpha: 1)
    }
    
    lazy var startSelectCircleButton = UIButton().then {
        $0.backgroundColor = UIColor.white
    }
    
    lazy var endSelectCircleButton = UIButton().then {
        $0.backgroundColor = UIColor.white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutSetting(){
        self.addSubview(backgroundView)
        backgroundView.addSubview(modalBackgroundView)
        modalBackgroundView.addSubview(modalTitleLabel)
        modalBackgroundView.addSubview(deleteButton)
        
        modalBackgroundView.addSubview(endSelectBarView)
        modalBackgroundView.addSubview(endMorningLabel)
        modalBackgroundView.addSubview(endAfternoon)
        modalBackgroundView.addSubview(endSelectBackButton)
        modalBackgroundView.addSubview(endSelectCircleButton)
        
        modalBackgroundView.addSubview(startSelectBarView)
        modalBackgroundView.addSubview(startMorningLabel)
        modalBackgroundView.addSubview(startAfternoon)
        modalBackgroundView.addSubview(startSelectBackButton)
        modalBackgroundView.addSubview(startSelectCircleButton)

    }

}
