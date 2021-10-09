//
//  CalendarAlertBtn.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/10/09.
//

import UIKit

class CalendarAlertBtn : UIButton{
    private let view = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 4, blur: 15, spread: 0)
    }
    private let iconImage = UIImageView()
    private lazy var title = UILabel().then{
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = .EZY_656565
    }
    private lazy var  repeatLabel = UILabel().then{
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
    }
    private let labelView = UIView()
    
    init(icon : UIImage, iconColor : UIColor, titleText: String, repeatText : String){
        super.init(frame: .zero)
        iconImage.image = icon
        iconImage.tintColor = iconColor
        title.text = titleText
        repeatLabel.text = repeatText
        addView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        view.snp.makeConstraints { (make) in
            make.left.equalTo(snp.left)
            make.height.width.equalTo(frame.height)
            make.top.left.equalToSuperview()
        }
        iconImage.snp.makeConstraints { (make) in
            make.height.width.equalTo(frame.height/2)
            make.center.equalTo(view.snp.center)
        }
        labelView.snp.makeConstraints {
            $0.left.equalTo(view.snp.right).offset(frame.height/1.7)
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview()
        }
        title.snp.makeConstraints{
            $0.top.equalTo(labelView)
            $0.left.equalToSuperview()
        }
        repeatLabel.snp.makeConstraints {
            $0.bottom.equalTo(labelView)
            $0.top.equalTo(title.snp.bottom)
            $0.left.equalToSuperview()
        }
    }
    private func addView(){
        addSubview(view)
        view.addSubview(iconImage)
        addSubview(labelView)
        labelView.addSubview(title)
        labelView.addSubview(repeatLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
