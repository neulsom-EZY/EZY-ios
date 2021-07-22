//
//  InquiryChattingBoxView.swift
//  EZY
//
//  Created by 김유진 on 2021/07/13.
//

import UIKit

class InquiryReceiveChattingBoxView: UIView {

    lazy var chattingBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner])
    }
    
    lazy var chattingContentLabel = UILabel().then {
        $0.text = "무엇을 도와드릴까요?ㅏㅏㅏㅏㅏㅏㅏㅏ"
        $0.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }

}
