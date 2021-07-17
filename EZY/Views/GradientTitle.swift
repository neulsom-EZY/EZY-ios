//
//  GradientTitle.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/17.
//

import UIKit

class GradientTitle : UIView{
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
    private let view = UIView()
    private let titleLbl = UILabel().then{
        $0.dynamicFont(fontSize: 24, weight: .semibold)
        $0.textColor = .EZY_968DFF

    }
    private let subLbl = UILabel().then{
        $0.dynamicFont(fontSize: 20, weight: .semibold)
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF,.EZY_968DFF,.EZY_968DFF,.white])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(view)
        view.addSubview(titleLbl)
        view.addSubview(subLbl)

        titleLbl.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
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
