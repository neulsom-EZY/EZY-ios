//
//  CustomData.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/31.
//

import UIKit

class CustomData : UIView{
    //MARK: - Properties
    
    private let view = UIView()
    
    fileprivate let ampmCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(AlarmSettingCell.self, forCellWithReuseIdentifier: AlarmSettingCell.identifier)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
