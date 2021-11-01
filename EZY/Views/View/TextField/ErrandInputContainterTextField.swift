//
//  ErrandInputContainterTextField.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/20.
//

import UIKit

class ErrandInputContainterTextField : UIView {
    let tf = UITextField()
    let tfTitle = UILabel().then{
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = .rgb(red: 128, green: 153, blue: 255)
    }
    let spacer = UIView()
    init(title : String) {
        super.init(frame: .zero)
        addSubview(tfTitle)
        addSubview(tf)
        backgroundColor = .rgb(red: 244, green: 246, blue: 255)
        tf.textColor = .rgb(red: 167, green: 167, blue: 167)
        tfTitle.text = title
        tf.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/3.8
        tfTitle.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top).offset(frame.height/4)
            make.left.equalToSuperview().offset(frame.height/4.529)
        }
        tf.snp.makeConstraints { (make) in
            make.top.equalTo(tfTitle.snp.bottom).offset(frame.height/8.555)
            make.left.equalTo(tfTitle.snp.left)
            make.right.equalToSuperview().inset(frame.height/4.529)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
