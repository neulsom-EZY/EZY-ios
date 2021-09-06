//
//  AlarmManagementButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/26.
//

import UIKit

class AlarmManagementButton : UIButton {
    
    
    private let icon = UIImageView()
    
    private let title = UILabel().then{
        $0.textColor = UIColor.EZY_656565
        $0.dynamicFont(fontSize: 14, weight: .regular)
        
    }
    private let subtitle = UILabel().then{
        $0.textColor = .EZY_CDCDCD
        $0.dynamicFont(fontSize: 8, weight: .thin)
    }
    private let image = UIImageView().then{
        $0.image = UIImage(named: "EZY_chevron.right")
        $0.tintColor = .EZY_B2B2B2
    }
    private var viewModel : Managementbtn?
    
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
    }
    init(with viewModel: Managementbtn) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        addView()
        configure(with: viewModel)
    }
    
    func addView(){
        addSubview(icon)
        addSubview(title)
        addSubview(subtitle)
        addSubview(image)
    }
    
    func configure(with viewModel : Managementbtn){
        backgroundColor = .white

        
        icon.image = viewModel.icon
        icon.tintColor = viewModel.iconTintColor
        title.text = viewModel.title
        subtitle.text = viewModel.subTitle
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/6.3
        layer.applySketchShadow(color: UIColor.black, alpha: 0.1, x: 0, y: frame.height/15.75, blur: 20, spread: 0)

        icon.snp.makeConstraints { (make) in
            make.centerY.equalTo(snp.centerY)
            make.left.equalTo(snp.left).offset(frame.height/3.9)
            make.height.width.equalTo(frame.height/2.6)
        }
        title.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top).offset(frame.height/4.2)
            make.left.equalTo(icon.snp.right).offset(frame.height/4.2)
        }
        subtitle.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(frame.height/15.8)
            make.left.equalTo(title.snp.left)
        }
        image.snp.makeConstraints { (make) in
            make.centerY.equalTo(snp.centerY)
            make.right.equalTo(snp.right).offset(frame.height/2.7 * -1)
            make.height.equalTo(frame.height/3.9)
            make.width.equalTo(frame.height/7)
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
