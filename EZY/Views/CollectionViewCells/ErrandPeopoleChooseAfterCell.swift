//
//  ErrandPeopoleChooseAfterCell.swift.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/15.
//

import UIKit

class ErrandPeopoleChooseAfterCell : UICollectionViewCell{
    static let identifier = "ErrandPeopoleChooseAfterCell"
    let view = UIView()
    let bglabel = UILabel().then {
        $0.clipsToBounds = true
        $0.sizeToFit()
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    let button = UIButton().then{
        $0.setImage(UIImage(named: "EZY_Cancel"), for: .normal)
        $0.tintColor = .gray
    }


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(view)
        view.addSubview(bglabel)
        view.addSubview(button)
        contentView.backgroundColor = .clear
        view.backgroundColor = .clear
        layer.cornerRadius = frame.height/6.4
        bglabel.textAlignment = .center
        view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalToSuperview()
            make.left.equalTo(bglabel.snp.left)
            make.right.equalTo(button.snp.right)
        }
        bglabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(view.snp.centerY)
            make.left.equalTo(view.snp.left)
        }
        button.snp.makeConstraints { (make) in
            make.height.equalTo(frame.height/4.2857)
            make.width.equalTo(button.snp.height)
            make.left.equalTo(bglabel.snp.right).offset(frame.height/3.3333)
            make.centerY.equalToSuperview()
        }

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
