//
//  SignUpAuthCodeViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/11/04.
//

import UIKit
import SnapKit
import Then

class SignUpAuthCodeViewController: UIViewController {
    //MARK: - Properties
    
    private let topBarView = TopBarView().then {
        $0.goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    private let putPhoneNumLabel = UILabel().then {
        $0.text = "전화번호\n인증을 완료해주세요."
        $0.numberOfLines = 2
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    private let continueButton = CustomGradientContinueBtnView().then {
        $0.titleLabel?.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapContinueTerms), for: .touchUpInside)
    }
    
    private let authCodeView = AuthCodeTextFieldView()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc
    private func goBack(){
        navigationController?.popViewController(animated: true )
    }
    
    @objc
    private func onTapContinueTerms(){
        let controller = SignUpTermsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    private func textDidChange(textfield: UITextField) {
        let text = textfield.text
        
        if text?.utf16.count == 1{
            switch textfield {
                
            case authCodeView.tf1:
                authCodeView.tf2.becomeFirstResponder()
                break
                
            case authCodeView.tf2:
                authCodeView.tf3.becomeFirstResponder()
                break
                
            case authCodeView.tf3:
                authCodeView.tf4.becomeFirstResponder()
                break
                
            default:
                break
                
            }
        }
        
        if text?.utf16.count == 0{
            switch textfield {
                
            case authCodeView.tf2:
                authCodeView.tf1.becomeFirstResponder()
                break
                
            case authCodeView.tf3:
                authCodeView.tf2.becomeFirstResponder()
                break
                
            case authCodeView.tf4:
                authCodeView.tf3.becomeFirstResponder()
                break
                
            default:
                break
                
            }
        }
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        authCodeViewSetting()
        topBarViewSetting()
        keyboardTypeSetting()
        addNotificationCenter()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    
    private func addView(){
        view.addSubview(topBarView)
        view.addSubview(putPhoneNumLabel)
        view.addSubview(continueButton)
        view.addSubview(authCodeView)
    }
    
    // MARK: - Corner Radius
    
    private func cornerRadius(){
        continueButton.layer.cornerRadius = self.view.frame.height/81.2
    }
    
    // MARK: - Location
    
    private func location(){
        topBarView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(self.view.frame.height/7.19)
        }
        
        putPhoneNumLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.04)
            make.left.equalToSuperview().offset(self.view.frame.width/7.5)
        }
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/32.48)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.13)
            make.height.equalTo(self.view.frame.height/16.24)
        }
        
        authCodeView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/2.9)
            make.width.equalToSuperview().dividedBy(1.79)
            make.height.equalToSuperview().dividedBy(10.98)
        }
    }
    
    //MARK: - textField Point Set
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        authCodeView.tf1.resignFirstResponder()
        authCodeView.tf2.resignFirstResponder()
        authCodeView.tf3.resignFirstResponder()
        authCodeView.tf4.resignFirstResponder()
    }
    
    //MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        authCodeView.tf1.becomeFirstResponder()
    }
    
    //MARK: - topBarViewSetting
    
    private func topBarViewSetting(){
        topBarView.addSubview(topBarView.goBackButton)
        topBarView.addSubview(topBarView.EZY_Logo)
        
        topBarView.topBarViewLayoutSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    //MARK: - authCodeViewSetting
    
    private func authCodeViewSetting(){
        authCodeView.tf1.addTarget(self, action: #selector(self.textDidChange(textfield:)), for: UIControl.Event.editingChanged)
        authCodeView.tf2.addTarget(self, action: #selector(self.textDidChange(textfield:)), for: UIControl.Event.editingChanged)
        authCodeView.tf3.addTarget(self, action: #selector(self.textDidChange(textfield:)), for: UIControl.Event.editingChanged)
        authCodeView.tf4.addTarget(self, action: #selector(self.textDidChange(textfield:)), for: UIControl.Event.editingChanged)
    }
    
    //MARK: - KeyboardType Setting
    
    private func keyboardTypeSetting(){
        authCodeView.tf1.keyboardType = .phonePad
        authCodeView.tf2.keyboardType = .phonePad
        authCodeView.tf3.keyboardType = .phonePad
        authCodeView.tf4.keyboardType = .phonePad
    }
    
    //MARK: - Add NotificationCenter
    
    private func addNotificationCenter(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - KeyboardWillShow -> continueButton Up
    @objc
    private func keyboardWillShow(_ sender: Notification) {
        var keyboardHeight: CGFloat = CGFloat(0) //keyboardHeight
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
        }
        continueButton.snp.remakeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(-keyboardHeight - self.view.frame.height/32.48)
        }
    }
    
    //MARK: - KeyboardWillHide -> continueButton Down
    @objc
    private func keyboardWillHide(_ sender: Notification) {
        continueButton.snp.remakeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(self.view.frame.height/32.48 * -1)
        }
    }
}



