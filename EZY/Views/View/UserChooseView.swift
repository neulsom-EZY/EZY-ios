//
//  UserChooseView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/30.
//

import UIKit

class UserChooseView : UIView{
    
    let label = UILabel().then{
        $0.textColor = .rgb(red: 104, green: 104, blue: 104)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Bold")
    }
    let btn = UIButton().then{
        $0.setImage(UIImage(named: "EZY_SelectedNoSelectTagButtonImage")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .rgb(red: 224, green: 224, blue: 224)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        layer.borderColor = UIColor.rgb(red: 224, green: 224, blue: 224).cgColor
        layer.borderWidth = 1
        backgroundColor = .white
        addSubview(label)
        addSubview(btn)
        location()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func location(){
        label.sizeToFit()
        label.snp.makeConstraints{
            $0.left.equalToSuperview().offset(12)
            $0.centerY.equalToSuperview()
        }
        btn.snp.makeConstraints{
            $0.left.equalTo(label.snp.right).inset(10 * -1)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(7)
            $0.right.equalToSuperview().inset(12)
        }
    }
}
