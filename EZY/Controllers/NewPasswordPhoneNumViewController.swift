//
//  NewPasswordPhoneNumViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/06/13.
//

import UIKit
import SnapKit
import Then

class NewPasswordPhoneNumViewController: UIViewController{
    //MARK: - Properties
    
    lazy var goBackButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_GoBackBtn"), for: .normal)
    }
    
    lazy var EZY_Logo = UIImageView().then {
        $0.image = UIImage(named: "EZY_LOGOTYPE_2")
    }
    
    lazy var toNewPassWordLabel = UILabel().then {
        $0.text = "새 비밀번호를 위해"
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    lazy var putPhoneNumLabel = UILabel().then {
        $0.text = "전화번호를 입력해주세요."
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF, UIColor.rgba(red: 148, green: 139, blue: 255, alpha: 0.4)])
    }
    
    lazy var phoneNumContainerView: UIView = {
        let view = Utilities().inputContainerView(textField: phoneNumField, text: "전화번호", fonts: 14)
        return view
    }()
    
    lazy var phoneNumField:UITextField = {
        let tf = Utilities().textField(withPlaceholder: "")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var continueButton = UIButton().then {
        $0.setTitle("비밀번호 바꾸러 가기", for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.setTitleColor(UIColor.EZY_FFFFFF, for: .normal)
        $0.backgroundColor = UIColor.EZY_968DFF
    }
    
    lazy var certifiedButton = UIButton().then {
        $0.setTitle("번호인증", for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(UIColor.EZY_FFFFFF, for: .normal)
        $0.backgroundColor = UIColor.EZY_E3E3E3
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
        view.addSubview(toNewPassWordLabel)
        view.addSubview(putPhoneNumLabel)
        view.addSubview(phoneNumContainerView)
        view.addSubview(continueButton)
        view.addSubview(certifiedButton)
        
        continueButton.layer.cornerRadius = self.view.frame.width/37.5
        certifiedButton.layer.cornerRadius = self.view.frame.width/30
        
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
            make.left.equalTo(putPhoneNumLabel)
            make.top.equalTo(EZY_Logo).offset(self.view.frame.height/9.67)
        }
        
        putPhoneNumLabel.snp.makeConstraints { make in
            make.top.equalTo(toNewPassWordLabel).offset(self.view.frame.height/27.07)
            make.left.equalToSuperview().offset(self.view.frame.width/7.5)
        }
        
        phoneNumContainerView.snp.makeConstraints { make in
            make.top.equalTo(putPhoneNumLabel).offset(self.view.frame.height/11.77)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.34)
            make.height.equalTo(self.view.frame.height/15.62)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(phoneNumContainerView).offset(self.view.frame.height/4.34)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.13)
            make.height.equalTo(self.view.frame.height/16.24)
        }
        
        certifiedButton.snp.makeConstraints { make in
            make.top.equalTo(putPhoneNumLabel).offset(self.view.frame.height/12.49)
            make.right.equalToSuperview().offset(self.view.frame.width/8.3 * -1)
            make.width.equalTo(self.view.frame.width/6.36)
            make.height.equalTo(self.view.frame.height/36.9)
        }
    }
}


//MARK: - Preview
#if DEBUG
import SwiftUI
struct NewPasswordPhoneNumViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        NewPasswordPhoneNumViewController()
    }
}
@available(iOS 13.0, *)
struct NewPasswordPhoneNumViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            NewPasswordPhoneNumViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif




