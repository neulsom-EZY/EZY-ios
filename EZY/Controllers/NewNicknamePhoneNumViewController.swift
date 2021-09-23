//
//  NewNicknamePhoneNumViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/09/11.
//

import UIKit
import SnapKit
import Then

class NewNicknamePhoneNumViewController: UIViewController{
    //MARK: - Properties
    
    let topBarView = TopBarView().then {
        $0.goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    lazy var toNewNicknameLabel = UILabel().then {
        $0.text = "새 닉네임을 위해"
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
        return tf
    }()
    
    lazy var certifiedButton = UIButton().then {
        $0.setTitle("번호인증", for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(UIColor.EZY_FFFFFF, for: .normal)
        $0.backgroundColor = UIColor.EZY_E3E3E3
        $0.addTarget(self, action: #selector(onTapcertified), for: .touchUpInside)
    }
    
    lazy var doNotMatchLabel = UILabel().then {
        $0.text = "일치하지 않는 전화번호입니다."
        $0.textColor = UIColor.EZY_FCA1A1
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var continueButton = CustomGradientContinueBtnView().then {
        $0.setTitle("닉네임 바꾸러 가기", for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapContinueNewNicknamePut), for: .touchUpInside)
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
    func onTapcertified(){
        print("DEBUG : Click bottom certified button Button")
    }
    
    @objc
    func onTapContinueNewNicknamePut(){
        let controller = NewNicknamePutViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        addView()
        topBarViewSetting()
        cornerRadius()
        location()
        
        doNotMatchLabel.isHidden = true
    }
    
    func addView(){
        view.addSubview(topBarView)
        view.addSubview(toNewNicknameLabel)
        view.addSubview(putPhoneNumLabel)
        view.addSubview(phoneNumContainerView)
        view.addSubview(certifiedButton)
        view.addSubview(doNotMatchLabel)
        view.addSubview(continueButton)
    }
    
    func cornerRadius(){
        certifiedButton.layer.cornerRadius = self.view.frame.height/75
        continueButton.layer.cornerRadius = self.view.frame.height/81.2
    }
    
    func location(){

        topBarView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(self.view.frame.height/7.19)
        }
        
        toNewNicknameLabel.snp.makeConstraints { make in
            make.left.equalTo(phoneNumContainerView)
            make.top.equalToSuperview().offset(self.view.frame.height/5.04)
        }
        
        putPhoneNumLabel.snp.makeConstraints { make in
            make.top.equalTo(toNewNicknameLabel).offset(self.view.frame.height/27.07)
            make.left.equalTo(phoneNumContainerView)
        }
        
        phoneNumContainerView.snp.makeConstraints { make in
            make.top.equalTo(putPhoneNumLabel).offset(self.view.frame.height/11.77)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.34)
            make.height.equalTo(self.view.frame.height/15.62)
        }
        
        certifiedButton.snp.makeConstraints { make in
            make.top.equalTo(putPhoneNumLabel).offset(self.view.frame.height/12.49)
            make.right.equalToSuperview().offset(self.view.frame.width/8.3 * -1)
            make.width.equalTo(self.view.frame.width/6.36)
            make.height.equalTo(self.view.frame.height/36.9)
        }
        
        doNotMatchLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumContainerView).offset(self.view.frame.height/13.76)
            make.left.equalTo(phoneNumContainerView)
        }
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/32.48)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.13)
            make.height.equalTo(self.view.frame.height/16.24)
        }
    }
    
    func topBarViewSetting(){
        topBarView.addSubview(topBarView.goBackButton)
        topBarView.addSubview(topBarView.EZY_Logo)
                       
        topBarView.topBarViewLayoutSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumField.resignFirstResponder()
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct NewNicknamePhoneNumViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        NewNicknamePhoneNumViewController()
    }
}
@available(iOS 13.0, *)
struct NewNicknamePhoneNumViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            NewNicknamePhoneNumViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

