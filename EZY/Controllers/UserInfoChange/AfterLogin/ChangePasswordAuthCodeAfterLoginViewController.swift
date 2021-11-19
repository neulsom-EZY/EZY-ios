//
//  ChangePasswordAuthCodeAfterLoginViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/11/08.
//

import UIKit

class ChangePasswordAuthCodeAfterLoginViewController: UIViewController {
    //MARK: - Properties
    lazy var topView = TopView().then{
        $0.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        $0.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "비밀번호 변경", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
    }
    
    private let authCodeView = AuthCodeTextFieldView()
    
    lazy var changeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_ChangeButtonImage"), for: .normal)
        $0.setTitle("변경하러 가기", for: .normal)
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
        view.addSubview(authCodeView)
        view.addSubview(changeButton)
    }
    
    // MARK: - Selectors
    func location() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
        let nextViewController = ChangePasswordPasswordAfterLoginViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
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
