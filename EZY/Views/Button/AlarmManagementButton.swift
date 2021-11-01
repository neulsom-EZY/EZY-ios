//
//  AlarmManagementButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/26.
//

import UIKit

class AlarmManagementButton : UIButton {
    
    let view = UIView()
    
    private let title = UILabel().then{
        $0.textColor = UIColor.EZY_656565
        $0.dynamicFont(fontSize: 12.5, currentFontName: "AppleSDGothicNeo-Regular")
        
    }
    private let subtitle = UILabel().then{
        $0.textColor = .EZY_CDCDCD
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-SemiBold")
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
        addSubview(view)
        view.addSubview(title)
        view.addSubview(subtitle)
        addSubview(image)
    }
    
    func configure(with viewModel : Managementbtn){
        backgroundColor = .white
        title.text = viewModel.title
        subtitle.text = viewModel.subTitle
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/6.3
        layer.applySketchShadow(color: UIColor.black, alpha: 0.1, x: 0, y: frame.height/15.75, blur: 20, spread: 0)
        view.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(frame.height/4.2)
            make.top.equalTo(title)
            make.bottom.equalTo(subtitle.snp.bottom)
            make.right.equalTo(subtitle)
        }
   
        title.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        subtitle.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(frame.height/21)
            make.left.equalToSuperview()
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
