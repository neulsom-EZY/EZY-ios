//
//  SettingViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/06.
//

import UIKit

class SettingViewController: UIViewController {
    
    //MARK: Properties
    lazy var topView = TopView()
    
    let settingTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
    }
    
    lazy var settingiconImage = [UIImage(named: "EZY_SettingBell"), UIImage(named: "EZY_SettingId"), UIImage(named: "EZY_SettingGroup"), UIImage(named: "EZY_SettingTag"), UIImage(named: "EZY_Withdrawal")]
    
    lazy var settingListTitleLabel = ["푸시 알림 관리", "아이디 변경","그룹 관리", "태그 관리", "회원 탈퇴"]
    
    lazy var settingListDescriptionLabel = ["팀 일정의 그룹을 관리합니다.", "EZY의 궁금한 점이나 불편한 점을 보내주세요.","팀 일정의 그룹을 관리합니다.","일정과 심부름의 태그를 관리합니다","탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴탈퇴"]
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        topViewSetting()
        settingtableViewSetting()
    }
    
    func settingtableViewSetting(){
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        settingTableView.isScrollEnabled = false
        
        settingTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.settingTableViewCellIdentifier)
        self.view.addSubview(settingTableView)
        
        settingTableView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/30)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func topViewSetting(){
        self.view.addSubview(topView)
        topView.addSubview(topView.backButton)
        topView.addSubview(topView.titleLabel)

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
    
    
    @objc func backButtonClicked(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension SettingViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let nextViewController = GroupManagementViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else if indexPath.row == 1{
            let nextViewController = IdChangeViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else if indexPath.row == 2{
            let nextViewController = GroupManagementViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else if indexPath.row == 3{
            let nextViewController = GroupManagementViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else if indexPath.row == 4{
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
        cell.listIconImageView.image = settingiconImage[indexPath.row]
        
        
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