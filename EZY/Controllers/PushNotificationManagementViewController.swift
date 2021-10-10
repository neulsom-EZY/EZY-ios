//
//  PushNotificationManagementViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/26.
//

import UIKit
import SnapKit
import Then
import Alamofire
class PushNotificationManagementViewController : UIViewController{
    
    //MARK: - Properties
    let bounds = UIScreen.main.bounds
    var manageData : [ManageData] = []
    let titleNotification = ["EZY 앱 알림"]
    let explanation = ["EZY 앱의 알림을 관리합니다."]
    
    
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_AFADFF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(backbtn), for: .touchUpInside)
    }
    private let TitleLabel = UILabel().then{
        $0.textColor = .EZY_AFADFF
        $0.text = "푸시 알림 관리"
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    private let tableView = UITableView().then{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(CustomManagePushNotificationCell.self, forCellReuseIdentifier: CustomManagePushNotificationCell.identifier)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    //MARK: - Selectors
    @objc func backbtn(){
        navigationController?.popViewController(animated: true )
    }
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
        makeData()
        configure()
    }
    func addView(){
        view.addSubview(backbutton)
        view.addSubview(TitleLabel)
        view.addSubview(tableView)
    }
    func location(){
        backbutton.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/33.8)
            make.left.equalTo(self.view.frame.height/29)
            make.top.equalTo(self.view.frame.height/13.3)
        }
        TitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backbutton.snp.bottom).offset(self.view.frame.height/30.1)
            make.left.equalTo(backbutton.snp.left)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(TitleLabel.snp.bottom).offset(view.frame.height/21.95)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(view.frame.height/22.6)
            make.right.equalToSuperview().offset(view.frame.height/22.6 * -1)
        }
    }
    
    private func makeData() {
            manageData.append(ManageData.init(title: titleNotification[0], explanation: explanation[0]))
            
        }

    private func configure() {
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.rowHeight = view.frame.height/13.69
        self.tableView.separatorStyle = .none
        self.tableView.bounces = false;
    }
}

//MARK: - PersonalCalendarViewController TableView
extension PushNotificationManagementViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomManagePushNotificationCell.identifier, for: indexPath) as! CustomManagePushNotificationCell
        cell.title.text = titleNotification[indexPath.row]
        cell.explanation.text = explanation[indexPath.row]
        return cell
    }
}
