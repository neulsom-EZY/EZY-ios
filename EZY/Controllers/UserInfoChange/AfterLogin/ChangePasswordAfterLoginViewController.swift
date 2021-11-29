//
//  ChangePasswardAfterLoginViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/28.
//

import UIKit
import Alamofire

class ChangePasswordNameAfterLoginViewController: UIViewController {
    //MARK: - Properties
    var nickname:String = ""
    var key:String = ""
    
    final class API : APIService<KakaoDataModel>{
        //MARK: - SingleTon
        static let shared = APIService<KakaoDataModel>()
    }
    
    lazy var topView = TopView()
    
    lazy var passwordNickNameLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "비밀번호"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var passwardTextField = UITextField().then {
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.placeholder = "새로운 비밀번호를 입력해주세요"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    private let lineInputView = LineInputView().then{
        $0.dataSetting(titleText: "닉네임", placeHolderText: "닉네임을 입력해주세요", conditionText: "1 ~ 10, 영어로 작성해주세요!")
    }
    
    private let changeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_ChangeButtonImage"), for: .normal)
        $0.setTitle("계속하기", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(changeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    // MARK: - LifyCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        self.view.backgroundColor = .white
        [topView, lineInputView, changeButton].forEach { self.view.addSubview($0) }
    }
    
    // MARK: - location
    private func location() {
        lineInputView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/17.65)
            make.height.equalToSuperview().dividedBy(13)
            make.centerX.equalToSuperview()
        }
        
        changeButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
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
    @objc //MARK: 모달 창 올리기
    func keyboardWillShow(_ sender: Notification) {
        changeButton.frame.origin.y = self.view.frame.height/2
    }

    @objc //MARK: 모달 창 원래대로 
    func keyboardWillHide(_ sender: Notification) {
        changeButton.frame.origin.y = self.view.frame.height-changeButton.frame.height-self.view.frame.height/23.8
    }
    
    @objc func changeButtonClicked(sender:UIButton){
        if isValidPassward(Passward: passwardTextField.text) == true{
            let param: Parameters = ["key": key, "newPassword": passwardTextField.text!, "username": "@" + nickname]
            API.shared.request(url: "/v1/member/change/password", method: .put, param: param, header: .none, JSONDecodeUsingStatus: false){ result in
                switch result{
                case .success(let data):
                    print(data)
                    let controller = SettingViewController()
                    self.navigationController?.pushViewController(controller, animated: true)
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
            lineInputView.checkInfoTextIsEmpty()
        }
    }
    
    @objc private func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - isValidNickname
    private func isValidNickname(Nickname: String?) -> Bool {
        guard Nickname != nil else { return false }
            
        let NicknameRegEx = ("[A-Za-z].{0,9}")
        let pred = NSPredicate(format:"SELF MATCHES %@", NicknameRegEx)
        return pred.evaluate(with: Nickname)
    }
}
