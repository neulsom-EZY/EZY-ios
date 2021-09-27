//
//  SelectTimeModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/07/06.
//

import UIKit

class SelectTimeModalView: UIView {
    //MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
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
        $0.setTitle("완 료", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var startPickerView = UIPickerView().then{
        $0.tintColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.backgroundColor = .lightGray
    }
    
    lazy var endPickerView = UIPickerView().then{
        $0.tintColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.backgroundColor = .lightGray
    }
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contigureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - helpers
    func contigureUI(){
        addView()

        addLayout()
    }
    
    //MARK: - addLayout
    func addLayout(){
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        modalBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.13)
            make.height.equalToSuperview().dividedBy(3.04)
        }
        
        modalTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(viewBounds.width/15.62)
            make.top.equalToSuperview().offset(viewBounds.height/33.83)
        }
        
        startMorningLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(viewBounds.width/7.97)
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(viewBounds.height/31.23)
        }
        
        startSelectBackButton.snp.makeConstraints { make in
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(viewBounds.height/31.23)
            make.height.equalToSuperview().dividedBy(20.53)
            make.width.equalToSuperview().dividedBy(12.69)
            make.left.equalTo(startMorningLabel.snp.right).offset(viewBounds.width/38.33)
            
            startSelectBackButton.layer.cornerRadius = viewBounds.height/3.04/20.53/2
        }
        
        startSelectCircleButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(viewBounds.width/290)
            make.height.equalToSuperview().dividedBy(1.2)
            make.width.equalTo(startSelectBackButton.snp.height).dividedBy(1.2)
            
            startSelectCircleButton.layer.cornerRadius = viewBounds.height/3.04/20.53/1.2/2
        }
        
        startAfternoonLabel.snp.makeConstraints { make in
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(viewBounds.height/31.23)
            make.left.equalTo(startSelectBackButton.snp.right).offset(viewBounds.width/38.33)
        }
        
        endAfternoonLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-viewBounds.width/7.97)
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(viewBounds.height/31.23)
        }
        
        endSelectBackButton.snp.makeConstraints { make in
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(viewBounds.height/31.23)
            make.height.equalToSuperview().dividedBy(20.53)
            make.width.equalToSuperview().dividedBy(12.69)
            make.right.equalTo(endAfternoonLabel.snp.left).offset(-viewBounds.width/38.33)
            
            endSelectBackButton.layer.cornerRadius = viewBounds.height/3.04/20.53/2
        }
        
        endSelectCircleButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(viewBounds.width/290)
            make.height.equalToSuperview().dividedBy(1.2)
            make.width.equalTo(endSelectBackButton.snp.height).dividedBy(1.2)
            
            endSelectCircleButton.layer.cornerRadius = viewBounds.height/3.04/20.53/1.2/2
        }
        
        endMorningLabel.snp.makeConstraints { make in
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(viewBounds.height/31.23)
            make.right.equalTo(endSelectBackButton.snp.left).offset(-viewBounds.width/38.33)
        }
        
        startPickerView.snp.makeConstraints { make in
            make.centerX.equalTo(startSelectBackButton)
            make.width.equalToSuperview().dividedBy(5.89)
            make.height.equalToSuperview().dividedBy(2.64)
            make.top.equalTo(startMorningLabel.snp.bottom).offset(viewBounds.height/42.73)
        }
        
        endPickerView.snp.makeConstraints { make in
            make.centerX.equalTo(endSelectBackButton)
            make.width.equalToSuperview().dividedBy(5.89)
            make.height.equalToSuperview().dividedBy(2.64)
            make.top.equalTo(endMorningLabel.snp.bottom).offset(viewBounds.height/42.73)
        }
        
        completeButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-viewBounds.width/13.2)
            make.top.equalTo(endPickerView.snp.bottom).offset(viewBounds.height/58)
            make.width.equalToSuperview().dividedBy(4.71)
            make.height.equalToSuperview().dividedBy(8.09)
        }
    }
    
    //MARK: - addView
    func addView(){
        self.addSubview(backgroundView)
        backgroundView.addSubview(modalBackgroundView)
        modalBackgroundView.addSubview(modalTitleLabel)
        modalBackgroundView.addSubview(completeButton)
        modalBackgroundView.addSubview(waveLabel)
        modalBackgroundView.addSubview(completeButton)
        
        modalBackgroundView.addSubview(startMorningLabel)
        modalBackgroundView.addSubview(startAfternoonLabel)
        modalBackgroundView.addSubview(startSelectBackButton)
        startSelectBackButton.addSubview(startSelectCircleButton)
        
        modalBackgroundView.addSubview(endMorningLabel)
        modalBackgroundView.addSubview(endAfternoonLabel)
        modalBackgroundView.addSubview(endSelectBackButton)
        endSelectBackButton.addSubview(endSelectCircleButton)
        
        modalBackgroundView.addSubview(startPickerView)
        modalBackgroundView.addSubview(endPickerView)
        
        modalBackgroundView.addSubview(startHourLabel)
        modalBackgroundView.addSubview(startMinLabel)
        modalBackgroundView.addSubview(endHourLabel)
        modalBackgroundView.addSubview(endMinLabel)
    }
}
