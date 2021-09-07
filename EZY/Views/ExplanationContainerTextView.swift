//
//  ExplanationContainerTextView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/09/06.
//

import UIKit

class ExplanationContainerTextView : UIView{
    let view = UIView().then{
        $0.backgroundColor = .EZY_F6F3FF
    }
    let tvTitleLabel = UILabel().then{
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = .EZY_968DFF
    }
    let tv = UITextView().then{
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .EZY_929292
        $0.backgroundColor = .clear
    }
    
    init(tvTitle : String)
    {
        super.init(frame: .zero)
        tvTitleLabel.text = tvTitle
        addSubview(view)
        view.addSubview(tvTitleLabel)
        view.addSubview(tv)
        
    }
    func cornerRadius(){
        view.layer.cornerRadius = frame.height/3.75
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius()
        view.snp.makeConstraints { (make) in
            make.top.right.bottom.left.equalToSuperview()
        }
        tvTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(frame.height/3.75)
            make.left.equalToSuperview().offset(frame.height/3.57)
        }
        tv.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(frame.height/6.25)
            make.bottom.equalToSuperview().inset(frame.height/6.25)
            make.left.equalTo(tvTitleLabel.snp.right).offset(frame.width/12.307)
            make.right.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
