//
//  GradientTitle.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/17.
//

import UIKit

class GradientTitle : UIView{
    private let titleLbl = UILabel().then{
        $0.dynamicFont(fontSize: 24, weight: .semibold)
        $0.textColor = .EZY_968DFF

    }
    private lazy var subLbl = UILabel().then{
        $0.dynamicFont(fontSize: 20, weight: .semibold)
    }
    var title: String?{
        didSet{
            titleLbl.text = title
            
        }
    }
    var subTitle : String?{
        didSet{
            subLbl.text = subTitle
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLbl)
        addSubview(subLbl)
        subLbl.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF,.white])

        titleLbl.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top)
            make.left.equalToSuperview()
        }
        subLbl.snp.makeConstraints { (make) in
            make.top.equalTo(titleLbl.snp.bottom)
            make.left.equalTo(titleLbl.snp.left)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
