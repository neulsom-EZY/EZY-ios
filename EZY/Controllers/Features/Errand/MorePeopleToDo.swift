//
//  morepeopletodo.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/08.
//
    
import UIKit
import SnapKit
import Then
import Alamofire

protocol UserDataDelegate : AnyObject{
    func userUpdateData(name : String? , Color : UIColor)
}

class MorePeopleToDo: UIViewController{
    final class API : APIService<UserSearchModel>{
        static let shared = API()
    }
    
    let bounds = UIScreen.main.bounds
    private var searchData : [UserNameDocument] = []
    //MARK: - Properties
    
    weak var delegate : UserDataDelegate?
    private var viewModel = MoreTodoModel()
    private var isTableVisible = false

    
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_968DFF
        $0.setImage(UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.addTarget(self, action: #selector(backButton), for: .touchUpInside)
    }
    private let TitleLabel = UILabel().then{
        $0.text = "누구와 일정을 함께하시나요?"
        $0.dynamicFont(fontSize: 24, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .EZY_968DFF
    }
    private let SubLabel = UILabel().then{
        $0.text = "한명만 선택해주세요!"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF,.EZY_968DFF,.white])
    }
    
    private let GroupLabel = UILabel().then{
        $0.text = "닉네임"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 129, green: 129, blue: 129)
    }
   
    private lazy var searcherView  = SearchView().then{
        $0.layer.applySketchShadow(color: .gray, alpha: 0.25, x: 0, y: 6, blur: 15, spread: 0)
        $0.frame = CGRect(x: self.view.frame.height/23.2, y: self.view.frame.height/3.0526, width: self.view.frame.width/1.2255, height: 0)
    }
    
    private let  nickNameTextFieldContainerView =  GroupSearchTextfield(placeholder: "닉네임을 검색하세요")
    private let searchUserLabel = UILabel().then{
        $0.text = "심부름을 부탁할 분이군요!"
        $0.isHidden = true
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
    }
    private let searchingUserView = UserChooseView().then{
        $0.isHidden = true
        $0.btn.addTarget(self, action: #selector(deleteSelectedUser), for: .touchUpInside)
    }
    
    private let userChoose = AdditionalButton(type: .system).then {
        $0.title = "인원 선택"
        $0.color = .rgb(red: 151, green: 142, blue: 255)
        $0.addTarget(self, action: #selector(chooseUser), for: .touchUpInside)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc private func backButton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func deleteSelectedUser(){
        searchUserLabel.isHidden = true
        searchingUserView.isHidden = true
        searchingUserView.label.text = nil
    }
    
    @objc private func chooseUser(){
        if ((searchingUserView.label.text?.isEmpty) != nil){
            delegate?.userUpdateData(name: searchingUserView.label.text, Color: .EZY_796DFF)
            navigationController?.popViewController(animated: true)
        }else{
            shakeView(view)
        }
    }
    @objc private func textDidChage(_ sender: UITextField){
        if sender == nickNameTextFieldContainerView{
            viewModel.nickName = sender.text
        }
        updateForm()
    }
    private func configureUI(){
        view.backgroundColor = .white
        userChoose.layer.cornerRadius = view.frame.height/81.2
        addView()
        location()
        dataAndDelgete()
        configureNotificationObservers()
    }
    //MARK: - AddView
    private func addView(){
        [backbutton,TitleLabel,SubLabel,GroupLabel,nickNameTextFieldContainerView,userChoose,searchUserLabel,searchingUserView,searcherView].forEach { view.addSubview($0)}
    }
    
    //MARK: - location
    private func location(){
        backbutton.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/33.8)
            make.left.equalTo(self.view.frame.height/29)
            make.top.equalTo(self.view.frame.height/15.6154)
        }
        TitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(backbutton.snp.top).offset(view.frame.height/15.6)
        }
        SubLabel.snp.makeConstraints { (make) in
            make.top.equalTo(TitleLabel.snp.bottom)
            make.left.equalTo(TitleLabel.snp.left)
        }

        GroupLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view.frame.height/20.8)
            make.top.equalTo(SubLabel.snp.bottom).offset(view.frame.height/17.65)
        }
        nickNameTextFieldContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(GroupLabel.snp.bottom).offset(view.frame.height/135.3)
            make.height.equalTo(self.view.frame.height/21.368)
            make.left.equalTo(view.snp.left).offset(self.view.frame.height/23.2)
            make.right.equalTo(view.snp.right).offset(self.view.frame.height/23.8 * -1)
        }

        userChoose.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottom).inset(view.frame.height/13.3)
            make.height.equalTo(self.view.frame.height/18.044)
            make.left.equalTo(view.snp.left).offset(view.frame.height/30.07)
            make.right.equalTo(view.snp.right).inset(view.frame.height/29)
        }
        searchUserLabel.snp.makeConstraints{
            $0.top.equalTo(nickNameTextFieldContainerView.snp.bottom).offset(bounds.height/27.0666)
            $0.left.equalTo(nickNameTextFieldContainerView)
        }
        searchingUserView.snp.makeConstraints{
            $0.left.equalTo(nickNameTextFieldContainerView)
            $0.height.equalTo(30)
            $0.top.equalTo(searchUserLabel.snp.bottom).offset(bounds.height/45.111)
        }
    }
    private func dataAndDelgete(){
        [searcherView.tv].forEach{ $0.delegate = self;$0.dataSource = self}
        nickNameTextFieldContainerView.delegate = self
    }
    private func httpRequest(){
        let header : HTTPHeaders = ["Authorization": TokenUtils.shared.read(Bundle.bundleIdentifier, account: "accessToken") ?? ""]
        let param : Parameters = ["keyword": nickNameTextFieldContainerView.text ?? ""]
        API.shared.request(url: "/v1/member/search",
                           method: .get,
                           param: param,
                           header: header,
                           encoding: URLEncoding.queryString,
                           JSONDecodeUsingStatus: true) { (response) in
            switch response{
            case.success(let value):
                NSLog("success :: \(value)")
                if let data = value as? UserSearchModel{
                    self.searchData = data.list
                    DispatchQueue.main.async {
                        self.searcherView.tv.reloadData()
                    }
                }
            case .requestErr(let error):
                NSLog("ERROR :: \(error)")
                self.failedAction()
            case .pathErr:
                NSLog("pathError")
                self.failedAction()
            case .serverErr:
                NSLog("ServerError")
                self.failedAction()
            case .networkFail:
                NSLog("networkFail")
                self.failedAction()
            case .tokenErr:
                NSLog("TokenError")
            case .authorityErr:
                NSLog("authorityErr")
            }
        }
    }
    private func failedAction(){
        searchData = .init()
        DispatchQueue.main.async {
            self.searcherView.tv.reloadData()
            self.searcherView.noUser.isHidden = false
        }
    }
    private func configureNotificationObservers(){
        nickNameTextFieldContainerView.addTarget(self, action: #selector(textDidChage), for: .editingChanged)
    }
    
    //MARK: - 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    //MARK: - Shake Animation
    private func shakeView(_ view: UIView?) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! - 5, y: view?.center.y ?? 0.0))
        shake.toValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! + 5, y: view?.center.y ?? 0.0))
        view?.layer.add(shake, forKey: "position")
    }
}
//MARK: - textfield 설정
extension MorePeopleToDo : UITextFieldDelegate{
    // 리턴 눌렀을때 키보드 내리기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        httpRequest()
        dropdownAnimation()
        nickNameTextFieldContainerView.resignFirstResponder()
        view.endEditing(true)
        return true
    }
}
extension MorePeopleToDo : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchData.count
    }
    //SearcherView 안에 Cell 을 넣었을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searcherView.noUser.isHidden = false
        UIView.animate(withDuration: 0.2) {
            self.searcherView.frame = CGRect(x: self.view.frame.height/23.2, y: self.view.frame.height/3.0526, width: self.view.frame.width/1.2255, height: 0)
            self.view.layoutIfNeeded()
        }
        searchingUserView.label.text = searchData[indexPath.row].username.trimmingCharacters(in: ["@"])
        searchUserLabel.isHidden = false
        searchingUserView.isHidden = false
        searcherView.noUser.isHidden = true
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableCell.identifier) as? SearchTableCell else{return UITableViewCell()}
        cell.personName.text = searchData[indexPath.row].username.trimmingCharacters(in: ["@"])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/20.3
    }
}
extension MorePeopleToDo : FormViewModel{
    func updateForm() {
        isTableVisible = viewModel.showView
        if !isTableVisible{
                UIView.animate(withDuration: 0.2) {
                    self.searcherView.frame = CGRect(x: self.view.frame.height/23.2, y: self.view.frame.height/3.0526, width: self.view.frame.width/1.2255, height: 0)
                    self.view.layoutIfNeeded()
                    self.searcherView.noUser.isHidden = true
            }
        }
    }
    func dropdownAnimation(){
        UIView.animate(withDuration: 0.2) {
            self.searcherView.frame = CGRect(x: self.view.frame.height/23.2, y: self.view.frame.height/3.0526, width: self.view.frame.width/1.2255, height: self.view.frame.height/5.1392)
            self.view.layoutIfNeeded()
        }
    }
}
