//
//  TitleContainerTextFieldView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/09/06.
//

import UIKit

class TitleContainerTextFieldView : UIView {
    let view = UIView().then{
        $0.backgroundColor = .EZY_F4F6FF
    }
    let tfTitleLabel = UILabel().then{
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = .EZY_8099FF
    }
    
    let tf = UITextField().then{
        $0.textColor = .EZY_656565
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
        $0.backgroundColor = .clear
    }
    
    init(tfTitle : String) {
        super.init(frame: .zero)
        tfTitleLabel.text = tfTitle
        addSubview(view)
        view.addSubview(tfTitleLabel)
        view.addSubview(tf)
    }
    func cornerRadius(){
        view.layer.cornerRadius = frame.height/2.75
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius()
        view.snp.makeConstraints { (make) in
            make.top.right.left.bottom.equalToSuperview()
        }
        tfTitleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(frame.width/15.238)
            make.centerY.equalToSuperview()
        }
        tf.snp.makeConstraints { (make) in
            make.left.equalTo(tfTitleLabel.snp.right).offset(frame.width/12.30769)
            make.right.equalToSuperview().inset(frame.width/26.666)
            make.top.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}
