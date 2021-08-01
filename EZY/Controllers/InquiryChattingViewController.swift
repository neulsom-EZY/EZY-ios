//
//  InquiryChattingViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/13.
//

import UIKit

class InquiryChattingViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Properties
    
    lazy var inquiryReceiveChattingBoxView = InquiryReceiveChattingBoxView()
    
    lazy var inquirySendChattingBoxView = InquirySendChattingBoxView()
    
    var recipientNameLabelColor: [UIColor] = [UIColor(red: 110/255, green: 98/255, blue: 255/255, alpha: 1), UIColor(red: 196/255, green: 191/255, blue: 255/255, alpha: 1)]
    
    lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_InquiryChattingBackButton"), for: .normal)
    }
    
    lazy var ezyProfileImageview = UIImageView().then {
        $0.image = UIImage(named: "EZY_EZYProfileImage")
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
        $0.setImage(UIImage(named: "EZY_InquirySendButtonImage"), for: .normal)
    }
    
    lazy var recipientNameLabel = UILabel().then {
        $0.text = "EZY - NEULSOM"
        $0.textColor = UIColor(red: 110/255, green: 98/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var responseTimeLabel = UILabel().then {
        $0.text = "보통 1시간 내에 응답합니다."
        $0.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var labelBoxView = UIView()
    
    lazy var onlineCircleView = UIView().then {
        $0.backgroundColor = UIColor(red: 93/255, green: 221/255, blue: 82/255, alpha: 1)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSetting()
        
        inquiryReceiveChattingBoxViewSetting()
        
        inquirySendChattingBoxViewSetting()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.chattingWriteTextField.resignFirstResponder()
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func inquirySendButtonClicked(sender:UIButton){
        inquirySendChattingBoxView.isHidden = false
        inquirySendChattingBoxView.chattingContentLabel.text = chattingWriteTextField.text
        
        chattingWriteTextField.text = ""
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        chattingWriteBackgroundView.frame.origin.y = (self.view.frame.height) - (chattingWriteBackgroundView.frame.height) - ((self.view.frame.height)-(self.view.safeAreaLayoutGuide.layoutFrame.height))/2.4
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        chattingWriteBackgroundView.frame.origin.y = self.view.frame.height/2
    }
    
    func inquirySendChattingBoxViewSetting(){
        self.view.addSubview(inquirySendChattingBoxView)
        inquirySendChattingBoxView.addSubview(inquirySendChattingBoxView.chattingBackgroundView)
        inquirySendChattingBoxView.chattingBackgroundView.addSubview(inquirySendChattingBoxView.chattingContentLabel)
        
        let gradient: CAGradientLayer = CAGradientLayer()

        gradient.colors = [UIColor(red: 185/255, green: 165/255, blue: 255/255, alpha: 1).cgColor, UIColor(red: 141/255, green: 135/255, blue: 255/255, alpha: 1).cgColor, UIColor(red: 167/255, green: 253/255, blue: 254/255, alpha: 1)]
        
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        

        self.inquirySendChattingBoxView.layer.insertSublayer(gradient, at: 0)
        inquirySendChattingBoxView.clipsToBounds = true
        
        inquirySendChattingBoxView.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner])
        
        inquirySendChattingBoxView.snp.makeConstraints { make in make.width.equalTo(inquirySendChattingBoxView.chattingContentLabel).offset(self.view.frame.width/17)
            make.right.equalToSuperview().offset(-self.view.frame.width/12)
            make.height.equalToSuperview().dividedBy(20)
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
        self.view.addSubview(chattingWriteBackgroundView)
        self.view.addSubview(labelBoxView)
        labelBoxView.addSubview(recipientNameLabel)
        labelBoxView.addSubview(responseTimeLabel)
        labelBoxView.addSubview(onlineCircleView)
        chattingWriteBackgroundView.addSubview(chattingWriteLineView)
        chattingWriteBackgroundView.addSubview(chattingWriteTextFieldBackgroundView)
        chattingWriteTextFieldBackgroundView.addSubview(chattingWriteTextField)
        chattingWriteTextFieldBackgroundView.addSubview(inquirySendButton)
        
        chattingWriteTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        inquirySendButton.addTarget(self, action: #selector(inquirySendButtonClicked(sender:)), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        
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
            make.top.equalTo(chattingWriteBackgroundView)
        }
        
        chattingWriteTextFieldBackgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.3)
            make.height.equalToSuperview().dividedBy(1.25)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(self.view.frame.height/70)
            
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
        
        labelBoxView.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.right.equalToSuperview()
            make.left.equalTo(backButton.snp.right).offset(self.view.frame.width/30)
            make.height.equalTo(backButton).multipliedBy(1.3)
        }
        
        recipientNameLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
        }
        
        responseTimeLabel.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview()
        }
        
        onlineCircleView.snp.makeConstraints { make in
            make.centerY.equalTo(recipientNameLabel)
            make.left.equalTo(recipientNameLabel.snp.right).offset(self.view.frame.width/60)
            make.height.equalToSuperview().dividedBy(4)
            make.width.equalTo(onlineCircleView.snp.height)
            
            onlineCircleView.layer.cornerRadius = 3
        }
    }
}
