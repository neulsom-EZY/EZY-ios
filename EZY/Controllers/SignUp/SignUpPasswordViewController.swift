//
//  SignUpPasswordViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/06/12.
//

import UIKit
import SnapKit
import Then

class SignUpPasswordViewController: UIViewController{
    //MARK: - Properties
    
    private let topBarView = TopBarView().then {
        $0.goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    private let putPasswordLabel = UILabel().then {
        $0.text = "비밀번호를\n입력해주세요."
        $0.numberOfLines = 2
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    private let passwordContainer = SignUpTextFieldContainerView().then {
        $0.tfTitle.text = "비밀번호"
        $0.tf.isSecureTextEntry = true
    }
    
    private let passwordConstraintsLabel = UILabel().then {
        $0.text = "8자 이하, 영어 + 숫자최소 1개, 공백 허용x"
        $0.textColor = UIColor.EZY_747474
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    private let continueButton = CustomGradientContinueBtnView().then {
        $0.titleLabel?.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapContinuePhoneNum), for: .touchUpInside)
    }
    
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
    private func onTapContinuePhoneNum(){
        if isValidPassword(Password: passwordContainer.tf.text) == true{
            let controller = SignUpPhoneNumViewController()
            navigationController?.pushViewController(controller, animated: true)
        }else{
            shakeView(self.view)
        }
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        topBarViewSetting()
        passwordContainerViewSetting()
        keyboardTypeSetting()
        cornerRadius()
        location()
        addNotificationCenter()
    }
    
    private func addView(){
        view.addSubview(topBarView)
        view.addSubview(putPasswordLabel)
        view.addSubview(passwordContainer)
        view.addSubview(passwordConstraintsLabel)
        view.addSubview(continueButton)
    }
    
    private func cornerRadius(){
        continueButton.layer.cornerRadius = self.view.frame.height/81.2
    }
    
    private func location(){
        topBarView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(self.view.frame.height/7.19)
        }
        
        putPasswordLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.04)
            make.left.equalTo(passwordContainer)
        }
        
        passwordContainer.snp.makeConstraints { make in
            make.top.equalTo(putPasswordLabel).offset(self.view.frame.height/8.29)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.34)
            make.height.equalTo(self.view.frame.height/15.62)
        }
        
        passwordConstraintsLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordContainer).offset(self.view.frame.height/13.76)
            make.left.equalTo(passwordContainer)
        }
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/32.48)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.13)
            make.height.equalTo(self.view.frame.height/16.24)
        }
    }
    
    //MARK: - topBarViewSetting
    
    private func topBarViewSetting(){
        topBarView.addSubview(topBarView.goBackButton)
        topBarView.addSubview(topBarView.EZY_Logo)
        
        topBarView.topBarViewLayoutSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    //MARK: - passwordContainerViewSetting

    private func passwordContainerViewSetting(){
        passwordContainer.addSubview(passwordContainer.tfTitle)
        passwordContainer.addSubview(passwordContainer.tf)
        passwordContainer.addSubview(passwordContainer.divView)
        
        passwordContainer.loginTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    //MARK: - KeyboardType Setting
    
    private func keyboardTypeSetting(){
        passwordContainer.tf.keyboardType = .asciiCapable
    }
    
    //MARK: - textField Point Set
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        passwordContainer.tf.resignFirstResponder()
    }
    
    //MARK: - Add NotificationCenter
    
    private func addNotificationCenter(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - shakeAnimation
    
    private func shakeView(_ view: UIView?) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.08
        shake.repeatCount = 2
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! - 2, y: view?.center.y ?? 0.0))
        shake.toValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! + 2, y: view?.center.y ?? 0.0))
        view?.layer.add(shake, forKey: "position")
    }
    
    //MARK: - Password Test
        
    private func isValidPassword(Password: String?) -> Bool {
        guard Password != nil else { return false }
            
        let PasswordRegEx = ("(?=.*[A-Za-z~!@#$%^&*])(?=.*[0-9]).{8,}")
        let pred = NSPredicate(format:"SELF MATCHES %@", PasswordRegEx)
        return pred.evaluate(with: Password)
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

