//
//  Utilities.swift
//  EZY
//
//  Created by 노연주 on 2021/06/10.
//

import UIKit
import SnapKit
<<<<<<< HEAD

class Utilities{
    
    func inputContainerView(withMessage message:String,textField:UITextField,color messageColor: UIColor, viewSize : Double) -> UIView{
        let view = UIView()
        let label_Message = UILabel()
        
        view.backgroundColor = messageColor
        
        view.addSubview(label_Message)
        label_Message.text = message
        label_Message.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
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
            make.bottom.equalToSuperview()
            make.left.equalTo(label_Message.snp.right).offset(viewSize/31.2)
        }
        
        return view
    }
    
    
    func textField(textColor tc: UIColor,textSize ts : Int, font : String) -> UITextField{
        let tf = UITextField()
        tf.textColor = tc
        tf.dynamicFont(fontSize: CGFloat(ts), currentFontName: font)
        return tf
    }
    
    func inputContainerTextView(withMessage message:String,textView:UITextView,Color messageColor: UIColor, viewSize : Double) -> UIView{
        let view = UIView()
        let label_Message = UILabel()
        
        view.backgroundColor = messageColor
        
        
        view.addSubview(label_Message)
        label_Message.text = message
        label_Message.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        label_Message.textColor = .EZY_968DFF
        label_Message.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(viewSize / 38.6)
            make.top.equalToSuperview().offset(viewSize/40.6)
        }
        view.addSubview(textView)
        textView.showsVerticalScrollIndicator = false
        textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        textView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(viewSize/60)
            make.bottom.equalToSuperview().offset(viewSize/60 * -1)
            make.left.equalTo(label_Message.snp.right).offset(viewSize/31.2)
            make.right.equalToSuperview().inset(viewSize/31.2)

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
    func inputContainerCustomTextView(withMessage message:String,textfield : UITextView,Color messageColor: UIColor, viewSize : Double) -> UIView{
        let view = UIView()
        let label_Message = UILabel()
        view.backgroundColor = messageColor
        
        view.addSubview(label_Message)
        
        label_Message.text = message
        
        label_Message.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        
        label_Message.textColor = .EZY_8099FF
        label_Message.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(viewSize / 47.8)
            make.top.equalToSuperview().offset(viewSize/45.1)
        }
        view.addSubview(textfield)
        textfield.snp.makeConstraints { (make) in
            make.left.equalTo(label_Message.snp.left)
            make.right.equalToSuperview().offset(viewSize/40.6 * -1)
            make.top.equalTo(label_Message.snp.bottom)
            make.bottom.equalToSuperview()
        }
        return view
    }
    
    
=======
class Utilities {
    func textField(withPlaceholder placeholder :String) -> UITextField{
        let tf = UITextField()
        tf.textColor = UIColor.black
        tf.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Light")
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return tf
    }
    
    func inputContainerView(textField: UITextField, text: String, fonts: Int) -> UIView{
        let view = UIView()
        let label = UILabel()
        label.text = text
        label.dynamicFont(fontSize: CGFloat(fonts), currentFontName: "AppleSDGothicNeo-SemiBold")
        label.textColor = .EZY_968DFF

        view.addSubview(label)
        label.snp.makeConstraints { make in 
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
        }
        
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(label.safeAreaLayoutGuide.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(4)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(6)
        }
        let dividerView = UIView()
        dividerView.backgroundColor = UIColor.EZY_968DFF
        
        view.addSubview(dividerView)
        
        dividerView.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            make.height.equalTo(2)
        }
        return view
    }
>>>>>>> develop
}

