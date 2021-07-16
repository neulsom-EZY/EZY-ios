//
//  Utilities.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/02.
//

import UIKit
import SnapKit

class Utilities{
    
    func inputContainerView(withMessage message:String,textField:UITextField,color messageColor: UIColor, viewSize : Double) -> UIView{
        let view = UIView()
        let label_Message = UILabel()
        
        view.backgroundColor = messageColor
        
        view.addSubview(label_Message)
        label_Message.text = message
        label_Message.dynamicFont(fontSize: 14, weight: .bold)
        label_Message.textColor = .EZY_8099FF
        label_Message.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(viewSize / 38.6)
            make.centerY.equalToSuperview()
        }
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.right.equalTo(view.snp.right).offset(viewSize/31.2 * -1)
            make.centerY.equalToSuperview()
            make.height.equalTo(viewSize)
            make.left.equalTo(label_Message.snp.right).offset(viewSize/31.2)
        }
        
        return view
    }
    
    
    func textField(textColor tc: UIColor,textSize ts : Int, font : UIFont.Weight) -> UITextField{
        let tf = UITextField()
        tf.textColor = tc
        tf.dynamicFont(fontSize: CGFloat(ts), weight: font)
        return tf
    }
    
    func inputContainerTextView(withMessage message:String,textView:UITextView,Color messageColor: UIColor, viewSize : Double) -> UIView{
        let view = UIView()
        let label_Message = UILabel()
        
        view.backgroundColor = messageColor
        
        
        view.addSubview(label_Message)
        label_Message.text = message
        label_Message.dynamicFont(fontSize: 14, weight: .bold)
        label_Message.textColor = .EZY_968DFF
        label_Message.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(viewSize / 38.6)
            make.top.equalToSuperview().offset(viewSize/40.6)
        }
        view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.left.equalTo(label_Message.snp.right).offset(viewSize/31.2)
            make.right.equalToSuperview().offset(viewSize/40.6 * -1)
            make.top.equalToSuperview().offset(viewSize/60)
            make.bottom.equalToSuperview().offset(viewSize/60 * -1)
        }
    

        return view
    }
    func textView(TextColor tc: UIColor,TextSize ts : Int,font : UIFont.Weight) -> UITextView{
        let tv = UITextView()
        tv.textColor = tc
        tv.font = UIFont.systemFont(ofSize: CGFloat(ts), weight: .medium)
        tv.backgroundColor = .clear
        return tv
    }
    
    
    //MARK: - inputcontainerCustomTextView
    func inputContainerCustomTextView(withMessage message:String,textView : UITextView,Color messageColor: UIColor, viewSize : Double) -> UIView{
        let view = UIView()
        let label_Message = UILabel()
        view.backgroundColor = messageColor
        
        view.addSubview(label_Message)
        
        label_Message.text = message
        
        label_Message.dynamicFont(fontSize: 14, weight: .bold)
        
        label_Message.textColor = .EZY_8099FF
        label_Message.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(viewSize / 47.8)
            make.top.equalToSuperview().offset(viewSize/45.1)
        }
        view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.left.equalTo(label_Message.snp.left)
            make.right.equalToSuperview().offset(viewSize/40.6 * -1)
            make.top.equalTo(label_Message.snp.bottom).offset(viewSize/90.2)
            make.bottom.equalToSuperview()
        }
        return view
    }
    
    //MARK: - Alert
    
  
    
    //MARK: - CustomTextField
    func customTextField(withMessage message : String,textField : UITextField ,Color messageColor : UIColor, viewSize : Double) -> UIView{
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = messageColor
        
        view.addSubview(textField)
        textField.attributedPlaceholder = NSAttributedString(string: message, attributes: [NSAttributedString.Key.foregroundColor: UIColor.EZY_CACACA])
        
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(viewSize/42.7)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }

        return view
    }
    
   
    

    
    
}
