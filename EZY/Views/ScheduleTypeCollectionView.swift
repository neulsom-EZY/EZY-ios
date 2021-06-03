//
//  ScheduleTypeCollectionView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/03.
//

import UIKit

class ScheduleTypeCollectionView: UIView {

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 17, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
        CollectionViewSnapKit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        
        CollectionViewSnapKit()
    }
    
    func setup() {
        backgroundColor = .white
        addSubview(collectionView)
    }
    
    func CollectionViewSnapKit(){
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(173)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4.5)
        }
    }

}
