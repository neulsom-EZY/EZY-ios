//
//  SelectLocationViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/08.
//

import UIKit

class SelectLocationViewController: UIViewController {
    
    var alphabetTextArray = ["A","B","C","D","E","F","G","H","I","J","K"]
    
    var selectLocationModalView = SelectLocationModalView()
        
    lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_LocationBackButton"), for: .normal)
    }
    
    lazy var textFieldBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    lazy var locationTextField = UITextField().then {
        $0.placeholder = "광주소프트웨어마이스터고등학교"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var locationHalfModalView = UIView().then{
        $0.backgroundColor = .white
//        $0.roundCorners(cornerRadius: 50, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner]) // 그림자 코드 뒤에 넣으면 그림자가 안먹음
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 20
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1).cgColor
    }
    
    lazy var locationTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        layoutSetting()
        
        locationTableViewSetting()
        
        selectLocationModalViewSetting()
    }
    
    @objc func okButtonClicked(sender:UIButton){
        selectLocationModalView.isHidden = true
    }
    
    func selectLocationModalViewSetting(){
        
        self.view.addSubview(selectLocationModalView)
        
        selectLocationModalView.okButton.addTarget(self, action: #selector(okButtonClicked(sender:)), for: .touchUpInside)
        
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
        
        selectLocationModalView.isHidden = true
    }
    
    func locationTableViewSetting(){
        locationTableView.delegate = self
        locationTableView.dataSource = self
        
        locationHalfModalView.addSubview(locationTableView)
        
        locationTableView.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.reuseId)
        
        locationTableView.showsHorizontalScrollIndicator = false
        
        locationTableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().offset(self.view.frame.height/80)
            make.centerX.equalToSuperview()
            make.right.equalToSuperview().offset(-self.view.frame.width/10)
            make.left.equalToSuperview().offset(self.view.frame.width/15)
        }

    }
    
    func layoutSetting(){
        self.view.addSubview(backButton)
        self.view.addSubview(textFieldBackgroundView)
        self.view.addSubview(locationHalfModalView)
        textFieldBackgroundView.addSubview(locationTextField)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/30)
            make.left.equalToSuperview().offset(self.view.frame.height/30)
            make.height.equalToSuperview().dividedBy(33.8)
            make.width.equalTo(backButton.snp.height)
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
        
        locationHalfModalView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
        }
    }

}

extension SelectLocationViewController: UITableViewDelegate{
    
}

extension SelectLocationViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.reuseId, for: indexPath) as! LocationTableViewCell
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        cell.alphabetLabel.text = alphabetTextArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(locationTableView.frame.height/3.15)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectLocationModalView.isHidden = false
    }
}
