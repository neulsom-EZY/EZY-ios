//
//  IdChangeViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/13.
//

import UIKit

class ChangeIdAfterLoginViewController: UIViewController {
    
    // MARK: - Properties
    private let topView = TopView().then{
        $0.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        $0.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "닉네임 변경", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
    }
    
    private let idNickNameLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "아이디/닉네임"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }

    private let idTextField = UITextField().then {
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.placeholder = "아이디를 입력해주세요"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    private let idUnderLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    private let idConditionLabel = UILabel().then {
        $0.text = "1 ~ 10자 사이 영어로 작성해주세요!"
        $0.textColor = UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    private let changeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_IdChangeButtonImage"), for: .normal)
        $0.setTitle("변경하기", for: .normal)
        $0.alpha = 0.5
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(changeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    // MARK: - LifyCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        idTextField.resignFirstResponder()
    }
    
    // MARK: - Helpers
    private func configure(){
        addView()
        
        addObserver()
        
        location()
    }
    
    // MARK: - addObserver
    private func addObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - addView
    private func addView(){
        self.view.backgroundColor = .white
        self.view.addSubview(topView)
        self.view.addSubview(idNickNameLabel)
        self.view.addSubview(idTextField)
        self.view.addSubview(idUnderLineView)
        self.view.addSubview(idConditionLabel)
        self.view.addSubview(changeButton)
    }
    
    // MARK: - addLayout
    private func location(){
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
        
        idNickNameLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/16.91)
            make.left.equalTo(topView)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(idNickNameLabel.snp.bottom)
            make.left.equalTo(idNickNameLabel)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(27)
        }
        
        idUnderLineView.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom)
            make.left.equalTo(idTextField)
            make.centerX.equalToSuperview()
            make.height.equalTo(2)
        }
        
        idConditionLabel.snp.makeConstraints { make in
            make.top.equalTo(idUnderLineView.snp.bottom).offset(self.view.frame.height/100)
            make.left.equalTo(idUnderLineView)
        }
        
        changeButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(-self.view.frame.height/23.8)
        }
    }
    
    // MARK: - Selectors
    @objc private func changeButtonClicked(sender:UIButton){
        if isValidId(id: idTextField.text) == true{
            let nextVC = SettingViewController()
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true, completion: nil)
        }else{
            shakeView(idNickNameLabel)
        }
    }
    
    @objc private func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Notification
    @objc private func keyboardWillShow(_ sender: Notification) {
        changeButton.frame.origin.y = self.view.frame.height/2
    }

    @objc private func keyboardWillHide(_ sender: Notification) {
        changeButton.frame.origin.y = self.view.frame.height-changeButton.frame.height-self.view.frame.height/23.8
    }
    
    // MARK: - shakeView
    private func shakeView(_ view: UIView?) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.08
        shake.repeatCount = 2
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! - 2, y: view?.center.y ?? 0.0))
        shake.toValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! + 2, y: view?.center.y ?? 0.0))
        view?.layer.add(shake, forKey: "position")
    }
    
    // MARK: - isValidId
    private func isValidId(id: String?) -> Bool {
        guard id != nil else { return false }
        
        let idRegEx = "[A-Za-z]{1,10}"
        let pred = NSPredicate(format:"SELF MATCHES %@", idRegEx)
        return pred.evaluate(with: id)
    }
}
