//
//  SignUpTermsViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/06/14.
//

import UIKit
import SnapKit
import Then

class SignUpTermsViewController: UIViewController{
    //MARK: - Properties
    
    lazy var goBackButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_GoBackBtn"), for: .normal)
        $0.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    lazy var EZY_Logo = UIImageView().then {
        $0.image = UIImage(named: "EZY_LOGOTYPE_2")
    }
    
    lazy var agreeTermsLabel = UILabel().then {
        $0.text = "이용 약관에\n동의를 해주세요."
        $0.numberOfLines = 2
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    
    lazy var continueButton = UIButton().then {
        $0.setTitle("가입하기", for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.setTitleColor(UIColor.EZY_FFFFFF, for: .normal)
        $0.backgroundColor = UIColor.EZY_968DFF
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

    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        view.addSubview(goBackButton)
        view.addSubview(EZY_Logo)
        view.addSubview(agreeTermsLabel)
        view.addSubview(continueButton)

        continueButton.layer.cornerRadius = self.view.frame.width/37.5

        
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
        
        agreeTermsLabel.snp.makeConstraints { make in
            make.top.equalTo(EZY_Logo).offset(self.view.frame.height/9.67)
            make.left.equalTo(self.view.frame.width/7.5)
        }
        
//        continueButton.snp.makeConstraints { make in
//            make.top.equalTo(phoneNumContainerView).offset(self.view.frame.height/4.34)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(self.view.frame.width/1.13)
//            make.height.equalTo(self.view.frame.height/16.24)
//        }
        
    }
}


//MARK: - Preview
#if DEBUG
import SwiftUI
struct SignUpTermsViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpTermsViewController()
    }
}
@available(iOS 13.0, *)
struct SignUpTermsViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpTermsViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif


