//
//  NewPasswordPhoneNumViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/06/13.
//

import UIKit
import SnapKit
import Then
import Alamofire

class NewPasswordPhoneNumViewController: UIViewController{
    //MARK: - Properties
    var nickname:String = ""

    final class Shared : APIService<KakaoDataModel>{
        //MARK: - SingleTon
        static let shared = APIService<KakaoDataModel>()
    }
    
    private let topBarView = TopBarView().then {
        $0.goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    private let toNewPassWordLabel = UILabel().then {
        $0.text = "새 비밀번호를 위해"
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    private let putPhoneNumLabel = UILabel().then {
        $0.text = "전화번호를 입력해주세요."
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF, UIColor.rgba(red: 148, green: 139, blue: 255, alpha: 0.4)])
    }
    
    private let phoneNumContainer = SignUpTextFieldContainerView().then {
        $0.tfTitle.text = "전화번호"
    }
    
    private let continueButton = CustomGradientContinueBtnView().then {
        $0.setTitle("전화번호 인증하기", for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapContinueNewPasswordPut), for: .touchUpInside)
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
    private func onTapContinueNewPasswordPut(){
        if isValidPhoneNum(PhoneNumber: phoneNumContainer.tf.text) == true{
            let param: Parameters = ["phoneNumber": phoneNumContainer.tf.text!, "username": "@" + nickname]
            Shared.shared.request(url: "/v1/member/send/change/password/authkey", method: .post, param: param, header: .none, JSONDecodeUsingStatus: false) { result in
                switch result {
                case .success(let data):
                    print(data)
                    let controller = NewPasswordAuthCodeViewController()
                    self.navigationController?.pushViewController(controller, animated: true)
                    break
                case .requestErr(let err):
                    print(err)
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
            
        }else{
            shakeView(self.view)
        }
    }
    
    @objc
    private func onTapcertified(){
        print("DEBUG : Click bottom certified button Button")
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        topBarViewSetting()
        phoneNumContainerViewSetting()
        keyboardTypeSetting()
        cornerRadius()
        location()
        addNotificationCenter()
    }
    
    private func addView(){
        view.addSubview(topBarView)
        view.addSubview(toNewPassWordLabel)
        view.addSubview(putPhoneNumLabel)
        view.addSubview(phoneNumContainer)
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
        
        toNewPassWordLabel.snp.makeConstraints { make in
            make.left.equalTo(phoneNumContainer)
            make.top.equalToSuperview().offset(self.view.frame.height/5.04)
        }
        
        putPhoneNumLabel.snp.makeConstraints { make in
            make.top.equalTo(toNewPassWordLabel).offset(self.view.frame.height/27.07)
            make.left.equalTo(phoneNumContainer)
        }
        
        phoneNumContainer.snp.makeConstraints { make in
            make.top.equalTo(putPhoneNumLabel).offset(self.view.frame.height/11.77)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.34)
            make.height.equalTo(self.view.frame.height/15.62)
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
    
    //MARK: - phoneNumContainerViewSetting

    private func phoneNumContainerViewSetting(){
        phoneNumContainer.addSubview(phoneNumContainer.tfTitle)
        phoneNumContainer.addSubview(phoneNumContainer.tf)
        phoneNumContainer.addSubview(phoneNumContainer.divView)
        
        phoneNumContainer.loginTfSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    //MARK: - KeyboardType Setting
    
    private func keyboardTypeSetting(){
        phoneNumContainer.tf.keyboardType = .phonePad
    }
    
    //MARK: - textField Point Set
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumContainer.tf.resignFirstResponder()
    }
    
    //MARK: - Add NotificationCenter
    
    private func addNotificationCenter(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - shakeAnimation
    
    private func shakeView(_ view: UIView?) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.08
        shake.repeatCount = 2
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! - 2, y: view?.center.y ?? 0.0))
        shake.toValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! + 2, y: view?.center.y ?? 0.0))
        view?.layer.add(shake, forKey: "position")
    }
    
    //MARK: - PhoneNum Test
        
    private func isValidPhoneNum(PhoneNumber: String?) -> Bool {
        guard PhoneNumber != nil else { return false }
        
        let idRegEx = "^01([0-9])([0-9]{3,4})([0-9]{4})$"
        let pred = NSPredicate(format:"SELF MATCHES %@", idRegEx)
        return pred.evaluate(with: PhoneNumber)
    }
    
    //MARK: - KeyboardWillShow -> continueButton Up
    @objc
    private func keyboardWillShow(_ sender: Notification) {
        var keyboardHeight: CGFloat = CGFloat(0) //keyboardHeight
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
        }
        continueButton.snp.remakeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(-keyboardHeight - self.view.frame.height/32.48)
        }
    }
    
    //MARK: - KeyboardWillHide -> continueButton Down
    @objc
    private func keyboardWillHide(_ sender: Notification) {
        continueButton.snp.remakeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(self.view.frame.height/32.48 * -1)
        }
    }
}
