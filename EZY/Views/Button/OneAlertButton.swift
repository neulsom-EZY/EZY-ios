//
//  OneAlertButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/26.
//

import UIKit
import SnapKit


class OneAlertButton : UIButton {
    
    static let randomColorlist : [UIColor] = [.rgb(red: 255, green: 205, blue: 184),.rgb(red: 186, green: 222, blue: 255),.rgb(red: 207, green: 227, blue: 206),.rgb(red: 228, green: 201, blue: 255),.rgb(red: 186, green: 200, blue: 255)]
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
        icon.image = viewModel.icon
        icon.tintColor = viewModel.iconTintColor

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view.layer.cornerRadius = frame.height/4.5
        view.layer.shadowRadius = frame.height/11.25
        view.layer.shadowOffset = CGSize(width: 0, height: frame.height/11.25)
        
        view.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.height.width.equalTo(frame.height)
        }
        icon.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
            make.height.width.equalTo(frame.height/2)
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
