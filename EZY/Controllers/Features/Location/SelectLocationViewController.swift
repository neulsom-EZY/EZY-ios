//
//  SelectLocationViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/08.
//

import UIKit
import Alamofire

class SelectLocationViewController: UIViewController {
    
    // MARK: - Properties
<<<<<<< HEAD

    //MARK: - Kakao Search Data
    private var kakaoPlaceSearchData : [KakaoDocuments]? = nil

=======
    private let alphabetTextArray: [String] = ["A", "B"]
    
    private var placeName: [String] = ["광주소프트웨어마이스터고등학교광주", "광주소프트웨어마이스터고등학교광주 행정실"]
    
>>>>>>> 0dd6d4954ae9041c7e2dc967963302dd71a8cf78
    let bgView = UIView().then {
        $0.backgroundColor = .black
    }

    private let selectLocationModalView = SelectLocationModalView().then{
        $0.okButton.addTarget(self, action: #selector(okButtonClicked(sender:)), for: .touchUpInside)
        $0.isHidden = true
    }
        
    private let backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_LocationBackButton"), for: .normal)
        $0.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let textFieldBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    private let locationTextField = UITextField().then {
        $0.placeholder = "위치를 입력해주세요."
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let topViewHalfModalView = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 50, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1).cgColor
    }
    
    private let searchButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_SearchButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(searchButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private lazy var locationTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.reuseId)    }

    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - configureUI
    private func configureUI(){
        self.view.backgroundColor = .white

        addView()
        
        location()
        
        delegateAndDataSource()
    }
    
    // MARK: - addView
    private func addView(){
        self.view.addSubview(topViewHalfModalView)
        self.view.addSubview(backButton)
        self.view.addSubview(textFieldBackgroundView)
        self.view.addSubview(searchButton)
        textFieldBackgroundView.addSubview(locationTextField)
        self.view.addSubview(locationTableView)
        self.view.addSubview(selectLocationModalView)
    }
    
    // MARK: - location
    private func location(){
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/30)
            make.left.equalToSuperview().offset(self.view.frame.height/30)
            make.height.equalToSuperview().dividedBy(33.8)
            make.width.equalTo(backButton.snp.height)
        }
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.right.equalToSuperview().offset(-self.view.frame.height/30)
            make.height.equalToSuperview().dividedBy(51.09)
            make.width.equalToSuperview().dividedBy(25)
        }
        
        textFieldBackgroundView.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(21.3)
            make.width.equalToSuperview().dividedBy(1.5)
        }
        
        locationTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.19)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        topViewHalfModalView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(6.24)
        }
        
        locationTableView.snp.makeConstraints { make in
            make.top.equalTo(topViewHalfModalView.snp.bottom).offset(self.view.frame.height/28)
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: - delegateAndDataSource
    private func delegateAndDataSource(){
        locationTableView.delegate = self
        locationTableView.dataSource = self
    }
    
    // MARK: - Selectors
    @objc private func okButtonClicked(sender:UIButton){
        selectLocationModalView.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func searchButtonClicked(sender:UIButton){
        // 검색 버튼 클릭 시
        let param : Parameters = ["query" :  locationTextField.text ?? ""]
        KakaoPlaceSearchAPI.shared.getKakaoInfo(Parameters: param) { (response) in
            switch response{
            case.success(let kakaoData):
                if  let  kakao = kakaoData as? [KakaoDocuments]{
                    self.kakaoPlaceSearchData = kakao
                    self.locationTableView.reloadData()
                }
            case .requestErr(let message):
                print("requestError", message)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverError")
            case .networkFail:
                print("networkFail")
            }
        }
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

// MARK: - UITableViewDelegate and UITableViewDataSource
extension SelectLocationViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kakaoPlaceSearchData?.count ??  0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.reuseId, for: indexPath) as! LocationTableViewCell
        cell.selectionStyle = .none
<<<<<<< HEAD
        cell.alphabetLabel.text = kakaoPlaceSearchData?[indexPath.row].addressName
        cell.locationTitleNameLabel.text = kakaoPlaceSearchData?[indexPath.row].placeName
=======
        cell.alphabetLabel.text = alphabetTextArray[indexPath.row]
        
        if placeName[indexPath.row].count < 20{
            cell.locationTitleNameLabel.numberOfLines = 0
        }else{
            placeName[indexPath.row] = placeName[indexPath.row].replacingOccurrences(of: " ", with: "\n")
            
            cell.locationTitleNameLabel.numberOfLines = 2
        }
        cell.locationTitleNameLabel.text = "\(placeName[indexPath.row])"
        
>>>>>>> 0dd6d4954ae9041c7e2dc967963302dd71a8cf78
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat((placeName[indexPath.row].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]).height) + 45)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let BasicModalVC = BasicModalViewController.instance()
        addDim()
        BasicModalVC.baseDelegate = self
        BasicModalVC.delegate = self
        present(BasicModalVC, animated: true, completion: nil)
        BasicModalVC.textSetting(colorText: kakaoPlaceSearchData?[indexPath.row].placeName ?? "", contentText: "위치를 선택할까요?")
    }
}

extension SelectLocationViewController: BaseModalDelegate {
    func onTapClose() {
        removeDim()
    }
}

extension SelectLocationViewController: BasicModalViewButtonDelegate{
    func onTabOkButton() {
        removeDim()
        self.navigationController?.popViewController(animated: false)
    }
}
