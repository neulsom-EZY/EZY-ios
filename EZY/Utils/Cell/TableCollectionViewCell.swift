//
//  TableCollectionViewCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/16.
//

import UIKit
import Then
class TableCollectionViewCell : UICollectionViewCell {
    static let identifier = "TableCollectionViewCell"
    private let myLabel = UILabel().then{
        $0.textAlignment = .center
        $0.dynamicFont(fontSize: 12, weight: .ultraLight)
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myLabel)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
//        myLabel.frame = CGRect(x: contentView.center.x, y: contentView.center.y, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }
    public func configure(with model : CollectionTableCellModel){
        myLabel.text = model.title
        myLabel.textColor = model.color
    }
    
}
