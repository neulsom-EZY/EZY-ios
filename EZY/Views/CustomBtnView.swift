//
//  CustomTextField.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/01.
//

import UIKit
import SnapKit
import Then
class CustomBtnView : UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let view = UIView()
        
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func LabelCustom(message text: String,textSize : Int,textColor color : UIColor) -> UILabel{
        let Label = UILabel()
        Label.text = text
        Label.dynamicFont(fontSize: CGFloat(textSize), weight: .regular)
        
        return Label
    }
}
