//
//  NotFoundUser.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/13.
//

import UIKit

class NotFoundUser : UIView {
    
    let iv = UIImageView().then{
        $0.image = UIImage(named: "EZY_undraw_feeling")
    }
    let label = UILabel().then{
        $0.text = "일치하는 사용자가 없어요"
        $0.textColor = .black
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-UltraLight")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iv)
        addSubview(label)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        iv.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(frame.height/1.4562)
            make.width.equalTo(frame.width/1.2625)
        }
        label.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
