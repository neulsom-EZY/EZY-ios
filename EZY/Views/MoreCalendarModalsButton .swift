//
//  MoreCalendarModalsButton .swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/20.
//

import UIKit
import SnapKit
import Then
import Alamofire
    
    
class MoreCalendarModalsButton : UIButton{
    
    private let view = UIView().then{
        $0.backgroundColor = .clear
        
    }
    private let toDoLabel = UILabel().then{
        $0.numberOfLines = 1
        $0.dynamicFont(fontSize: 18, weight: .semibold)
    }
    
    private let iconView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private var viewModel : MyCustomButtonViewModel?
    
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
    }
    
    init(with viewModel : MyCustomButtonViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        isEnabled = true
        addSubViews()
        configure(with: viewModel)
    }
    
    private func addSubViews(){
        addSubview(view)
        view.addSubview(toDoLabel)
        view.addSubview(iconView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel : MyCustomButtonViewModel){
        layer.masksToBounds = true
        layer.borderColor = viewModel.color?.cgColor
        layer.borderWidth = 2
        
        iconView.tintColor = viewModel.color
        toDoLabel.textColor = viewModel.color
        toDoLabel.text = viewModel.title
        iconView.image = viewModel.image
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view.snp.makeConstraints { (make) in
            make.height.equalTo(frame.height/2.9)
            make.centerY.equalTo(snp.centerY)
            make.centerX.equalToSuperview()
        }
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.top.equalTo(view.snp.top)
            make.height.width.equalTo(view.snp.height)
        }
        toDoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(iconView.snp.right).offset(frame.height/8.8)
        }
        
//        iconView.snp.makeConstraints { (make) in
//            make.centerY.equalToSuperview()
//            make.left.equalTo(frame.height/1.5)
//            make.height.width.equalTo(frame.height/2.9)
//
//        }
//        toDoLabel.snp.makeConstraints { (make) in
//            make.centerY.equalToSuperview()
//            make.left.equalTo(iconView.snp.right).offset(frame.height/8.8)
//        }
    }
}
