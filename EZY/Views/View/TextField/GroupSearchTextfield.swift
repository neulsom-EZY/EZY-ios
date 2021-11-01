//
//  GroupSearchTextfield.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/08.
//

import UIKit

class GroupSearchTextfield: UITextField {
    let tf = UITextField()
    let spacer = UIView()
    
    init(placeholder : String) {
        super.init(frame: .zero)
        leftView = spacer
        leftViewMode = .always
        borderStyle = .none
        keyboardAppearance = .dark
        backgroundColor = .rgb(red: 245, green: 245, blue: 245)
        textColor = .EZY_656565
        dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 202, green: 202, blue: 202)])
        tf.snp.makeConstraints { (make) in
            make.height.equalTo(frame.height)
            make.width.equalTo(frame.width)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/3.8
        spacer.snp.makeConstraints { (make) in
            make.height.equalTo(frame.height)
            make.width.equalTo(frame.height/2.11)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

