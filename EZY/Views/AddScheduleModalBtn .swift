//
//  AddScheduleModalBtn .swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/12.
//

import UIKit

class AddScheduleModalBtn : UIButton{
    
    private let label = UILabel().then{
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 174, green: 169, blue: 242)
    }
    private let view = UIView()
    private let image = UIImageView().then{
        $0.tintColor = .black
    }
    
    private var viewModel : CustomButtonViewModel?
    
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: .zero)
        
    }
    init(with viewModel : CustomButtonViewModel){
        self.viewModel = viewModel
        super.init(frame: .zero)
        addView()
        configure(with: viewModel)
        
    }
    func addView(){
        addSubview(view)
        addSubview(label)
        view.addSubview(image)
    }
    func configure(with viewModel : CustomButtonViewModel){
        view.isUserInteractionEnabled = false
        backgroundColor = .white
        label.text = viewModel.title
        label.textColor = viewModel.color
        view.backgroundColor = viewModel.color
        image.image = viewModel.image
        image.tintColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view.layer.cornerRadius = view.frame.height/2
        view.snp.makeConstraints { (make) in
            make.centerX.equalTo(snp.centerX)
            make.height.equalTo(frame.height/4.567)
            make.width.equalTo(view.snp.height)
            make.top.equalTo(snp.top).offset(frame.height/3.185)
        }
        label.snp.makeConstraints { (make) in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(view.snp.bottom).offset(frame.height/7.806)
        }
        image.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalToSuperview().dividedBy(2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
