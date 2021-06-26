//
//  personalCalendarViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/27.
//

import UIKit
import SnapKit
import Then
import Alamofire

class PersonalCalendarViewController : UIViewController{

    
    //MARK: - Properties
    var manageData : [ManageData] = []
    let titleNotification = ["종료 일정 미리 알림", "종료 일정 미리 알림"]
    let explanation = ["일정이 종료되기 30분 전 알림을 보내드립니다","일정이 종료되기 30분 전 알림을 보내드립니다"]
    
    
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_6B40FF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(backbtn), for: .touchUpInside)
    }
    private let TitleLabel = UILabel().then{
        $0.textColor = .EZY_6B40FF
        $0.text = "개인 일정 알림 관리"
        $0.dynamicFont(fontSize: 22, weight: .semibold)
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
            make.top.equalTo(TitleLabel.snp.bottom).offset(view.frame.height/16.9)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(view.frame.height/22.6)
            make.right.equalToSuperview().offset(view.frame.height/22.6 * -1)
        }
    }
    
    private func makeData() {
        for i in 0...1 {
            manageData.append(ManageData.init(title: titleNotification[i], explanation: explanation[i]))
        }
    }
    
    private func configure() {
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.rowHeight = view.frame.height/14.2
        self.tableView.separatorStyle = .none
        self.tableView.bounces = false;
    }
}


