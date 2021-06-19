//
//  MoreCalendarBtn.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/19.
//

import UIKit
import SnapKit

class MoreCalendarBtn : UIButton{
    
    var title : String? {
        didSet{
            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.dynamicFont(fontSize: 18, weight: .semibold)
        }
    }
    var image : UIImage?
    var color : UIColor?
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.borderWidth = 2
        layer.borderColor = color?.cgColor
        isEnabled = true
        
        addSubview(configuration())
        configuration().snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(titleLabel!.snp.height)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configuration() -> UIView{
        let view = UIView()
        
        let iv = UIImageView()
        iv.image = image
        iv.tintColor = color

        view.addSubview(iv)
        iv.snp.makeConstraints { (make) in
            make.height.width.equalTo(view.frame.height/20)
            make.left.equalTo(view.snp.left)
        }
        
        titleLabel?.textColor = color
        
        view.addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(view.frame.height/135.3)
        })
        return view
    }
}
