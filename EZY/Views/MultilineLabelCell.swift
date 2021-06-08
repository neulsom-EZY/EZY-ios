//
//  MultilineLabelCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/08.
//

import UIKit
import SnapKit

class MultilineLabelCell: UICollectionViewCell {
    static let reuseId = "MultilineLabelCellReuseId"
    
    private let label: UILabel = UILabel(frame: .zero)
    
    var cellBackgroundView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.9
        view.layer.shadowRadius = 7
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
        return view
    }()
    
    var groupTitleBackground: UIView = {
        var view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        contentView.addSubview(cellBackgroundView)
        contentView.addSubview(groupTitleBackground)
        cellBackgroundView.addSubview(label)
        
        cellBackgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(10)
            make.bottom.right.equalToSuperview().offset(-10)
        }
        
        label.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Storyboards are quicker, easier, more seductive. Not stronger then Code.")
    }
    
    func configure(text: String?) {
        label.text = text
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        label.preferredMaxLayoutWidth = layoutAttributes.size.width - contentView.layoutMargins.left - contentView.layoutMargins.left
        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes
    }
}
