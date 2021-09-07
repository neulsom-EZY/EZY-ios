//
//  SignUpPhoneNumViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/06/13.
//

import UIKit
import SnapKit
import Then

class SignUpPhoneNumViewController: UIViewController{
    //MARK: - Properties
    
    let topBarView = TopBarView().then {
        $0.goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    lazy var putPhoneNumLabel = UILabel().then {
        $0.text = "전화번호\n인증을 해주세요."
        $0.numberOfLines = 2
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    lazy var phoneNumContainerView: UIView = {
        let view = Utilities().inputContainerView(textField: phoneNumField, text: "전화번호", fonts: 14)
        return view
    }()
    
    lazy var phoneNumField:UITextField = {
        let tf = Utilities().textField(withPlaceholder: "")
        return tf
    }()
    
    lazy var continueButton = CustomGradientContinueBtnView().then {
        $0.titleLabel?.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapContinueTerms), for: .touchUpInside)
    }
    
    lazy var certifiedButton = UIButton().then {
        $0.setTitle("번호인증", for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(UIColor.EZY_FFFFFF, for: .normal)
        $0.backgroundColor = UIColor.EZY_E3E3E3
        $0.addTarget(self, action: #selector(onTapcertified), for: .touchUpInside)
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
    func onTapContinueTerms(){
        let controller = SignUpTermsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    func onTapcertified(){
        print("DEBUG : Click bottom certified button Button")
    }

    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        addView()
        topBarViewSetting()
        cornerRadius()
        location()
    }
    
    func addView(){
        view.addSubview(topBarView)
        view.addSubview(putPhoneNumLabel)
        view.addSubview(phoneNumContainerView)
        view.addSubview(continueButton)
        view.addSubview(certifiedButton)
    }
    
    func cornerRadius(){
        continueButton.layer.cornerRadius = self.view.frame.height/81.2
        certifiedButton.layer.cornerRadius = self.view.frame.height/75
    }
    
    func location(){
        topBarView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(self.view.frame.height/7.19)
        }
        
        putPhoneNumLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.04)
            make.left.equalTo(phoneNumContainerView)
        }
        
        phoneNumContainerView.snp.makeConstraints { make in
            make.top.equalTo(putPhoneNumLabel).offset(self.view.frame.height/8.29)
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
            make.top.equalTo(putPhoneNumLabel).offset(self.view.frame.height/8.55)
            make.right.equalToSuperview().offset(self.view.frame.width/8.3 * -1)
            make.width.equalTo(self.view.frame.width/6.36)
            make.height.equalTo(self.view.frame.height/36.9)
        }
    }
    
    func topBarViewSetting(){
        topBarView.addSubview(topBarView.goBackButton)
        topBarView.addSubview(topBarView.EZY_Logo)
        
        topBarView.topBarViewLayoutSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
}


//MARK: - Preview
#if DEBUG
import SwiftUI
struct SignUpPhoneNumViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpPhoneNumViewController()
    }
}
@available(iOS 13.0, *)
struct SignUpPhoneNumViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpPhoneNumViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif


