//
//  LoginViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/06/10.
//

import UIKit
import SnapKit
import Then

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
        $0.textColor = UIColor.rgb(red: 0, green: 0, blue: 0)
    }
    
    lazy var textLabel = UILabel().then {
        $0.text = "자신만의 라이프스타일\n역사를 쓰고 있습니다."
        $0.numberOfLines = 2
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor.rgb(red: 0, green: 0, blue: 0)
    }
    
    lazy var nicknameLabel = UILabel().then{
        $0.text = "닉네임"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    lazy var passwordLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    lazy var nicknameContainerView: UIView = {
        let view = Utilities().inputContainerView(textField: nicknameField, text: "닉네임", fonts: 10)
        return view
    }()
    
    lazy var passwordContainerView: UIView = {
        let view = Utilities().inputContainerView(textField: passwordField, text: "비밀번호", fonts: 10)
        
        return view
    }()
    
    lazy var nicknameField:UITextField = {
        let tf = Utilities().textField(withPlaceholder: "닉네임을 입력해주세요.")
        return tf
    }()

    lazy var passwordField:UITextField = {
        let tf = Utilities().textField(withPlaceholder: "비밀번호를 입력해주세요.")
        tf.isSecureTextEntry = true
        
        return tf
    }()
    
    lazy var showPasswordButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_eye"), for: .normal)
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
        view.addSubview(titleLabel)
        view.addSubview(subLabel)
        view.addSubview(textLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/6.6)
            make.left.equalToSuperview().offset(47)
        }
        
        subLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/6.05)
            make.right.equalTo(titleLabel).offset(22)
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalTo(subLabel).offset(self.view.frame.height/27.06)
            make.left.equalToSuperview().offset(47)
        }
        
        view.addSubview(nicknameContainerView)
        nicknameContainerView.snp.makeConstraints { make in
            make.bottom.equalTo(textLabel).offset(self.view.frame.height/7.44)
            make.left.equalToSuperview().offset(47)
            make.height.equalTo(self.view.frame.height/16.57)
            make.width.equalTo(self.view.frame.width/1.33)
        }
        
        view.addSubview(passwordContainerView)
        passwordContainerView.snp.makeConstraints { make in
            make.bottom.equalTo(nicknameContainerView).offset(self.view.frame.height/10.68)
            make.left.equalToSuperview().offset(47)
            make.height.equalTo(self.view.frame.height/16.57)
            make.width.equalTo(self.view.frame.width/1.33)
        }
        
        view.addSubview(showPasswordButton)
        showPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField).offset(self.view.frame.height/95.53)
            make.right.equalToSuperview().offset(self.view.frame.width/7.5 * -1)
        }
        
        
       
    }

}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        LoginViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif


