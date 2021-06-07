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
    
    lazy var settingiconImage = [UIImage(named: "EZY_SettingGroup"), UIImage(named: "EZY_SettingNotificationButton"), UIImage(named: "EZY_SettingInquiry")]
    
    lazy var settingListTitleLabel = ["그룹 알림", "푸시 알림 관리", "문의하기"]
    
    lazy var settingListDescriptionLabel = ["팀 일정의 그룹을 관리합니다.", "개인, 팀, 심부름관련 알림을 관리합니다.", "EZY의 궁금한 점이나 불편한 점을 보내주세요."]
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        topViewSetting()
        settingtableViewSetting()
    }
    
    func settingtableViewSetting(){
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

        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        topView.topViewDataSetting(backButtonImage: UIImage(named: "EZY_SettingBackButton")!, titleLabelText: "설정",
                                   textColor: UIColor(red: 175/255, green: 173/255, blue: 255/255, alpha: 1))

        topView.topViewLayoutSetting(screenHeight: Double(self.view.bounds.height), screenWeight: Double(self.view.bounds.width))
        
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
    }

}

extension SettingViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView - didSelectRowAt")
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
        return 83
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 0
    }
}
