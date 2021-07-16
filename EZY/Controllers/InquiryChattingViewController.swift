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
    
    lazy var chattingWriteLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
    }
    
    lazy var chattingWriteBackgroundView = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var chattingWriteTextFieldBackgroundView = UIView().then {
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1).cgColor
    }
    
    lazy var chattingWriteTextField = UITextField().then {
        $0.placeholder = "문의사항을 보내주세요"
        $0.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var inquirySendButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_InquirySendButton"), for: .normal)
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
        self.view.addSubview(chattingWriteLineView)
        self.view.addSubview(chattingWriteBackgroundView)
        chattingWriteBackgroundView.addSubview(chattingWriteTextFieldBackgroundView)
        chattingWriteTextFieldBackgroundView.addSubview(chattingWriteTextField)
        chattingWriteTextFieldBackgroundView.addSubview(inquirySendButton)
        
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
        
        chattingWriteBackgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(16.24)
        }
        
        chattingWriteLineView.snp.makeConstraints { make in
            make.height.equalTo(0.5)
            make.width.equalToSuperview()
            make.bottom.equalTo(chattingWriteBackgroundView.snp.top)
        }
        
        chattingWriteTextFieldBackgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.3)
            make.height.equalToSuperview().dividedBy(1.25)
            make.centerY.centerX.equalToSuperview()
            
            chattingWriteTextFieldBackgroundView.layer.cornerRadius = ((self.view.frame.height/16.24)/1.25)/2
        }
        
        inquirySendButton.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(1.37)
            make.width.equalTo(inquirySendButton.snp.height)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-self.view.frame.width/50.5)
        }
        
        chattingWriteTextField.snp.makeConstraints { make in
            make.centerY.centerX.height.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/20)
            make.right.equalToSuperview().offset(-self.view.frame.width/8)
        }
    }
}
