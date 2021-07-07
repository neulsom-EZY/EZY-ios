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
    
    let cellClickButton = UIButton().then{
        $0.backgroundColor = .red
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLocation()
    }
    
    func setLocation(){
        cellClickButton.snp.makeConstraints { (make) in
            make.top.right.left.bottom.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
