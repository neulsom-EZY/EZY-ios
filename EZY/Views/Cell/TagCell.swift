//
//  TagCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/27.
//

import UIKit

class TagCell : UICollectionViewCell{
    static let identifier = "TagCell"
    let bglabel = UILabel().then {
        $0.clipsToBounds = true
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    override var isSelected: Bool{
        didSet{
            if isSelected{
                backgroundColor = UIColor(cgColor: layer.borderColor!)
                bglabel.textColor = .white
            }
            else {
                bglabel.textColor = UIColor(cgColor: layer.borderColor!)
                backgroundColor = .white
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bglabel)
        bglabel.textAlignment = .center
        bglabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
