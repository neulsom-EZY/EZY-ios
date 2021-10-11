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
        $0.layer.applySketchShadow(color: UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1), alpha: 1, x: 0, y: 3, blur: 15, spread: 0)
        $0.layer.cornerRadius = 10
    }
    
    public var iconImageView = UIImageView().then{
        $0.image = UIImage(named: "EZY_UnSelectedTagAddButtonImage")
    }
    
    lazy var tagNameLabel = UILabel().then {
        $0.text = "공부"
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
        tagBackgroundView.addSubview(iconImageView)
        
        tagBackgroundView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        
        tagNameLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalToSuperview().dividedBy(3.5)
        }
    }
    
    func setModel(_ model: TagCollectionViewModel){
        self.model = model
        
        if model.isSelected == false{
            tagBackgroundView.backgroundColor = model.backgroundColor
            iconImageView.image = model.iconImgae
            tagNameLabel.textColor = .white
        }else{
            tagBackgroundView.backgroundColor = .white
            tagNameLabel.textColor = model.backgroundColor
            iconImageView.image = model.iconImgae
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // 셀이 재사용되기 전에 셀의 속성을 초기화시켜준다.
        tagBackgroundView.backgroundColor = .white
    }
}
