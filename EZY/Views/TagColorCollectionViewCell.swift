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
    
    lazy var colorBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1)
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
        
        colorBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
            
            colorBackgroundView.layer.cornerRadius = self.contentView.frame.height/2
        }
    }
}
