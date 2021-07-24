//
//  ListTagView.swift
//  EZY
//
//  Created by 노연주 on 2021/07/24.
//

import UIKit

class ListTagView: UIView {
    lazy var listLabel = UILabel().then {
        $0.text = "부탁받은 심부름"
        $0.textColor = .blue
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    func inTextViewLayoutSetting(){
        listLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.blue.cgColor
    }
}
