//
//  UserCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/10.
//

import UIKit

class UserCell : UICollectionViewCell{
    static let registerId = "\(UserCell.self)"
    
    let main = UIView().then{
        $0.backgroundColor = .black
    }
    override init(frame: CGRect) {
         super.init(frame: frame)
         setup()
         bindConstraints()
     }
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
         setup()
         bindConstraints()
     }
     
     private func setup() {
         backgroundColor = .red
         addSubview(main)
     }
     
     private func bindConstraints() {
         main.snp.makeConstraints { (make) in
             make.edges.equalTo(0)
         }
     }
}
