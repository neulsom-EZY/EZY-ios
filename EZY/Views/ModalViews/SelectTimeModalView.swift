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
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var startMorningLabel = UILabel().then {
        $0.text = "오전"
        $0.textColor = UIColor(red: 114/255, green: 114/255, blue: 114/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var startAfternoonLabel = UILabel().then {
        $0.text = "오후"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var endMorningLabel = UILabel().then {
        $0.text = "오전"
        $0.textColor = UIColor(red: 114/255, green: 114/255, blue: 114/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var endAfternoonLabel = UILabel().then {
        $0.text = "오후"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var startHourLabel = UILabel().then{
        $0.text = "시"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var startMinLabel = UILabel().then{
        $0.text = "분"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var endHourLabel = UILabel().then{
        $0.text = "시"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var endMinLabel = UILabel().then{
        $0.text = "분"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var deleteButton = UIButton().then {
        $0.setTitle("삭 제", for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 168/255, green: 224/255, blue: 197/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var startSelectBackButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var endSelectBackButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var startSelectCircleButton = UIButton().then {
        $0.backgroundColor = UIColor.white
    }
    
    lazy var endSelectCircleButton = UIButton().then {
        $0.backgroundColor = UIColor.white
    }
    
    lazy var waveLabel = UILabel().then {
        $0.text = "~"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    }
    
    lazy var completeButton = UIButton().then{
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var startPickerView = UIPickerView().then{
        $0.tintColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var endPickerView = UIPickerView().then{
        $0.tintColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
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
        modalBackgroundView.addSubview(waveLabel)
        modalBackgroundView.addSubview(completeButton)
        
        modalBackgroundView.addSubview(startPickerView)
        modalBackgroundView.addSubview(endPickerView)
        
        modalBackgroundView.addSubview(startHourLabel)
        modalBackgroundView.addSubview(startMinLabel)
        modalBackgroundView.addSubview(endHourLabel)
        modalBackgroundView.addSubview(endMinLabel)
        
        modalBackgroundView.addSubview(endMorningLabel)
        modalBackgroundView.addSubview(endAfternoonLabel)
        modalBackgroundView.addSubview(endSelectBackButton)
        modalBackgroundView.addSubview(endSelectCircleButton)
        
        modalBackgroundView.addSubview(startMorningLabel)
        modalBackgroundView.addSubview(startAfternoonLabel)
        modalBackgroundView.addSubview(startSelectBackButton)
        modalBackgroundView.addSubview(startSelectCircleButton)

    }

}
