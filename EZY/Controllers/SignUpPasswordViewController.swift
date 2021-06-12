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
    
    lazy var goBackButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_GoBackBtn"), for: .normal)
    }
    
    lazy var EZY_Logo = UIImageView().then {
        $0.image = UIImage(named: "EZY_LOGOTYPE_2")
    }
    
    lazy var putPasswordLabel = UILabel().then {
        $0.text = "비밀번호를\n입력해주세요."
        $0.numberOfLines = 2
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
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
        $0.setTitle("계속하기", for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.setTitleColor(UIColor.EZY_FFFFFF, for: UIControl.State.normal)
        $0.backgroundColor = UIColor.EZY_968DFF
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors

    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        view.addSubview(goBackButton)
        view.addSubview(EZY_Logo)
        view.addSubview(putPasswordLabel)
        view.addSubview(passwordContainerView)
        view.addSubview(passwordConstraintsLabel)
        view.addSubview(continueButton)
        
        continueButton.layer.cornerRadius = self.view.frame.width/31.5
        
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
        
        putPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(EZY_Logo).offset(self.view.frame.height/9.67)
            make.left.equalToSuperview().offset(self.view.frame.width/7.5)
        }
        
        passwordContainerView.snp.makeConstraints { make in
            make.top.equalTo(putPasswordLabel).offset(self.view.frame.height/8.29)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.34)
            make.height.equalTo(self.view.frame.height/15.62)
        }
        
        passwordConstraintsLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordContainerView).offset(self.view.frame.height/13.76)
            make.left.equalToSuperview().offset(self.view.frame.width/7.5)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(passwordConstraintsLabel).offset(self.view.frame.height/6.34)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.13)
            make.height.equalTo(self.view.frame.height/16.24)
        }
    }
}


//MARK: - Preview
#if DEBUG
import SwiftUI
struct SignUpPasswordViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpPasswordViewController()
    }
}
@available(iOS 13.0, *)
struct SignUpPasswordViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpPasswordViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif


