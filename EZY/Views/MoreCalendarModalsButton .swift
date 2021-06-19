//
//  MoreCalendarModalsButton .swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/20.
//

import UIKit
import SnapKit

struct MyCustomButtonViewModel{
    let title : String
    let image: UIImage
    let color : UIColor
}
class MoreCalendarModalsButton : UIButton{
    
    private let toDoLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.dynamicFont(fontSize: 18, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    private let iconView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var viewModel : MyCustomButtonViewModel?
    
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
    }
    init(with viewModel : MyCustomButtonViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        addSubViews()
        
    }
    func addSubViews(){
        addSubview(toDoLabel)
        addSubview(iconView)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(with viewModel : MyCustomButtonViewModel){
        layer.masksToBounds = true
        layer.cornerRadius = 20
        layer.borderColor = viewModel.color.cgColor
        layer.borderWidth = 2
        iconView.tintColor = viewModel.color
        
        toDoLabel.text = viewModel.title
        iconView.image = viewModel.image
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(frame.height/1.5)
            make.height.width.equalTo(frame.height/2.9)
        }
        toDoLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(iconView.snp.right).offset(frame.height/8.8)
        }
        
    }
}
