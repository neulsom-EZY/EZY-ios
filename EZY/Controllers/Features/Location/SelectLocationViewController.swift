//
//  SelectLocationViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/08.
//

import UIKit
import Alamofire

class SelectLocationViewController: UIViewController {
    // MARK: - Kakao Search Data
    private var kakaoPlaceSearchData : [KakaoDocuments]? = nil
    
    // MARK: - Properties
    
    private var kakaoPlaceVM : KakaoPlaceViewModel!
    
    //MARK: - Kakao Search Data
    let bgView = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let alphabet : [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        
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
        $0.returnKeyType = .done
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
    private let noPlace = NoPlace().then{
        $0.isHidden = false
        $0.title.text = "검색결과가 없습니다"
    }
    
    private lazy var locationTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.reuseId)
    }
    
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
        [topViewHalfModalView, backButton,textFieldBackgroundView,searchButton, locationTableView,noPlace].forEach { self.view.addSubview($0) }
        [locationTextField].forEach { textFieldBackgroundView.addSubview($0) }
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
        noPlace.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.width.equalTo(view.frame.width/1.556)
        }
    }
    
    // MARK: - delegateAndDataSource
    private func delegateAndDataSource(){
        locationTableView.delegate = self
        locationTableView.dataSource = self
        locationTextField.delegate = self
    }
    
    // MARK: - Selectors
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
                    self.kakaoPlaceVM = KakaoPlaceViewModel(KakaoPlaces: kakao)
                }
                DispatchQueue.main.async {
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
            case .tokenErr:
                print("tokenErr")
            case .authorityErr:
                print("authorityErr")
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.kakaoPlaceVM == nil ? 0 : self.kakaoPlaceVM.numberOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.kakaoPlaceVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.reuseId, for: indexPath) as? LocationTableViewCell else{return UITableViewCell()}
        cell.selectionStyle = .none
        
        let kakaoPlaceVM = self.kakaoPlaceVM.kakaoPlaceIndex(indexPath.row)
        cell.alphabetLabel.text = alphabet[indexPath.row]
        cell.locationTitleNameLabel.text = kakaoPlaceVM.placeName
        cell.locationLabel.text = kakaoPlaceVM.roadName
        cell.subLocationLabel.text = kakaoPlaceVM.addressName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let BasicModalVC = BasicModalViewController.instance()
        let kakaoPlaceVM = self.kakaoPlaceVM.kakaoPlaceIndex(indexPath.row)
        addDim()
        BasicModalVC.delegate = self
        BasicModalVC.baseDelegate = self
        present(BasicModalVC, animated: true, completion: nil)
        BasicModalVC.textSetting(colorText: kakaoPlaceVM.placeName ?? "", contentText: "위치를 선택할까요?", sender: UIButton())
    }
}

// MARK: - textfield 설정
extension SelectLocationViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        locationTextField.resignFirstResponder()
        searchButtonClicked(sender: searchButton.self)
        return true
    }
}

extension SelectLocationViewController: BaseModalDelegate {
    func onTapClose() {
        removeDim()
    }
}

extension SelectLocationViewController: BasicModalViewButtonDelegate{
    func onTabOkButton(sender:UIButton) {
        removeDim()

        self.navigationController?.popViewController(animated: true)
    }
}
