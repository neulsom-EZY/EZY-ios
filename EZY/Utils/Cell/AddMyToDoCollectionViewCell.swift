//
//  AddMyToDoCollectionViewCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/07.
//

import UIKit
import SnapKit
import Alamofire
import Then

class AddMyToDoCollectionViewCell: UICollectionViewCell {
  
    static let identifier = "AddMyToDoCollectionViewCell"
    private let button =  UIButton().then  {
        $0.backgroundColor = .red
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(button)
        
        let list = ["공부", "자습", "여행"]
        button.setTitle(list.randomElement(), for: .normal)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = contentView.bounds
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        button.setTitle(nil, for: .normal)
    }
}
