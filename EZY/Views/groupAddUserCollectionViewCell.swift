//
//  CollectionViewCell.swift
//  horizontalCollectionView
//
//  Created by 김유진 on 2021/06/09.
//

import UIKit

class groupAddUserCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "\(groupAddUserCollectionViewCell.self)"
    lazy var background: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 5
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1).cgColor
        return v
    }()
    
    lazy var groupMemberDeleteButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_GroupMemberDeleteButton"), for: .normal)
    }
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "dkdkdkdk"
        label.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-SemiBold")
        label.textColor = UIColor(red: 104/255, green: 104/255, blue: 104/255, alpha: 1)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(background)
        background.addSubview(titleLabel)
        background.addSubview(groupMemberDeleteButton)

        contentView.backgroundColor = .clear

        
        background.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
            make.centerX.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        groupMemberDeleteButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
