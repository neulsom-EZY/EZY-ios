//
//  NotFoundUser.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/13.
//

import UIKit

class NotFoundUser : UIView {
    
    let iv = UIImageView().then{
        $0.image = UIImage(named: "EZY_NoMember")
        $0.contentMode = .scaleAspectFit
    }
    let label = UILabel().then{
        $0.text = "일치하는 사용자가 없어요"
        $0.textColor = .black
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-UltraLight")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(iv)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        iv.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(label.frame.width/1.2625)
            make.height.equalTo(bounds.height/1.45)
        }
        label.snp.makeConstraints { (make) in
            make.top.equalTo(iv.snp.bottom).offset(bounds.height/5.73)
            make.centerX.equalToSuperview()
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
