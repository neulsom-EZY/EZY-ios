//
//  InquiryChattingViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/13.
//

import UIKit

class InquiryChattingViewController: UIViewController {

    //MARK: - Properties
    
    lazy var inquiryReceiveChattingBoxView = InquiryReceiveChattingBoxView()
    
    lazy var inquirySendChattingBoxView = InquirySendChattingBoxView()
    
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
        
        inquiryReceiveChattingBoxViewSetting()
        
        inquirySendChattingBoxViewSetting()
        

    }
    
    @objc func inquirySendButtonClicked(sender:UIButton){
        inquirySendChattingBoxView.isHidden = false
        inquirySendChattingBoxView.chattingContentLabel.text = chattingWriteTextField.text
        chattingWriteTextField.text = ""
    }
    
    func inquirySendChattingBoxViewSetting(){
        self.view.addSubview(inquirySendChattingBoxView)
        inquirySendChattingBoxView.addSubview(inquirySendChattingBoxView.chattingBackgroundView)
        inquirySendChattingBoxView.chattingBackgroundView.addSubview(inquirySendChattingBoxView.chattingContentLabel)
        
        let gradient: CAGradientLayer = CAGradientLayer()

        gradient.colors = [UIColor(red: 164/255, green: 138/255, blue: 255/255, alpha: 1).cgColor, UIColor(red: 141/255, green: 135/255, blue: 255/255, alpha: 1).cgColor, UIColor(red: 167/255, green: 253/255, blue: 254/255, alpha: 1)]
        
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        

        self.inquirySendChattingBoxView.layer.insertSublayer(gradient, at: 0)
        inquirySendChattingBoxView.clipsToBounds = true
        
        inquirySendChattingBoxView.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner])
        
        inquirySendChattingBoxView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/12)
            make.height.equalToSuperview().dividedBy(20)
            make.width.equalTo(inquirySendChattingBoxView.chattingContentLabel).multipliedBy(1.2)
            make.top.equalTo(inquiryReceiveChattingBoxView.snp.bottom).offset(self.view.frame.height/54.1)
        }
        
        inquirySendChattingBoxView.chattingBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        inquirySendChattingBoxView.chattingContentLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
        inquirySendChattingBoxView.isHidden = true

    }
    
    func inquiryReceiveChattingBoxViewSetting(){
        self.view.addSubview(inquiryReceiveChattingBoxView)
        inquiryReceiveChattingBoxView.addSubview(inquiryReceiveChattingBoxView.chattingBackgroundView)
        inquiryReceiveChattingBoxView.chattingBackgroundView.addSubview(inquiryReceiveChattingBoxView.chattingContentLabel)
        
        inquiryReceiveChattingBoxView.snp.makeConstraints { make in
            make.left.equalTo(ezyProfileImageview.snp.right).offset(self.view.frame.width/26.7)
            make.height.equalToSuperview().dividedBy(20)
            make.width.equalTo(inquiryReceiveChattingBoxView.chattingContentLabel).multipliedBy(1.2)
            make.top.equalTo(ezyProfileImageview)
        }
        
        inquiryReceiveChattingBoxView.chattingBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        inquiryReceiveChattingBoxView.chattingContentLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
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
        
        inquirySendButton.addTarget(self, action: #selector(inquirySendButtonClicked(sender:)), for: .touchUpInside)
        
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
