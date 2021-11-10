//
//  SettingViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/06.
//

import UIKit

class SettingViewController: UIViewController {
    
    // MARK: - Properties
    lazy var topView = TopView()
    
    let settingTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
    }
    
    lazy var settingListTitleLabel = ["푸시 알림 관리", "태그 관리", "닉네임 변경","비밀번호 변경","전화번호 변경", "로그아웃", "회원 탈퇴"]
    
    lazy var settingListDescriptionLabel = ["개인, 심부름관련 알림을 관리합니다.","일정의 태그를 관리합니다.","현재 사용 중인 닉네임을 변경합니다.","현재 사용 중인 비밀번호를 변경합니다.","현재 사용 중인 전화번호를 변경합니다.","EZY에서 로그아웃합니다.", "EZY 계정을 탈퇴합니다."]
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - helpers
    func configureUI(){
        self.view.backgroundColor = .white
        
        addView()
        topViewSetting()
        settingtableViewSetting()
    }
    
    //MARK: - SettingTableView setting
    func settingtableViewSetting(){
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        settingTableView.isScrollEnabled = false
        
        settingTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.settingTableViewCellIdentifier)
        self.view.addSubview(settingTableView)
        
        settingTableView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/50)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: - topViewSetting
    func topViewSetting(){
        topView.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        
        topView.topViewDataSetting(backButtonImage: UIImage(named: "EZY_SettingBackButton")!, titleLabelText: "설정",
                                   textColor: UIColor(red: 175/255, green: 173/255, blue: 255/255, alpha: 1))

        topView.topViewLayoutSetting(screenHeight: Double(self.view.bounds.height), screenWeight: Double(self.view.bounds.width))
        
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
    }
    
    //MARK: - addSubview
    func addView(){
        self.view.addSubview(topView)
        topView.addSubview(topView.backButton)
        topView.addSubview(topView.titleLabel)
    }
    
    //MARK: - selectors
    @objc func backButtonClicked(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - extensions
extension SettingViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let nextViewController = PushNotificationManagementViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else if indexPath.row == 1{
            let nextViewController = TagManagementViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else if indexPath.row == 2{
            let nextViewController = ChangeIdAfterLoginViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else if indexPath.row == 3{
            let nextViewController = ChangePasswardPhoneNumAfterLoginViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else if indexPath.row == 4{
            let nextViewController = ChangePhoneNumPutViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else if indexPath.row == 5{
            let nextViewController = LogoutViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else if indexPath.row == 6{
            let nextViewController = WithdrawalViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}

extension SettingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingListTitleLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SettingTableViewCell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.settingTableViewCellIdentifier, for: indexPath) as! SettingTableViewCell
        
        cell.listDescriptionLabel.text = settingListDescriptionLabel[indexPath.row]
        cell.listTitleLabel.text = settingListTitleLabel[indexPath.row]
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 0
    }
}
