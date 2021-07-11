//
//  SwitchButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/11.
//

import UIKit
import SnapKit

class SwitchButton : UIButton{
    typealias SwitchColor = (bar: UIColor, circle: UIColor)
    private var barView =  UIView()
    private var circleView = UIView()
    
    var isOn: Bool = false{
        didSet{
            
        }
    }

}
