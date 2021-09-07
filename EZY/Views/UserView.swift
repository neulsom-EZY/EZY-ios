//
//  UserView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/10.
//

import UIKit
import SnapKit
import Then

class UserView: UIView{
    let collectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewFlowLayout()).then{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.backgroundColor = .clear
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
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
      
      func setup() {
          backgroundColor = .white
          addSubview(collectionView)
      }
      
      func bindConstraints() {
          collectionView.snp.makeConstraints { (make) in
              make.left.right.equalToSuperview()
             
              make.height.equalTo(200)
            
          }
      }
  }
