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
    private let tk = TokenUtils.shared
    final class API : APIService<KakaoDataModel>{
        //MARK: - SingleTon
        static let shared = APIService<KakaoDataModel>()
    }
    
    //MARK: - Properties
    private let authContext = LAContext()
    
    private let topView = TopView().then{
        $0.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        $0.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "회원 탈퇴", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
    }
    
    private let bgView = UIView()
    
    private let idNameLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "아이디/닉네임"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private let nameLineInputView = LineInputView().then{
        $0.dataSetting(titleText: "닉네임", placeHolderText: "닉네임을 입력해주세요", conditionText: "1~10자사이 영어로 입력해주세요!")
    }
    
    private let passwordLineInputView = LineInputView().then{
        $0.dataSetting(titleText: "비밀번호", placeHolderText: "비밀번호를 입력해주세요", conditionText: "영어 숫자 조합 8자 이상, 특수문자 가능, 공백 허용x")
    }
    
    private let withdrawalButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_ChangeButtonImage"), for: .normal)
        $0.setTitle("탈퇴하기", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
//        $0.addTarget(self, action: #selector(withdrawalButtonClicked(sender:)), for: .touchUpInside)
        $0.addTarget(self, action: #selector(okButtonClicked(sender:)), for: .touchUpInside)
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        location()
    }
    
<<<<<<< HEAD
    // MARK: - addView
    private func addView(){
        self.view.backgroundColor = .white
        [topView, nameLineInputView, passwordLineInputView, withdrawalButton].forEach { self.view.addSubview($0) }
=======
    @objc func okButtonClicked(sender:UIButton){
        let header = tk.getAuthorizationHeader(Bundle.bundleIdentifier)
        let param: Parameters = ["password": pwTextField.text!, "username": "@" + idTextField.text!]
        API.shared.request(url: "/v1/member/delete", method: .post, param: param, header: header, JSONDecodeUsingStatus: false){ result in
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
>>>>>>> 5e764f019799c33724997cb7f7c51db47eeec075
    }
    
    // MARK: - location
    private func location() {
        nameLineInputView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/17.65)
            make.height.equalToSuperview().dividedBy(13)
            make.centerX.equalToSuperview()
        }
        
        passwordLineInputView.snp.makeConstraints { make in
            make.top.equalTo(nameLineInputView.snp.bottom).offset(self.view.frame.height/17.65)
            make.height.width.equalTo(nameLineInputView)
            make.centerX.equalToSuperview()
        }
        
        withdrawalButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/15)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.centerY.equalToSuperview().offset(self.view.frame.height/40)
        }
        
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
    }
    
    // MARK: - Selectors
    @objc private func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func withdrawalButtonClicked(sender:UIButton){
        if isValidId(id: nameLineInputView.getInfoText()){
            if isValidPassword(password: passwordLineInputView.getInfoText()){
                let BasicModalVC = BasicModalViewController.instance()
                addDim()
                BasicModalVC.delegate = self
                BasicModalVC.baseDelegate = self
                present(BasicModalVC, animated: true, completion: nil)
                BasicModalVC.textSetting(colorText: "", contentText: "정말 탈퇴하시겠습니까?", sender: UIButton())
            }else{
                passwordLineInputView.checkInfoTextIsEmpty()
            }
        }else{
            nameLineInputView.checkInfoTextIsEmpty()
        }
    }
    
    // MARK: - isValidId
    private func isValidId(id: String?) -> Bool {
        guard id != nil else { return false }
        
        let idRegEx = "[A-Za-z]{1,10}"
        let pred = NSPredicate(format:"SELF MATCHES %@", idRegEx)
        return pred.evaluate(with: id)
    }
    
    // MARK: - isValidPassword
    private func isValidPassword(password: String?) -> Bool {
        guard password != nil else { return false }
            
        let PasswordRegEx = ("(?=.*[A-Za-z~!@#$%^&*])(?=.*[0-9]).{8,}")
        let pred = NSPredicate(format:"SELF MATCHES %@", PasswordRegEx)
        return pred.evaluate(with: password)
    }
    
    // MARK: - addDim
    private func addDim() {
        view.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.bgView.backgroundColor = .black.withAlphaComponent(0.15)
        }
    }
       
    // MARK: - removeDim
    private func removeDim() {
        DispatchQueue.main.async { [weak self] in
            self?.bgView.removeFromSuperview()
            self?.dismiss(animated: true)
        }
    }
}

extension WithdrawalViewController: BaseModalDelegate {
    func onTapClose() {
        removeDim()
    }
}

extension WithdrawalViewController: BasicModalViewButtonDelegate{
    func onTabOkButton(sender: UIButton) {
        removeDim()
        
        DispatchQueue.main.async { [weak self] in
            let nextVC = LoginViewController()
            self?.navigationController?.popToViewController(nextVC, animated: true)
        }
    }
}


//extension WithdrawalViewController: BaseModalDelegate {
//    func onTapClose() {
//        removeDim()
//        print("Asdf")
//    }
//}
//
//extension WithdrawalViewController: BasicModalViewButtonDelegate{
//    func onTabOkButton() {
//        removeDim()
//
//        var error: NSError?
//        if authContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
//
//            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: description) { success, error in
//                if success {
//                    print("인증성공")
//
//                    let vc = LoginViewController()
//                    self.navigationController?.popToViewController(vc, animated: true)
//                }else{
//                    print("인증실패")
//                    print(error?.localizedDescription)
//                }
//            }
//        }
//    }
//}
