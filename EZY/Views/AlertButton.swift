//
//  AlertButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/23.
//

import UIKit
import SnapKit
import Then
import Alamofire

class AlertButton : UIButton {

    private let view = UIView()
    
    private let label = UILabel()
    
    private let icon = UIImageView()
    
    private var viewModel : AlertBtn?
    
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
        
    }
    
    init(with viewModel : AlertBtn){
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        addSubViews()
        configure(with: viewModel)
    }
    private func addSubViews(){
        addSubview(view)
        addSubview(label)
        addSubview(icon)
    }
    public func configure( with viewModel : AlertBtn){
        view.isUserInteractionEnabled = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 15
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        label.dynamicFont(fontSize: 16, weight: .regular)
        label.textColor = .EZY_656565
        
        icon.image = viewModel.icon
        icon.tintColor = viewModel.iconTintColor
        label.text = viewModel.message
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        view.layer.cornerRadius = frame.height/4.5
        
        view.snp.makeConstraints { (make) in
            make.left.equalTo(snp.left)
            make.height.width.equalTo(frame.height)
            make.top.equalTo(snp.top)
        }
        icon.snp.makeConstraints { (make) in
            make.height.width.equalTo(frame.height/2)
            make.center.equalTo(view.snp.center)
        }
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.right).offset(frame.height/1.7)
            make.centerY.equalToSuperview()
            make.right.equalTo(snp.right)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
