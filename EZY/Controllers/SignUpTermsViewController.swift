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
    
    let topBarView = TopBarView().then {
        $0.goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    lazy var agreeTermsLabel = UILabel().then {
        $0.text = "이용 약관에\n동의를 해주세요."
        $0.numberOfLines = 2
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    lazy var allAgreeContainer = UIView().then {
        $0.backgroundColor = .EZY_FAFAFA
        $0.layer.borderColor = UIColor.EZY_E1E1E1.cgColor
        $0.layer.borderWidth = 1
    }
    
    lazy var allCheckBox = UIButton().then {
        $0.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
        $0.addTarget(self, action: #selector(AonTapButton), for: .touchUpInside)
    }
    
    lazy var allAgreeLabel = UILabel().then {
        $0.text = "모두 확인, 동의합니다."
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .EZY_AFAFAF
    }
    
    lazy var termsContainer = UIView().then {
        $0.backgroundColor = .EZY_FAFAFA
        $0.layer.borderColor = UIColor.EZY_E1E1E1.cgColor
        $0.layer.borderWidth = 1
    }
    
    lazy var checkBox1 = UIButton().then {
        $0.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
        $0.addTarget(self, action: #selector(onTapButton1), for: .touchUpInside)
    }
    
    lazy var firstMainTermLabel = UILabel().then {
        $0.text = "이용 약관 전체 동의 (필수)"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .EZY_AFAFAF
    }
    
    lazy var firstSubTermLabel1 = UILabel().then {
        $0.text = "[필수] EZY 개인정보 수집 및 이용 안내"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .EZY_AFAFAF
    }
    
    lazy var firstSubTermButton1 = UIButton().then {
        $0.setImage(UIImage(named: "EZY_TermButton"), for: .normal)
    }
    
    lazy var firstSubTermLabel2 = UILabel().then {
        $0.text = "[필수] EZY 개인정보 수집 및 이용 안내"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .EZY_AFAFAF
    }
    
    lazy var firstSubTermButton2 = UIButton().then {
        $0.setImage(UIImage(named: "EZY_TermButton"), for: .normal)
    }
    
    lazy var firstSubTermLabel3 = UILabel().then {
        $0.text = "[필수] EZY 개인정보 수집 및 이용 안내"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .EZY_AFAFAF
    }
    
    lazy var firstSubTermButton3 = UIButton().then {
        $0.setImage(UIImage(named: "EZY_TermButton"), for: .normal)
    }
    
    lazy var checkBox2 = UIButton().then {
        $0.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
        $0.addTarget(self, action: #selector(onTapButton2), for: .touchUpInside)
    }
    
    lazy var secondMainTermLabel = UILabel().then {
        $0.text = "이용 약관 전체 동의 (필수)"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .EZY_AFAFAF
    }
    
    lazy var secondSubTermLabel1 = UILabel().then {
        $0.text = "[필수] EZY 개인정보 수집 및 이용 안내"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .EZY_AFAFAF
    }
    
    lazy var secondSubTermButton1 = UIButton().then {
        $0.setImage(UIImage(named: "EZY_TermButton"), for: .normal)
    }
    
    lazy var secondSubTermLabel2 = UILabel().then {
        $0.text = "[필수] EZY 개인정보 수집 및 이용 안내"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .EZY_AFAFAF
    }
    
    lazy var secondSubTermButton2 = UIButton().then {
        $0.setImage(UIImage(named: "EZY_TermButton"), for: .normal)
    }
    
    lazy var secondSubTermLabel3 = UILabel().then {
        $0.text = "[필수] EZY 개인정보 수집 및 이용 안내"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .EZY_AFAFAF
    }
    
    lazy var secondSubTermButton3 = UIButton().then {
        $0.setImage(UIImage(named: "EZY_TermButton"), for: .normal)
    }
    
    lazy var locationTermContainer = UIView().then {
        $0.backgroundColor = .EZY_FFFFFF
        $0.layer.borderColor = UIColor.EZY_E1E1E1.cgColor
        $0.layer.borderWidth = 1
    }
    
    lazy var checkBox3 = UIButton().then {
        $0.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
        $0.addTarget(self, action: #selector(onTapButton3), for: .touchUpInside)
    }
    
    lazy var locationMainLabel = UILabel().then {
        $0.text = "위치기반서비스 동의 (선택)"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .EZY_AFAFAF
    }
    
    lazy var locationSubTermLabel = UILabel().then {
        $0.text = "[필수] EZY 개인정보 수집 및 이용 안내"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .EZY_AFAFAF
    }
    
    lazy var locationSubTermButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_TermButton"), for: .normal)
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
    
    lazy var flag1 = false
    lazy var flag2 = false
    lazy var flag3 = false
    lazy var AllFlag = false
    
    @objc
    func goBack(){
        navigationController?.popViewController(animated: true )
    }
    
    @objc
    func onTapButton1(){
        if flag1 == false {
            checkBox1.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            flag1 = true
            if flag2 == true && flag3 == true {
                allCheckBox.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
                AllFlag = true
            }
        } else if flag1 == true {
            checkBox1.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            allCheckBox.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            AllFlag = false
            flag1 = false
        }
    }
    
    @objc
    func onTapButton2(){
        if flag2 == false {
            checkBox2.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            flag2 = true
            if flag1 == true && flag3 == true {
                allCheckBox.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
                AllFlag = true
            }
        } else if flag2 == true {
            checkBox2.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            allCheckBox.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            AllFlag = false
            flag2 = false
        }
    }
    
    @objc
    func onTapButton3(){
        if flag3 == false {
            checkBox3.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            flag3 = true
            if flag1 == true && flag2 == true {
                allCheckBox.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
                AllFlag = true
            }
        } else if flag3 == true {
            checkBox3.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            allCheckBox.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            AllFlag = false
            flag3 = false
        }
    }
    
    @objc
    func AonTapButton(){
        if AllFlag == false {
            allCheckBox.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            checkBox1.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            checkBox2.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            checkBox3.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            flag1 = true
            flag2 = true
            flag3 = true
            AllFlag = true
        } else if AllFlag == true {
            allCheckBox.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            checkBox1.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            checkBox2.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            checkBox3.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            flag1 = false
            flag2 = false
            flag3 = false
            AllFlag = false
        }
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
        view.addSubview(agreeTermsLabel)
        view.addSubview(allAgreeContainer)
        view.addSubview(allCheckBox)
        view.addSubview(allAgreeLabel)
        view.addSubview(termsContainer)
        view.addSubview(checkBox1)
        view.addSubview(firstMainTermLabel)
        view.addSubview(firstSubTermLabel1)
        view.addSubview(firstSubTermButton1)
        view.addSubview(firstSubTermLabel2)
        view.addSubview(firstSubTermButton2)
        view.addSubview(firstSubTermLabel3)
        view.addSubview(firstSubTermButton3)
        view.addSubview(checkBox2)
        view.addSubview(secondMainTermLabel)
        view.addSubview(secondSubTermLabel1)
        view.addSubview(secondSubTermButton1)
        view.addSubview(secondSubTermLabel2)
        view.addSubview(secondSubTermButton2)
        view.addSubview(secondSubTermLabel3)
        view.addSubview(secondSubTermButton3)
        view.addSubview(locationTermContainer)
        view.addSubview(checkBox3)
        view.addSubview(locationMainLabel)
        view.addSubview(locationSubTermLabel)
        view.addSubview(locationSubTermButton)
        view.addSubview(continueButton)
    }
    
    func cornerRadius(){
        allAgreeContainer.layer.cornerRadius = self.view.frame.height/162.4
        termsContainer.layer.cornerRadius = self.view.frame.height/162.4
        locationTermContainer.layer.cornerRadius = self.view.frame.height/162.4
        continueButton.layer.cornerRadius = self.view.frame.height/81.2
    }
    
    func location(){
        
        topBarView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(self.view.frame.height/7.19)
        }
        
        agreeTermsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.04)
            make.left.equalTo(self.view.frame.width/7.5)
        }
        
        allAgreeContainer.snp.makeConstraints { make in
            make.top.equalTo(agreeTermsLabel).offset(self.view.frame.height/9.55)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.29)
            make.height.equalTo(self.view.frame.height/14.76)
        }
        
        allCheckBox.snp.makeConstraints { make in
            make.centerY.equalTo(allAgreeContainer)
            make.left.equalTo(allAgreeContainer).offset(self.view.frame.width/22.06)
            make.width.height.equalTo(self.view.frame.width/17.05)
        }
        
        allAgreeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(allAgreeContainer)
            make.left.equalToSuperview().offset(self.view.frame.width/3.95)
        }
        
        termsContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(allAgreeContainer).offset(self.view.frame.height/12.49)
            make.width.equalTo(allAgreeContainer)
            make.height.equalTo(self.view.frame.height/2.42)
        }
        
        checkBox1.snp.makeConstraints { make in
            make.top.equalTo(termsContainer).offset(self.view.frame.height/42.74)
            make.left.equalTo(termsContainer).offset(self.view.frame.width/22.06)
            make.width.height.equalTo(self.view.frame.width/17.05)
        }
        
        firstMainTermLabel.snp.makeConstraints { make in
            make.centerY.equalTo(checkBox1)
            make.left.equalTo(allAgreeLabel)
        }
        
        firstSubTermLabel1.snp.makeConstraints { make in
            make.left.equalTo(checkBox1)
            make.top.equalTo(checkBox1).offset(self.view.frame.height/20.82)
        }
        
        firstSubTermButton1.snp.makeConstraints { make in
            make.centerY.equalTo(firstSubTermLabel1)
            make.left.equalTo(firstSubTermLabel1).offset(self.view.frame.width/1.58)
        }
        
        firstSubTermLabel2.snp.makeConstraints { make in
            make.left.equalTo(firstSubTermLabel1)
            make.top.equalTo(firstSubTermLabel1).offset(self.view.frame.height/47.76)
        }
        
        firstSubTermButton2.snp.makeConstraints { make in
            make.centerY.equalTo(firstSubTermLabel2)
            make.left.equalTo(firstSubTermLabel2).offset(self.view.frame.width/1.58)
        }
        
        firstSubTermLabel3.snp.makeConstraints { make in
            make.left.equalTo(firstSubTermLabel2)
            make.top.equalTo(firstSubTermLabel2).offset(self.view.frame.height/47.76)
        }
        
        firstSubTermButton3.snp.makeConstraints { make in
            make.centerY.equalTo(firstSubTermLabel3)
            make.left.equalTo(firstSubTermLabel3).offset(self.view.frame.width/1.58)
        }
        
        checkBox2.snp.makeConstraints { make in
            make.left.equalTo(checkBox1)
            make.top.equalTo(firstSubTermLabel3).offset(self.view.frame.height/16.92)
        }
        
        secondMainTermLabel.snp.makeConstraints { make in
            make.centerY.equalTo(checkBox2)
            make.left.equalTo(allAgreeLabel)
        }
        
        secondSubTermLabel1.snp.makeConstraints { make in
            make.left.equalTo(checkBox2)
            make.top.equalTo(checkBox2).offset(self.view.frame.height/20.82)
        }
        
        secondSubTermButton1.snp.makeConstraints { make in
            make.centerY.equalTo(secondSubTermLabel1)
            make.left.equalTo(secondSubTermLabel1).offset(self.view.frame.width/1.58)
        }
        
        secondSubTermLabel2.snp.makeConstraints { make in
            make.left.equalTo(secondSubTermLabel1)
            make.top.equalTo(secondSubTermLabel1).offset(self.view.frame.height/47.76)
        }
        
        secondSubTermButton2.snp.makeConstraints { make in
            make.centerY.equalTo(secondSubTermLabel2)
            make.left.equalTo(secondSubTermLabel2).offset(self.view.frame.width/1.58)
        }
        
        secondSubTermLabel3.snp.makeConstraints { make in
            make.left.equalTo(secondSubTermLabel2)
            make.top.equalTo(secondSubTermLabel2).offset(self.view.frame.height/47.76)
        }
        
        secondSubTermButton3.snp.makeConstraints { make in
            make.centerY.equalTo(secondSubTermLabel3)
            make.left.equalTo(secondSubTermLabel3).offset(self.view.frame.width/1.58)
        }
        
        locationTermContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondSubTermLabel3).offset(self.view.frame.height/26.19)
            make.width.equalTo(self.view.frame.width/1.46)
            make.height.equalTo(self.view.frame.height/10.83)
        }
        
        checkBox3.snp.makeConstraints { make in
            make.top.equalTo(locationTermContainer).offset(self.view.frame.height/54.13)
            make.left.equalTo(locationTermContainer).offset(self.view.frame.width/22.06)
            make.width.height.equalTo(self.view.frame.width/17.05)
        }
        
        locationMainLabel.snp.makeConstraints { make in
            make.centerY.equalTo(checkBox3)
            make.left.equalTo(checkBox3).offset(self.view.frame.width/10.71)
        }
        
        locationSubTermLabel.snp.makeConstraints { make in
            make.left.equalTo(checkBox3)
            make.top.equalTo(locationMainLabel).offset(self.view.frame.height/24.61)
        }
        
        locationSubTermButton.snp.makeConstraints { make in
            make.centerY.equalTo(locationSubTermLabel)
            make.left.equalTo(locationSubTermLabel).offset(self.view.frame.width/1.71)
        }
        
        continueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(termsContainer).offset(self.view.frame.height/2.2)
            make.width.equalTo(self.view.frame.width/1.29)
            make.height.equalTo(self.view.frame.height/16.57)
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


