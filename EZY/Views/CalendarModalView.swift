//
//  CalendarView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/23.
//

import UIKit

class CalendarModalView: UIView {
    
    var pinkColor: UIColor! = UIColor(red: 255/255, green: 148/255, blue: 148/255, alpha: 1)
    var whiteColor: UIColor! = UIColor.white
    
    lazy var labelColor: [UIColor] = [pinkColor, whiteColor]

    lazy var shadowBackgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    lazy var modalBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "날짜 선택"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 255/255, green: 181/255, blue: 181/255, alpha: 1)
    }
    
    lazy var monthLabel = UILabel().then {
        $0.text = "3"
        $0.dynamicFont(fontSize: 30, currentFontName: "AppleSDGothicNeo-Thin")
        $0.updateGradientTextColor_vertical(gradientColors: labelColor)
    }
    
    lazy var monthYearLabel = UILabel().then {
        $0.text = "MARCH 2021"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor.black
    }
}
