//
//  SwitchBtn.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/01.
//

import UIKit
import SnapKit
import Then

class SwitchBtn : UIButton{
    
    private let backview = UIView().then{
        $0.backgroundColor = .EZY_AFADFF
    }
    private let titleBtnView  = UIView().then{
        $0.backgroundColor = .red
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    func configureUI(){
        addSubview(backview)
        addSubview(titleBtnView)
        backview.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        titleBtnView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(titleBtnView.snp.height)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        backview.layer.cornerRadius = frame.height/2
        titleBtnView.layer.cornerRadius = titleBtnView.frame.height/2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
