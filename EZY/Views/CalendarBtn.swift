//
//  CalendarBtn.swift
//  EZY
//
//  Created by 김유진 on 2021/10/09.
//

import UIKit

class CalendarBtn: UIButton {
    
    private let viewBounds = UIScreen.main.bounds

    private lazy var iconBackgroundView = UIView().then{
        $0.isUserInteractionEnabled = false
        $0.backgroundColor = .white
        $0.layer.applySketchShadow(color: UIColor.black, alpha: 0.1, x: 0, y: 4, blur: 15, spread: 0)
        $0.layer.cornerRadius = 10
    }
    
    private let labelView = UIView().then{
        $0.isUserInteractionEnabled = false
    }
    
    var repeatLabel = UILabel().then{
        $0.textColor = .black
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let label = UILabel().then{
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = .EZY_656565
    }
    
    private lazy var icon = UIImageView()
    
    private var viewModel : CalendarModel?
    
    override init(frame: CGRect) {
        self.viewModel = nil
        
        super.init(frame: frame)
    }
    
    init(with viewModel : CalendarModel){
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        addSubViews()
        
        configure(with: viewModel)
    }
    
    private func addSubViews(){
        addSubview(iconBackgroundView)
        iconBackgroundView.addSubview(icon)
        addSubview(labelView)
        labelView.addSubview(repeatLabel)
        labelView.addSubview(label)
    }
    
    public func configure( with viewModel : CalendarModel){
        icon.image = viewModel.icon
        icon.tintColor = viewModel.iconTintColor
        label.text = viewModel.message
        repeatLabel.text = viewModel.repeatText
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        iconBackgroundView.snp.makeConstraints { (make) in
            make.left.equalTo(snp.left)
            make.height.width.equalTo(frame.height)
            make.top.left.equalToSuperview()
        }
        
        labelView.snp.makeConstraints { make in
            make.centerY.equalTo(iconBackgroundView)
            make.height.equalTo(frame.height).dividedBy(1.03)
            make.left.equalTo(iconBackgroundView.snp.right).offset(frame.height/1.7)
            make.right.equalToSuperview()
        }
        
        icon.snp.makeConstraints { (make) in
            make.height.width.equalTo(frame.height/2)
            make.center.equalTo(iconBackgroundView.snp.center)
        }
        
        label.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(viewBounds.height/101.5)
        }
        
        repeatLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-viewBounds.height/101.5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
