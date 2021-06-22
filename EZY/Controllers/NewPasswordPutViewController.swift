//
//  NewPasswordPutViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/06/13.
//

import UIKit
import SnapKit
import Then

class NewPasswordPutViewController: UIViewController{
    //MARK: - Properties
    
    lazy var goBackButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_GoBackBtn"), for: .normal)
        $0.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    lazy var EZY_Logo = UIImageView().then {
        $0.image = UIImage(named: "EZY_LOGOTYPE_2")
    }
    
    lazy var toNewPassWordLabel = UILabel().then {
        $0.text = "새로운 비밀번호를"
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    lazy var putLabel = UILabel().then {
        $0.text = "입력해주세요."
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF, UIColor.rgba(red: 148, green: 139, blue: 255, alpha: 0.4)])
    }
    
    lazy var passwordContainerView: UIView = {
        let view = Utilities().inputContainerView(textField: passwordField, text: "비밀번호", fonts: 14)
        return view
    }()
    
    lazy var passwordField:UITextField = {
        let tf = Utilities().textField(withPlaceholder: "")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var passwordConstraintsLabel = UILabel().then {
        $0.text = "8자 이하, 영어 + 숫자최소 1개, 공백 허용x"
        $0.textColor = UIColor.EZY_747474
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    lazy var continueButton = UIButton().then {
        $0.setTitle("비밀번호 바꾸기", for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.setTitleColor(UIColor.EZY_FFFFFF, for: .normal)
        $0.backgroundColor = UIColor.EZY_968DFF
        $0.addTarget(self, action: #selector(onTapContinueNewPasswordPut), for: .touchUpInside)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc
    func goBack(){
        navigationController?.popViewController(animated: true )
    }
    
    @objc
    func onTapContinueNewPasswordPut(){
        print("DEBUG : Click bottom password change button Button")
    }

    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
    }
    
    func addView(){
        view.addSubview(goBackButton)
        view.addSubview(EZY_Logo)
        view.addSubview(toNewPassWordLabel)
        view.addSubview(putLabel)
        view.addSubview(passwordContainerView)
        view.addSubview(passwordConstraintsLabel)
        view.addSubview(continueButton)
    }
    
    func cornerRadius(){
        continueButton.layer.cornerRadius = self.view.frame.height/81.2
    }
    
    func location(){
        goBackButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/9.12)
            make.left.equalToSuperview().offset(self.view.frame.width/9.14)
            make.height.equalTo(self.view.frame.height/50.75)
            make.width.equalTo(self.view.frame.width/41.67)
        }
        
        EZY_Logo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/10.55)
            make.centerX.equalToSuperview()
            make.height.equalTo(self.view.frame.height/20.3)
            make.width.equalTo(self.view.frame.width/4.46)
        }
        
        toNewPassWordLabel.snp.makeConstraints { make in
            make.left.equalTo(passwordContainerView)
            make.top.equalTo(EZY_Logo).offset(self.view.frame.height/9.67)
        }
        
        putLabel.snp.makeConstraints { make in
            make.top.equalTo(toNewPassWordLabel).offset(self.view.frame.height/27.07)
            make.left.equalTo(passwordContainerView)
        }
        
        passwordContainerView.snp.makeConstraints { make in
            make.top.equalTo(putLabel).offset(self.view.frame.height/11.94)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.34)
            make.height.equalTo(self.view.frame.height/15.62)
        }
        
        passwordConstraintsLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordContainerView).offset(self.view.frame.height/13.53)
            make.left.equalTo(passwordContainerView)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(passwordContainerView).offset(self.view.frame.height/4.34)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.13)
            make.height.equalTo(self.view.frame.height/16.24)
        }
    }
}


//MARK: - Preview
#if DEBUG
import SwiftUI
struct NewPasswordPutViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        NewPasswordPutViewController()
    }
}
@available(iOS 13.0, *)
struct NewPasswordPutViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            NewPasswordPutViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif




