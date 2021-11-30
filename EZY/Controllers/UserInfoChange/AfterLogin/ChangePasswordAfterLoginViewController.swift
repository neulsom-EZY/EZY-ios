import UIKit
import Alamofire

class ChangePasswardAfterLoginViewController: UIViewController {
    //MARK: - Properties
    var nickname:String = ""
    
    var key:String = ""
    
    final class API : APIService<KakaoDataModel>{
        //MARK: - SingleTon
        static let shared = APIService<KakaoDataModel>()
    }
    
    private let topView = TopView().then{
        $0.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        $0.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "비밀번호 변경", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
    }
    
    private let passwordNickNameLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "비밀번호"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private let passwardTextField = UITextField().then {
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.placeholder = "새로운 비밀번호를 입력해주세요"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    private let UnderLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    private let passwardConditionLabel = UILabel().then {
        $0.text = "8자 이하, 영어 + 숫자최소 1개, 공백 허용x"
        $0.textColor = UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    private let changeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "EZY_ChangeButtonImage"), for: .normal)
        $0.setTitle("변경하기", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(changeButtonClicked(sender:)), for: .touchUpInside)
    }
    
    // MARK: - LifyCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        location()
    }
    
    private func addView(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(passwordNickNameLabel)
        self.view.addSubview(passwardTextField)
        self.view.addSubview(UnderLineView)
        self.view.addSubview(changeButton)
        self.view.addSubview(passwardConditionLabel)

    }
    
    func location() {
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
        passwardConditionLabel.snp.makeConstraints { make in
            make.top.equalTo(UnderLineView.snp.bottom).offset(self.view.frame.height/100)
            make.left.equalTo(UnderLineView)
        }
        
        passwordNickNameLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/16.91)
            make.left.equalTo(topView)
        }
        
        passwardTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordNickNameLabel.snp.bottom)
            make.left.equalTo(passwordNickNameLabel).offset(self.view.frame.width/80)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(27)
        }
        
        UnderLineView.snp.makeConstraints { make in
            make.top.equalTo(passwardTextField.snp.bottom)
            make.left.equalTo(passwordNickNameLabel)
            make.centerX.equalToSuperview()
            make.height.equalTo(2)
        }
        
        changeButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(-self.view.frame.height/23.8)
            
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
            shakeView(passwordNickNameLabel)
        }

    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        passwardTextField.resignFirstResponder()
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
    
    func isValidPassward(Passward: String?) -> Bool {
        guard Passward != nil else { return false }
        
        let PasswardRegEx = ("(?=.*[A-Za-z~!@#$%^&*])(?=.*[0-9]).{8,}")
        let pred = NSPredicate(format:"SELF MATCHES %@", PasswardRegEx)
        return pred.evaluate(with: Passward)
    }
}
