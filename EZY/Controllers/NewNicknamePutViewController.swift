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
        $0.text = "새로운 닉네임을"
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    private let putLabel = UILabel().then {
        $0.text = "입력해주세요."
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF, UIColor.rgba(red: 148, green: 139, blue: 255, alpha: 0.4)])
    }
    
    private let nicknameContainer = SignUpTextFieldContainerView()
    
    private let nicknameConstraintsLabel = UILabel().then {
        $0.text = "영어로 1 ~ 10자를 입력해주세요"
        $0.textColor = UIColor.EZY_747474
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    private let continueButton = CustomGradientContinueBtnView().then {
        $0.setTitle("닉네임 바꾸기", for: .normal)
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
    func goBack(){
        navigationController?.popViewController(animated: true )
    }
    
    @objc
    func onTapContinueNewNickname(){
        if isValidNickname(Nickname: nicknameContainer.tf.text) == true {
            let controller = LoginViewController()
            navigationController?.pushViewController(controller, animated: true)
        }else{
            shakeView(self.view)
        }
    }
    
    //MARK: - Helpers
    
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        topBarViewSetting()
        nicknameContainerViewSetting()
        cornerRadius()
        location()
    }
    
    private func addView(){
        view.addSubview(topBarView)
        view.addSubview(toNewNicknameLabel)
        view.addSubview(putLabel)
        view.addSubview(nicknameContainer)
        view.addSubview(nicknameConstraintsLabel)
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
            make.left.equalTo(nicknameContainer)
            make.top.equalToSuperview().offset(self.view.frame.height/5.04)
        }
        
        putLabel.snp.makeConstraints { make in
            make.top.equalTo(toNewNicknameLabel).offset(self.view.frame.height/27.07)
            make.left.equalTo(nicknameContainer)
        }
        
        nicknameContainer.snp.makeConstraints { make in
            make.top.equalTo(putLabel).offset(self.view.frame.height/11.94)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.34)
            make.height.equalTo(self.view.frame.height/15.62)
        }
        
        nicknameConstraintsLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameContainer).offset(self.view.frame.height/13.53)
            make.left.equalTo(nicknameContainer)
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
    
    //MARK: - nicknameContainerViewSetting
    
    private func nicknameContainerViewSetting(){
        nicknameContainer.addSubview(nicknameContainer.tfTitle)
        nicknameContainer.addSubview(nicknameContainer.tf)
        nicknameContainer.addSubview(nicknameContainer.divView)
        
        nicknameContainer.loginTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nicknameContainer.tf.resignFirstResponder()
    }
    
    private func shakeView(_ view: UIView?) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.08
        shake.repeatCount = 2
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! - 2, y: view?.center.y ?? 0.0))
        shake.toValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! + 2, y: view?.center.y ?? 0.0))
        view?.layer.add(shake, forKey: "position")
    }
    
    private func isValidNickname(Nickname: String?) -> Bool {
        guard Nickname != nil else { return false }
            
        let NicknameRegEx = ("[A-Za-z].{0,9}")
        let pred = NSPredicate(format:"SELF MATCHES %@", NicknameRegEx)
        return pred.evaluate(with: Nickname)
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct NewNicknamePutViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        NewNicknamePutViewController()
    }
}
@available(iOS 13.0, *)
struct NewNicknamePutViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            NewNicknamePutViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
