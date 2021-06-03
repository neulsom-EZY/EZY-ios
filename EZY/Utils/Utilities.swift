//
//  Utilities.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/02.
//

import UIKit
import SnapKit

class Utilities{
    
    func inputContainerView(withMessage Message:String,textField:UITextField,Color MessageColor: UIColor) -> UIView{
        let view = UIView()
        let Label_Message = UILabel()
        
        view.backgroundColor = MessageColor
        view.layer.cornerRadius = 20
        
        view.addSubview(Label_Message)
        Label_Message.text = Message
        Label_Message.dynamicFont(fontSize: 14, weight: .bold)
        Label_Message.textColor = .EZY_8099FF
        Label_Message.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(20)
            make.centerY.equalToSuperview()
        }
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(Label_Message.safeAreaLayoutGuide.snp.right)
            make.right.equalTo(view.snp.right)
            make.centerY.equalToSuperview()
            
        }

        return view
    }
    
    func textField(TextColor TC: UIColor,TextSize TS : Int) -> UITextField{
        let tf = UITextField()
        tf.textColor = TC
        tf.font = UIFont.systemFont(ofSize: CGFloat(TS), weight: .medium)
        return tf
    }
    func textView(TextColor TC: UIColor,TextSize TS : Int) -> UITextView{
        let tv = UITextView()
        tv.textColor = TC
        tv.font = UIFont.systemFont(ofSize: CGFloat(TS), weight: .medium)
        return tv
    }

}
