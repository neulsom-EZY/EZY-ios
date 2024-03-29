//
//  ChangePasswardAfterLoginViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/28.
//

import UIKit

class ChangePasswardPhoneNumAfterLoginViewController: UIViewController {
    //MARK: - Properties
    lazy var topView = TopView().then{
        $0.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        $0.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "비밀번호 변경", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
    }
    
    lazy var phoneNumNickNameLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "전화번호"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var phoneNumTextField = UITextField().then {
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.placeholder = "전화번호를 입력해주세요"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    lazy var phoneNumUnderLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var changeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_ChangeButtonImage"), for: .normal)
        $0.setTitle("변경하러 가기", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(changeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    lazy var certifiedButton = UIButton().then {
        $0.setTitle("번호인증", for: .normal)
        $0.titleLabel?.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(UIColor.EZY_FFFFFF, for: .normal)
        $0.backgroundColor = UIColor.EZY_E3E3E3
        $0.addTarget(self, action: #selector(certifiedButtonClicked(sender:)), for: .touchUpInside)
    }
    
    //MARK: - LifyCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        
        location()
    }
    
    func addView(){
        self.view.backgroundColor = .white
        self.view.addSubview(topView)
        topView.addSubview(topView.backButton)
        topView.addSubview(topView.titleLabel)
        self.view.addSubview(phoneNumNickNameLabel)
        self.view.addSubview(phoneNumTextField)
        self.view.addSubview(phoneNumUnderLineView)
        self.view.addSubview(changeButton)
        self.view.addSubview(certifiedButton)
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
        
        phoneNumNickNameLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.titleLabel.snp.bottom).offset(self.view.frame.height/16.91)
            make.left.equalTo(topView.titleLabel)
        }
        
        phoneNumTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumNickNameLabel.snp.bottom)
            make.left.equalTo(phoneNumNickNameLabel).offset(self.view.frame.width/80)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(27)
        }
        
        phoneNumUnderLineView.snp.makeConstraints { make in
            make.top.equalTo(phoneNumTextField.snp.bottom)
            make.left.equalTo(phoneNumNickNameLabel)
            make.centerX.equalToSuperview()
            make.height.equalTo(2)
        }
        
        changeButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(-self.view.frame.height/23.8)
        }
        
        certifiedButton.snp.makeConstraints { make in
            make.centerY.equalTo(phoneNumNickNameLabel)
            make.right.equalToSuperview().offset(self.view.frame.width/8.3 * -1)
            make.width.equalTo(self.view.frame.width/6.36)
            make.height.equalTo(self.view.frame.height/36.9)
            
            certifiedButton.layer.cornerRadius = self.view.frame.height/36.9/2
        }
    }
    
    // MARK: - Selectors
    @objc func certifiedButtonClicked(sender:UIButton){
        print("번호인증")
    }
    
    @objc func changeButtonClicked(sender:UIButton){
        if isValidPhoneNumber(PhoneNumber: phoneNumTextField.text){
            let nextViewController = ChangePasswardAfterLoginViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else{
            shakeView(phoneNumNickNameLabel)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumTextField.resignFirstResponder()
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
    
    func isValidPhoneNumber(PhoneNumber: String?) -> Bool {
        guard PhoneNumber != nil else { return false }
        
        let idRegEx = "^01([0-9])([0-9]{3,4})([0-9]{4})$"
        let pred = NSPredicate(format:"SELF MATCHES %@", idRegEx)
        return pred.evaluate(with: PhoneNumber)
    }
}
