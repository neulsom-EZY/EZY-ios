//
//  InquirySendChattingBoxView.swift
//  EZY
//
//  Created by 김유진 on 2021/07/21.
//

import UIKit

class InquirySendChattingBoxView: UIView {
    

    
    var boxColor: [UIColor] = [UIColor(red: 182/255, green: 162/255, blue: 251/255, alpha: 1), UIColor(red: 193/255, green: 191/255, blue: 255/255, alpha: 1)]

    lazy var chattingBackgroundView = UIView().then {
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner])
        $0.applyGradient(colors: boxColor)
    }
    
    lazy var chattingContentLabel = UILabel().then {
        $0.text = "아이디는 어디서 바꿀 수 있나요 아이디가 너무 마음에 안들어요"
        $0.textColor = UIColor.white
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
}
