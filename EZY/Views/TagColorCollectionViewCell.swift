//
//  TagColorCollectionViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/20.
//

import UIKit

class TagColorCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    static let reuseId = "\(TagColorCollectionViewCell.self)"
    
    var model: TagColorCollectionViewModel?
    
    lazy var colorBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1)
    }
    
    lazy var checkImage = UIImageView().then {
        $0.image = UIImage(named: "EZY_TagColorCheckImage")
    }
    
    //MARK: LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
        layoutSetting()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layoutSetting()
    }
    
    func layoutSetting(){
        contentView.addSubview(colorBackgroundView)
        colorBackgroundView.addSubview(checkImage)
        colorBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
            
            colorBackgroundView.layer.cornerRadius = self.contentView.frame.height/2
        }
        
        checkImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2.6/1.2)
            make.height.equalToSuperview().dividedBy(3.7/1.2)
        }
        
        checkImage.isHidden = true
    }
    
    func setModel(_ model: TagColorCollectionViewModel){
        self.model = model
        colorBackgroundView.backgroundColor = model.backgroundColor
        checkImage.isHidden = model.isSelected
        
        if model.isSelected == false{
            colorBackgroundView.layer.masksToBounds = false
            colorBackgroundView.layer.shadowOpacity = 0.5
            colorBackgroundView.layer.shadowRadius = 6
            colorBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
            colorBackgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // 셀이 재사용되기 전에 셀의 속성을 초기화시켜준다.
        colorBackgroundView.layer.masksToBounds = true
        colorBackgroundView.layer.shadowOpacity = 0
        colorBackgroundView.layer.shadowRadius = 0
        colorBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
        colorBackgroundView.layer.shadowColor = .none
        
    }
}
