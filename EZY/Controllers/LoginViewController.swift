//
//  LoginViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/06/10.
//


import UIKit
import Then
import SnapKit

class LoginViewController: UIViewController{
    //MARK: - Properties
    
    lazy var titleLabel = UILabel().then {
        $0.text = "EZY"
        $0.dynamicFont(fontSize: 38, currentFontName: "AppleSDGothicNeo-Bold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_C9BCFF, .EZY_6B40FF])
    }
    
    lazy var subLabel = UILabel().then {
        $0.text = "는"
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor.EZY_000000
    }
    
    lazy var textLabel = UILabel().then {
        $0.text = "자신만의 라이프스타일\n역사를 쓰고 있습니다."
        $0.numberOfLines = 2
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor.EZY_000000
    }
    
    lazy var nicknameContainer = LoginTextFieldContainerView()
    
    lazy var passwordContainer = LoginTextFieldContainerView().then {
        $0.tfTitle.text = "비밀번호"
        $0.tf.placeholder = "비밀번호를 입력해주세요."
        $0.tf.isSecureTextEntry = true
    }
    
    lazy var showPasswordButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_eye"), for: .normal)
        $0.addTarget(self, action: #selector(onTapEyeButton), for: .touchUpInside)
    }
    
    lazy var forgotPasswordButton = UIButton().then {
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.setTitleColor(UIColor.EZY_B2B2B2, for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapForgotPassword), for: .touchUpInside)
    }
    
    lazy var forgotNicknameButton = UIButton().then {
        $0.setTitle("닉네임을 잊으셨나요?", for: .normal)
        $0.setTitleColor(UIColor.EZY_B2B2B2, for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapForgotNickname), for: .touchUpInside)
    }
    
    lazy var doNotHaveAccountButton = UIButton().then {
        $0.setTitle("아직 회원이 아니신가요?", for: .normal)
        $0.setTitleColor(UIColor.EZY_B2B2B2, for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapSignUp), for: .touchUpInside)
    }
    
    lazy var loginButton = CustomGradientLoginBtnView().then {
        $0.titleLabel?.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
    }
    
    lazy var notCorrectLabel = UILabel().then {
        $0.text = "닉네임과 비밀번호가 올바르지 않습니다!"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_FCA1A1
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors

    @objc
    func onTapEyeButton(){
        if passwordContainer.tf.isSecureTextEntry == true {
            passwordContainer.tf.isSecureTextEntry = false
        } else {
            passwordContainer.tf.isSecureTextEntry = true
        }
    }
    
    @objc
    func onTapForgotNickname(){
        let controller = NewNicknamePhoneNumViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    func onTapForgotPassword(){
        let controller = NewPasswordPhoneNumViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    func onTapSignUp(){
        let controller = SignUpNicknameViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    func onTapLogin(){
        print("DEBUG : Click bottom login button Button")
        let controller = ShowPlanViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        
        nicknameContainerViewSetting()
        passwordContainerViewSetting()
        
        addView()
        cornerRadius()
        location()
    }
    
    func addView(){
        view.addSubview(titleLabel)
        view.addSubview(subLabel)
        view.addSubview(textLabel)
        view.addSubview(nicknameContainer)
        view.addSubview(passwordContainer)
        view.addSubview(showPasswordButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(forgotNicknameButton)
        view.addSubview(doNotHaveAccountButton)
        view.addSubview(loginButton)
    }
    
    func cornerRadius(){
        loginButton.layer.cornerRadius = self.view.frame.height/81.2
    }
    
    func location(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/6.6)
            make.left.equalToSuperview().offset(self.view.frame.width/7.98)
        }
        
        subLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/6.05)
            make.right.equalTo(titleLabel).offset(self.view.frame.width/17.05)
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalTo(subLabel).offset(self.view.frame.height/27.06)
            make.left.equalToSuperview().offset(self.view.frame.width/7.98)
        }
        
        nicknameContainer.snp.makeConstraints { make in
            make.bottom.equalTo(textLabel).offset(self.view.frame.height/7.44)
            make.centerX.equalToSuperview()
            make.height.equalTo(self.view.frame.height/16.57)
            make.width.equalTo(self.view.frame.width/1.33)
        }

        passwordContainer.snp.makeConstraints { make in
            make.bottom.equalTo(nicknameContainer).offset(self.view.frame.height/10.68)
            make.centerX.equalToSuperview()
            make.height.equalTo(self.view.frame.height/16.57)
            make.width.equalTo(self.view.frame.width/1.33)
        }
        
        showPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordContainer.tf)
            make.right.equalTo(passwordContainer)
            make.height.equalTo(self.view.frame.height/90.22)
            make.width.equalTo(self.view.frame.width/25)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.bottom.equalTo(passwordContainer).offset(self.view.frame.height/30.07)
            make.left.equalToSuperview().offset(self.view.frame.width/7.98)
        }
        
        forgotNicknameButton.snp.makeConstraints { make in
            make.bottom.equalTo(passwordContainer).offset(self.view.frame.height/30.07)
            make.right.equalToSuperview().offset(self.view.frame.width/7.98 * -1)
        }
       
        doNotHaveAccountButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(self.view.frame.height/12.3 * -1)
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(forgotPasswordButton).offset(self.view.frame.height/11.6)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.34)
            make.height.equalTo(self.view.frame.height/16.24)
        }

    }
    
    //MARK: - nicknameContainerViewSetting
    
    func nicknameContainerViewSetting(){
        nicknameContainer.addSubview(nicknameContainer.tfTitle)
        nicknameContainer.addSubview(nicknameContainer.tf)
        nicknameContainer.addSubview(nicknameContainer.divView)
        
        nicknameContainer.loginTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    //MARK: - passwordContainerViewSetting

    func passwordContainerViewSetting(){
        passwordContainer.addSubview(passwordContainer.tfTitle)
        passwordContainer.addSubview(passwordContainer.tf)
        passwordContainer.addSubview(passwordContainer.divView)
        
        passwordContainer.loginTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nicknameContainer.tf.resignFirstResponder()
        passwordContainer.tf.resignFirstResponder()
    }

}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct LoginViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        LoginViewController()

    }

}
@available(iOS 13.0, *)
struct LoginViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            LoginViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif



