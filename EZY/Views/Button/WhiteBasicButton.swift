//
//  WhiteBasicButton.swift
//  EZY
//
//  Created by 김유진 on 2021/11/13.
//

import UIKit

class WhiteBasicButton: UIButton {
    //MARK: - Properties

    private let ButtonBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.applySketchShadow(color: UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1), alpha: 1, x: 0, y: 3, blur: 15, spread: 0)
        $0.layer.cornerRadius = 10
    }
    
    private let buttonTitleLabel = UILabel().then {
        $0.text = "공부"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    //MARK: - initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - AddSubView
    private func configureUI(){
        addView()
        
        location()
    }
    
    private func addView(){
        addSubview(ButtonBackgroundView)
        ButtonBackgroundView.addSubview(buttonTitleLabel)
    }
    
    private func location(){
        ButtonBackgroundView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalToSuperview()
        }
        
        buttonTitleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func buttonTitleLabelSetting(titleText: String, titleColor: UIColor){
        buttonTitleLabel.text = titleText
        buttonTitleLabel.textColor = titleColor
    }
    
    func getButtonTitle() -> String{
        return buttonTitleLabel.text!
    }
}
