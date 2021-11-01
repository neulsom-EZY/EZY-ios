//
//  File.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/15.
//

import UIKit

class WhatAboutPeopleLikeThisCell : UICollectionViewCell{
    static let identifier = "WhatAboutPeopleLikeThisCell"
    
    let bglabel = UILabel().then {
        $0.clipsToBounds = true
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-UltraLight")
    }

    func configure(name: String?) {
        bglabel.text = name
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bglabel)
        contentView.backgroundColor = .clear
        layer.cornerRadius = frame.height/6.4
        bglabel.textAlignment = .center
        
        bglabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(20 - frame.height)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
