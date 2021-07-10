//
//  TagCollectionViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/07/10.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "\(TagCollectionViewCell.self)"
    
    var model: TagCollectionViewModel?
    
    lazy var tagBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var tagNameLabel = UILabel().then {
        $0.text = "공부"
        $0.textColor = .white
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutSetting()
    }
    
    func layoutSetting(){
        contentView.addSubview(tagBackgroundView)
        tagBackgroundView.addSubview(tagNameLabel)
        
        tagBackgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
            
            tagBackgroundView.layer.cornerRadius = contentView.frame.height/2
        }
        
        tagNameLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func setModel(_ model: TagCollectionViewModel){
        self.model = model
        tagBackgroundView.backgroundColor = model.backgroundColor
        
        if model.isSelected == false{
            tagBackgroundView.backgroundColor = model.backgroundColor
            tagBackgroundView.layer.borderColor = .none
            tagBackgroundView.layer.borderWidth = 0
            tagNameLabel.textColor = .white
        }else{
            tagBackgroundView.backgroundColor = .white
            tagBackgroundView.layer.borderWidth = 1
            tagBackgroundView.layer.borderColor = model.backgroundColor.cgColor
            tagNameLabel.textColor = model.backgroundColor
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // 셀이 재사용되기 전에 셀의 속성을 초기화시켜준다.
        tagBackgroundView.backgroundColor = .white
        tagBackgroundView.layer.borderWidth = 1
        tagBackgroundView.layer.borderColor = model?.backgroundColor.cgColor
        tagNameLabel.textColor = model?.backgroundColor
    }
}
