//
//  ChangePhoneNumAuthCodeViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/11/08.
//

import UIKit
import Alamofire

class ChangePhoneNumAuthCodeViewController: UIViewController {
    
    var phoneNum:String = ""
    let tk = TokenUtils.shared
    final class Shared : APIService<KakaoDataModel>{
        //MARK: - SingleTon
        static let shared = APIService<KakaoDataModel>()
    }
    
    //MARK: - Properties
    lazy var topView = TopView().then{
        $0.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        $0.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "전화번호 변경", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
    }
    
    private let authCodeView = AuthCodeTextFieldView()
    
    lazy var changeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_ChangeButtonImage"), for: .normal)
        $0.setTitle("완료하기", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(changeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    //MARK: - LifyCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        keyboardTypeSetting()
        authCodeViewSetting()
        location()
    }
    
    func addView(){
        view.backgroundColor = .white
        view.addSubview(topView)
        topView.addSubview(topView.backButton)
        topView.addSubview(topView.titleLabel)
        view.addSubview(authCodeView)
        view.addSubview(changeButton)
    }
    
    // MARK: - Selectors
    func location() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
        
        authCodeView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/3.34)
            make.width.equalToSuperview().dividedBy(1.79)
            make.height.equalToSuperview().dividedBy(10.98)
        }
        
        changeButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(-self.view.frame.height/23.8)
        }
    }
    
    //MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        authCodeView.tf1.becomeFirstResponder()
    }
    
    //MARK: - authCodeViewSetting
    
    private func authCodeViewSetting(){
        authCodeView.tf1.addTarget(self, action: #selector(self.textDidChange(textfield:)), for: UIControl.Event.editingChanged)
        authCodeView.tf2.addTarget(self, action: #selector(self.textDidChange(textfield:)), for: UIControl.Event.editingChanged)
        authCodeView.tf3.addTarget(self, action: #selector(self.textDidChange(textfield:)), for: UIControl.Event.editingChanged)
        authCodeView.tf4.addTarget(self, action: #selector(self.textDidChange(textfield:)), for: UIControl.Event.editingChanged)
    }
    
    //MARK: - KeyboardType Setting
    
    private func keyboardTypeSetting(){
        authCodeView.tf1.keyboardType = .phonePad
        authCodeView.tf2.keyboardType = .phonePad
        authCodeView.tf3.keyboardType = .phonePad
        authCodeView.tf4.keyboardType = .phonePad
    }
    
    @objc func changeButtonClicked(sender:UIButton){
        let key:String = authCodeView.tf1.text! + authCodeView.tf2.text! + authCodeView.tf3.text! + authCodeView.tf4.text!
        // MARK: - 인증번호 인증
        let param: Parameters = ["key" : key]
        Shared.shared.request(url: "/v1/member/verified/auth", method: .post, param: param, header: .none, JSONDecodeUsingStatus: false){ result in
            switch result {
            case .success(let data):
                print(data)
                // MARK: - 새 전화번호 변경
                let param: Parameters = ["newPhoneNumber": self.phoneNum]
                Shared.shared.request(url: "/v1/member/change/phone", method: .put, param: param, header: self.tk.getAuthorizationHeader("com.app.EZY"), JSONDecodeUsingStatus: false){ result in
                    switch result {
                    case .success(let data):
                        print(data)
                        let nextViewController = SettingViewController()
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
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc //MARK: 모달 창 올리기
    func keyboardWillShow(_ sender: Notification) {
        changeButton.frame.origin.y = self.view.frame.height/2
    }

    @objc //MARK: 모달 창 원래대로
    func keyboardWillHide(_ sender: Notification) {
        changeButton.frame.origin.y = self.view.frame.height-changeButton.frame.height-self.view.frame.height/23.8
    }
    
    @objc
    private func textDidChange(textfield: UITextField) {
        let text = textfield.text
        
        if text?.utf16.count == 1{
            switch textfield {
                
            case authCodeView.tf1:
                authCodeView.tf2.becomeFirstResponder()
                break
                
            case authCodeView.tf2:
                authCodeView.tf3.becomeFirstResponder()
                break
                
            case authCodeView.tf3:
                authCodeView.tf4.becomeFirstResponder()
                break
                
            default:
                break
                
            }
        }
        
        if text?.utf16.count == 0{
            switch textfield {
                
            case authCodeView.tf2:
                authCodeView.tf1.becomeFirstResponder()
                break
                
            case authCodeView.tf3:
                authCodeView.tf2.becomeFirstResponder()
                break
                
            case authCodeView.tf4:
                authCodeView.tf3.becomeFirstResponder()
                break
                
            default:
                break
                
            }
        }
    }
    
    //MARK: - textField Point Set
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        authCodeView.tf1.resignFirstResponder()
        authCodeView.tf2.resignFirstResponder()
        authCodeView.tf3.resignFirstResponder()
        authCodeView.tf4.resignFirstResponder()
    }
  
    func shakeView(_ view: UIView?) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.08
        shake.repeatCount = 2
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! - 2, y: view?.center.y ?? 0.0))
        shake.toValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! + 2, y: view?.center.y ?? 0.0))
        view?.layer.add(shake, forKey: "position")
    }

}
