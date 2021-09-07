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
        view.layer.applySketchShadow(color: UIColor.black, alpha: 0.1, x: 0, y: 4, blur: 15, spread: 0)
        
        label.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Regular")
        label.textColor = .EZY_656565
        
        icon.image = viewModel.icon
        icon.tintColor = viewModel.iconTintColor
        label.text = viewModel.message
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        view.layer.shadowRadius = frame.height/11.25
        view.layer.shadowOffset = CGSize(width: 0, height: frame.height/11.25)
        view.layer.cornerRadius = frame.height/4.5
        
        view.snp.makeConstraints { (make) in
            make.left.equalTo(snp.left)
            make.height.width.equalTo(frame.height)
            make.top.left.equalToSuperview()
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
