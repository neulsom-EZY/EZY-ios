//
//  TagCollectionViewCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/21.
//

import UIKit
class TagCollectionViewCell:UICollectionViewCell{
    static let identifier = "TagCollectionViewCell"
    
    let bglabel = UILabel().then {
        $0.clipsToBounds = true
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }

    override var isSelected: Bool{
        didSet{
            if isSelected{
                backgroundColor = bglabel.textColor
                bglabel.textColor = .white
            }
            else {
//                bglabel.textColor = backgroundColor
//                backgroundColor = bglabel.textColor

                
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bglabel)
        contentView.backgroundColor = .clear
        layer.cornerRadius = contentView.frame.height/2
        bglabel.textAlignment = .center
        
        bglabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(20 - frame.height)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
