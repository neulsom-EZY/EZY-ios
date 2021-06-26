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
        tv.backgroundColor = .EZY_F6F3FF
        return tv
    }
    
    
    //
    func inputContainerCustomTextView(withMessage message:String,textView:UITextView,Color messageColor: UIColor, viewSize : Double) -> UIView{
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
    
    
    
    //MARK: - Alert
    
    func AlertbtnView(withMessage message: String, viewSize : Double, button: UIButton) -> UIView{
        let view = UIView()
        let label = UILabel()
        label.text = message
        label.dynamicFont(fontSize: 16, weight: .regular)
        label.textColor = .EZY_656565
        
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.height.width.equalTo(viewSize/18.0)
            make.centerY.equalToSuperview()
        }
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(button.snp.right).offset(viewSize/30.0)
            make.centerY.equalToSuperview()
        }
        return view
    }
    func AlertButton(image img: UIImage,tintColor : UIColor) -> UIButton{
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.1
        button.setImage(img, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 11.25, left: 11.25, bottom: 11.25, right: 11.25)
        return button
    }
    
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
