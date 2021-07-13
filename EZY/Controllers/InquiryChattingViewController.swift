//
//  InquiryChattingViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/13.
//

import UIKit

class InquiryChattingViewController: UIViewController {

    //MARK: - Properties
    lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_InquiryChattingBackButton"), for: .normal)
    }
    
    lazy var ezyProfileImageview = UIImageView().then {
        $0.image = UIImage(named: "EZY_InquiryChattingCircleView")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSetting()
    }
    
    func layoutSetting() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(backButton)
        self.view.addSubview(ezyProfileImageview)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        ezyProfileImageview.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.width.equalToSuperview().dividedBy(9.8)
            make.height.equalTo(ezyProfileImageview.snp.width)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/24.6)
        }
    }
}
