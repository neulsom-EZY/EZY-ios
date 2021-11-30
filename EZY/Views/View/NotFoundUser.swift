//
//  NotFoundUser.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/30.
//

import UIKit

class NotFoundUser : UIView {
    
    let iv = UIImageView().then{
        $0.image = UIImage(named: "EZY_undraw_feeling")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let label = UILabel().then{
        $0.text = "일치하는 사용자가 없어요"
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.sizeToFit()
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
            make.bottom.equalTo(label.snp.top)
            make.left.right.equalToSuperview()
        }
        label.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
