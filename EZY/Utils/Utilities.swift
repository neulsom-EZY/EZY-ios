//
//  Utilities.swift
//  EZY
//
//  Created by 노연주 on 2021/06/10.
//

import UIKit
import SnapKit
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======

<<<<<<< HEAD
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
=======

>>>>>>> 19d6eb730b5d1416bdbb7072919b5a02da8344da
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
}

