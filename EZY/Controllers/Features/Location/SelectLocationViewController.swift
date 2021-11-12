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
    private let alphabetTextArray: [String] = ["A","B","C","D","E","F","G"]
=======
    private let alphabetTextArray: [String] = ["A", "B"]
    
    private let placeName: [String] = ["광주소프트웨어마이스터고등학교", "우리 집"]
>>>>>>> 1449765bcffe4d943e0de4d88c84238ea00df3d4
    
    let bgView = UIView().then {
        $0.backgroundColor = .black
//        $0.alpha = 0
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
        
        selectLocationModalView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        selectLocationModalView.shadowBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        selectLocationModalView.modalBackgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.13)
            make.height.equalToSuperview().dividedBy(3.59)
            make.centerX.centerY.equalToSuperview()
        }
        
        selectLocationModalView.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        selectLocationModalView.iconCircleBackground.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(6.3)
            make.height.equalTo(selectLocationModalView.iconCircleBackground.snp.width)
            make.top.equalTo(selectLocationModalView.titleLabel.snp.bottom).offset(self.view.frame.height/62)
            
            selectLocationModalView.iconCircleBackground.layer.cornerRadius = ((self.view.frame.width/1.13)/6.3)/2
        }
        
        selectLocationModalView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2)
        }
        
        selectLocationModalView.modalLocationLabel.snp.makeConstraints { make in
            make.centerX.equalTo(selectLocationModalView.iconCircleBackground)
            make.top.equalTo(selectLocationModalView.iconCircleBackground.snp.bottom).offset(self.view.frame.height/54)
        }
        
        selectLocationModalView.selectQuestionsLabel.snp.makeConstraints { make in
            make.centerX.equalTo(selectLocationModalView.modalLocationLabel)
            make.top.equalTo(selectLocationModalView.modalLocationLabel.snp.bottom)
        }
        
        selectLocationModalView.okButton.snp.makeConstraints { make in
            make.bottom.equalTo(selectLocationModalView.cancelButton)
            make.right.equalTo(selectLocationModalView.cancelButton.snp.left).offset(-self.view.frame.width/35)
            make.height.width.equalTo(selectLocationModalView.cancelButton)
        }
        
        selectLocationModalView.cancelButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/40.6)
            make.right.equalToSuperview().offset(-self.view.frame.width/15)
            make.height.equalToSuperview().dividedBy(7.2)
            make.width.equalToSuperview().dividedBy(4.7)
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
        return alphabetTextArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.reuseId, for: indexPath) as! LocationTableViewCell
        cell.selectionStyle = .none
        cell.alphabetLabel.text = alphabetTextArray[indexPath.row]
        cell.locationTitleNameLabel.text = placeName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(self.view.frame.height/14)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let BasicModalVC = BasicModalViewController.instance()
        addDim()
        BasicModalVC.baseDelegate = self
        present(BasicModalVC, animated: true, completion: nil)
        BasicModalVC.textSetting(colorText: placeName[indexPath.row], contentText: "위치를 선택할까요?")
    }

}

extension SelectLocationViewController: BaseModalDelegate {
    func onTapClose() {
        removeDim()
    }
}
