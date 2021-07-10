//
//  OneAlertButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/26.
//

import UIKit
import SnapKit


class OneAlertButton : UIButton {
    
    static let randomColorlist : [UIColor] = [.EZY_FFCDB8,.EZY_BADEFF,.EZY_CFE3CE,.EZY_E4C9FF,.EZY_BAC8FF]
    private let view = UIView()
    private let icon = UIImageView()
    private var viewModel : OneAlertBtn?
     let button = UIButton().then{
        $0.layer.borderColor = UIColor.EZY_BAC8FF.cgColor
        $0.backgroundColor = .clear
    }
    let buttonLabel = UILabel().then{
        $0.text = "+"
        $0.dynamicFont(fontSize: 9, weight: .regular)
        $0.textColor = .EZY_BAC8FF
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
        addSubview(button)
        button.addSubview(buttonLabel)
    }
    
    func configure(with viewModel : OneAlertBtn){
        view.isUserInteractionEnabled = false
        button.isUserInteractionEnabled = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        icon.image = viewModel.icon
        icon.tintColor = viewModel.iconTintColor
        button.layer.borderWidth = 2

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view.layer.cornerRadius = frame.height/4.5
        view.layer.shadowRadius = frame.height/11.25
        view.layer.shadowOffset = CGSize(width: 0, height: frame.height/11.25)
        button.layer.cornerRadius = button.frame.height/2
        
        view.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.right.equalTo(view.snp.left)
            make.height.width.equalTo(frame.height)
        }
        icon.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
            make.height.width.equalTo(frame.height/2)
        }
        button.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(view.snp.right).offset(frame.height/1.67)
            make.height.equalTo(frame.height/1.25)
            make.width.equalTo(button.snp.height)
        }
        buttonLabel.snp.makeConstraints { (make) in
            make.center.equalTo(button.snp.center)
        }
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
