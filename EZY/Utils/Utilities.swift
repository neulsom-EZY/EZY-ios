//
//  Utilities.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/02.
//

import UIKit
import SnapKit

class Utilities{
    
    func inputContainerView(withMessage Message:String,textField:UITextField,Color MessageColor: UIColor, ViewSize : Double) -> UIView{
        let view = UIView()
        let Label_Message = UILabel()
        
        view.backgroundColor = MessageColor
        
        
        view.addSubview(Label_Message)
        Label_Message.text = Message
        Label_Message.dynamicFont(fontSize: 14, weight: .bold)
        Label_Message.textColor = .EZY_8099FF
        Label_Message.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(ViewSize)
            make.centerY.equalToSuperview()
        }
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(Label_Message.snp.right)
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    

        return view
    }
    
    func textField(TextColor TC: UIColor,TextSize TS : Int) -> UITextField{
        let tf = UITextField()
        tf.textColor = TC
        tf.font = UIFont.systemFont(ofSize: CGFloat(TS), weight: .medium)
        tf.attributedPlaceholder = NSAttributedString(string: "입력", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return tf
    }
    func textView(TextColor TC: UIColor,TextSize TS : Int) -> UITextView{
        let tv = UITextView()
        tv.textColor = TC
        tv.font = UIFont.systemFont(ofSize: CGFloat(TS), weight: .medium)
        return tv
    }
    
    
    
    func AlertButton(image img: UIImage) -> UIButton{
        let button = UIButton()
        
        button.backgroundColor = .white
        
        button.setImage(img, for: .normal)
        

        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.1
        
        return button
    }
    
    
    
}
