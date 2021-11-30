//
//  TimeLabel.swift
//  EZY
//
//  Created by 김유진 on 2021/11/23.
//

import UIKit

class TimeLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    func configureUI(){
        self.textColor = UIColor(red: 114/255, green: 114/255, blue: 114/255, alpha: 1)
        self.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
}
