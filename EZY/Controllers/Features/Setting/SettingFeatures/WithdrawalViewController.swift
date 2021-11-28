//
//  WithdrawalViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/13.
//

import UIKit
import LocalAuthentication
import Alamofire

class WithdrawalViewController: UIViewController {
    let tk = TokenUtils.shared
    final class Shared : APIService<KakaoDataModel>{
        //MARK: - SingleTon
        static let shared = APIService<KakaoDataModel>()
    }
    
    //MARK: - Properties
    let authContext = LAContext()
    
    lazy var topView = TopView()
    
    lazy var withdrawalModalView = WithdrawalModalView()
    
    lazy var idNameLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "아이디/닉네임"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var idTextField = UITextField().then {
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.placeholder = "아이디를 입력해주세요"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    lazy var idUnderLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var pwNameLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "비밀번호"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var showPasswordButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_eye"), for: .normal)
        $0.addTarget(self, action: #selector(EyeButtondClicked), for: .touchUpInside)
    }
    
    lazy var pwTextField = UITextField().then {
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    lazy var pwUnderLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var withdrawalButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_IdChangeButtonImage"), for: .normal)
        $0.setTitle("탈퇴하기", for: .normal)
        $0.alpha = 0.5
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
//        $0.addTarget(self, action: #selector(withdrawalButtonClicked(sender:)), for: .touchUpInside)
        $0.addTarget(self, action: #selector(okButtonClicked(sender:)), for: .touchUpInside)
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topViewSetting()
        
        layoutSetting()
        
        withdrawalModalViewSetting()
    }
    
    @objc func okButtonClicked(sender:UIButton){
        let header = tk.getAuthorizationHeader(Bundle.bundleIdentifier)
        let param: Parameters = ["password": pwTextField.text!, "username": idTextField.text!]
        Shared.shared.request(url: "/v1/member/delete", method: .post, param: param, header: header, JSONDecodeUsingStatus: false){ result in
            switch result{
            case .success(let data):
                print(data)
                self.tk.delete(Bundle.bundleIdentifier, account: "accessToken")
                self.tk.delete(Bundle.bundleIdentifier, account: "refreshToken")
                let nextViewController = LoginViewController()
                self.navigationController?.pushViewController(nextViewController, animated: true)
            case .requestErr(let err):
                print(err)
                break
            case .pathErr:
                print("pathErr")
                break
            case .serverErr:
                print("serverErr")
                break
            case .networkFail:
                print("networkFail")
                break
            case .tokenErr:
                print("tokenErr")
                break
            case .authorityErr:
                print("authorityErr")
                break
            }
        }
        
        
    }
    
    @objc func EyeButtondClicked(sender:UIButton){
        if pwTextField.isSecureTextEntry == true {
            pwTextField.isSecureTextEntry = false
        } else {
            pwTextField.isSecureTextEntry = true
        }
    }
    
    @objc func withdrawalButtonClicked(sender:UIButton){
        var error: NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {

            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: description) { success, error in
                if success {
                    print("인증성공")

                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                        self.withdrawalModalView.isHidden = false
                    }

                }else{
                    print("인증실패")
                    print(error?.localizedDescription)
                }
            }
        }
    }
    
    func withdrawalModalViewSetting() {
        self.view.addSubview(withdrawalModalView)
        
        withdrawalModalView.okButton.addTarget(self, action: #selector(okButtonClicked(sender:)), for: .touchUpInside)
        
        withdrawalModalView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        withdrawalModalView.shadowBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        withdrawalModalView.modalBackgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.13)
            make.height.equalToSuperview().dividedBy(3.59)
            make.centerX.centerY.equalToSuperview()
        }
        
        withdrawalModalView.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        withdrawalModalView.withdrawalCircleImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(self.view).dividedBy(17.27)
            make.width.equalTo(withdrawalModalView.withdrawalCircleImageView.snp.height)
            make.top.equalTo(withdrawalModalView.titleLabel.snp.bottom).offset(self.view.frame.height/33.8)
        }
        
        withdrawalModalView.withdrawalContentLabel.snp.makeConstraints { make in
            make.top.equalTo(withdrawalModalView.withdrawalCircleImageView.snp.bottom).offset(self.view.frame.height/40.6)
            make.centerX.equalToSuperview()
        }
        
        withdrawalModalView.okButton.snp.makeConstraints { make in
            make.bottom.equalTo(withdrawalModalView.noButton)
            make.right.equalTo(withdrawalModalView.noButton.snp.left).offset(-self.view.frame.width/35)
            make.height.width.equalTo(withdrawalModalView.noButton)
        }
        
        withdrawalModalView.noButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/30.6)
            make.right.equalToSuperview().offset(-self.view.frame.width/15)
            make.height.equalToSuperview().dividedBy(7.2)
            make.width.equalToSuperview().dividedBy(4.7)
        }
        
        withdrawalModalView.isHidden = true
        
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    func layoutSetting(){
        self.view.backgroundColor = .white
        self.view.addSubview(idNameLabel)
        self.view.addSubview(idTextField)
        self.view.addSubview(idUnderLineView)
        self.view.addSubview(pwNameLabel)
        self.view.addSubview(pwTextField)
        self.view.addSubview(pwUnderLineView)
        self.view.addSubview(withdrawalButton)
        self.view.addSubview(showPasswordButton)
        
        topView.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
                
        idNameLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.titleLabel.snp.bottom).offset(self.view.frame.height/16.91)
            make.left.equalTo(topView.titleLabel)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(idNameLabel.snp.bottom)
            make.left.equalTo(idNameLabel)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(27)
        }
        
        idUnderLineView.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom)
            make.left.equalTo(idTextField)
            make.centerX.equalToSuperview()
            make.height.equalTo(2)
        }
        
        pwNameLabel.snp.makeConstraints { make in
            make.top.equalTo(idUnderLineView.snp.bottom).offset(self.view.frame.height/16.91)
            make.left.equalTo(idUnderLineView)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(pwNameLabel.snp.bottom)
            make.left.equalTo(pwNameLabel)
            make.right.equalTo(pwUnderLineView).offset(-self.view.frame.width/20)
            make.height.equalToSuperview().dividedBy(27)
        }
        
        pwUnderLineView.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom)
            make.left.equalTo(pwTextField)
            make.centerX.equalToSuperview()
            make.height.equalTo(2)
        }
        
        withdrawalButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(-self.view.frame.height/23.8)
        }
        
        showPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(pwTextField)
            make.right.equalTo(pwUnderLineView)
            make.height.equalTo(self.view.frame.height/90.22*1.2)
            make.width.equalTo(self.view.frame.width/25*1.2)
        }
    }
    
    func topViewSetting(){
        self.view.addSubview(topView)
        topView.addSubview(topView.backButton)
        topView.addSubview(topView.titleLabel)
        
        topView.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        
        topView.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "회원 탈퇴", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
        
        topView.backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(topView.backButton.snp.width)
        }
        
        topView.titleLabel.snp.makeConstraints { make in
            make.left.equalTo(topView.backButton)
            make.top.equalTo(topView.backButton.snp.bottom).offset(self.view.frame.height/30)
        }
        
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
    }
    
    @objc //MARK: 모달 창 올리기
    func keyboardWillShow(_ sender: Notification) {
        withdrawalButton.frame.origin.y = self.view.frame.height/2
    }
    

    @objc //MARK: 모달 창 원래대로
    func keyboardWillHide(_ sender: Notification) {
        withdrawalButton.frame.origin.y = self.view.frame.height-withdrawalButton.frame.height-self.view.frame.height/23.8
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        idTextField.resignFirstResponder()
        pwTextField.resignFirstResponder()
    }
}
