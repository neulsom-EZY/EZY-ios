//
//  NewNicknamePutViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/09/11.
//

import UIKit
import SnapKit
import Then

class NewNicknamePutViewController: UIViewController{
    //MARK: - Properties
    
    private let topBarView = TopBarView().then {
        $0.goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    private let toNewNicknameLabel = UILabel().then {
        $0.text = "회원님의"
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    private let putLabel = UILabel().then {
        $0.text = "닉네임이에요!"
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF, UIColor.rgba(red: 148, green: 139, blue: 255, alpha: 0.4)])
    }
    
    private let continueButton = CustomGradientContinueBtnView().then {
        $0.setTitle("로그인 하러 가기", for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapContinueNewNickname), for: .touchUpInside)
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
    private func onTapContinueNewNickname(){
        let controller = LoginViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Helpers
    
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        topBarViewSetting()
        cornerRadius()
        location()
    }
    
    private func addView(){
        view.addSubview(topBarView)
        view.addSubview(toNewNicknameLabel)
        view.addSubview(putLabel)
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
        
        toNewNicknameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/7.5)
            make.top.equalToSuperview().offset(self.view.frame.height/5.04)
        }
        
        putLabel.snp.makeConstraints { make in
            make.top.equalTo(toNewNicknameLabel).offset(self.view.frame.height/27.07)
            make.left.equalTo(toNewNicknameLabel)
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
    
}
