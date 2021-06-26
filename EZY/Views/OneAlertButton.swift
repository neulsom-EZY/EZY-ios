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
        
    }
    func configure(with viewModel : OneAlertBtn){
        view.isUserInteractionEnabled = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        icon.image = viewModel.icon
        icon.tintColor = viewModel.iconTintColor
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        view.layer.cornerRadius = frame.height/4.5
        view.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
            make.height.width.equalTo(frame.height)
        }
        icon.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
            make.height.width.equalTo(frame.height/2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
