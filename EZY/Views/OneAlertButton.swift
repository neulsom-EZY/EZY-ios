//
//  OneAlertButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/26.
//

import UIKit
import SnapKit


class OneAlertButton : UIButton {
    
    private let view = UIView()
    private let icon = UIImageView()
    private var viewModel : OneAlertBtn?
    
    let collectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewFlowLayout()).then{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.backgroundColor = .clear
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
    }
    init(with viewModel : OneAlertBtn){
        self.viewModel = viewModel
        super.init(frame: .zero)
        addView()
        configure(with: viewModel)
        
    }
    func addView(){
        addSubview(view)
        addSubview(icon)
        addSubview(collectionView)
        
    }
    func configure(with viewModel : OneAlertBtn){
        view.isUserInteractionEnabled = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        icon.image = viewModel.icon
        icon.tintColor = viewModel.iconTintColor
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        view.layer.cornerRadius = frame.height/4.5
        view.layer.shadowRadius = frame.height/11.25
        view.layer.shadowOffset = CGSize(width: 0, height: frame.height/11.25)

        view.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.right.equalTo(view.snp.left)
            make.height.width.equalTo(frame.height)
        }
        icon.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
            make.height.width.equalTo(frame.height/2)
        }
        collectionView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.right)
            make.right.equalToSuperview()
            make.height.equalTo(frame.height/1.25)
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
  
    }
    
}
