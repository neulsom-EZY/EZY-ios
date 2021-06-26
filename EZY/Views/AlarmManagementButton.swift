//
//  AlarmManagementButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/26.
//

import UIKit

class AlarmManagementButton : UIButton {
    
    private let backgroundview = UIView().then{
        $0.backgroundColor = .white
    }
    
    private let icon = UIImageView()
    
    private let title = UILabel().then{
        $0.textColor = .EZY_656565
        $0.dynamicFont(fontSize: 14, weight: .regular)
        
    }
    private let subtitle = UILabel().then{
        $0.textColor = .EZY_CDCDCD
        $0.dynamicFont(fontSize: 8, weight: .thin)
    }
    private let image = UIImageView().then{
        $0.image = UIImage(systemName: "chevron.forward")
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
        addSubview(backgroundview)
        backgroundview.addSubview(icon)
        backgroundview.addSubview(title)
        backgroundview.addSubview(subtitle)
        backgroundview.addSubview(image)
    }
    
    func configure(with viewModel : Managementbtn){
        backgroundview.isUserInteractionEnabled = false
        backgroundview.layer.shadowColor = UIColor.black.cgColor
        backgroundview.layer.shadowOpacity = 0.1
        backgroundview.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        icon.image = viewModel.icon
        icon.tintColor = viewModel.iconTintColor
        title.text = viewModel.title
        subtitle.text = viewModel.subTitle
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundview.layer.cornerRadius = frame.height/81.2
        
        icon.snp.makeConstraints { (make) in
            make.centerY.equalTo(backgroundview.snp.centerY)
            make.left.equalTo()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
