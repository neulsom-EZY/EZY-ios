//
//  CalendarView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/23.
//

import UIKit

class SelectCalendarModalView: UIView {
    
    var pinkColor: UIColor! = UIColor(red: 255/255, green: 148/255, blue: 148/255, alpha: 1)
    var whiteColor: UIColor! = UIColor.white
    
    lazy var labelColor: [UIColor] = [pinkColor, whiteColor]
    
    lazy var calendarTriangleImageView = UIImageView().then{
        $0.image = UIImage(named:"EZY_CalendarTriangleViewImage.svg")
    }
    
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
    
    lazy var divideLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
    }
    
    lazy var calendarAddButton = UIButton().then{
        $0.backgroundColor = UIColor(red: 255/255, green: 181/255, blue: 181/255, alpha: 1)
        $0.setTitle("완료", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.layer.cornerRadius = 10
    }
    
    lazy var repeatLabel = UILabel().then {
        $0.text = "반복 설정"
        $0.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
}
