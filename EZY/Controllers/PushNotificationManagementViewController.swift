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
    
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_AFADFF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(backbtn), for: .touchUpInside)
    }
    private let TitleLabel = UILabel().then{ 
        $0.textColor = .EZY_AFADFF
        $0.text = "푸쉬 알림 관리"
        $0.dynamicFont(fontSize: 22, weight: .semibold)
    }
    private let personalCalendar : AlarmManagementButton = {
        let viewModel = Managementbtn(icon: UIImage(named: "EZY_user")?.withRenderingMode(.alwaysTemplate), iconTintColor : .EZY_BAC8FF, title: "개인 일정 알림 관리", subTitle: "개인, 팀, 심부름관련 알림을 관리합니다.")
        let button = AlarmManagementButton(with: viewModel)
        button.addTarget(self, action: #selector(personalCalendarMove), for: .touchUpInside)
        return button
    }()
    private let teamCalendar : AlarmManagementButton = {
        let viewModel = Managementbtn(icon: UIImage(named: "EZY_user-3")?.withRenderingMode(.alwaysTemplate), iconTintColor : .EZY_CFCBFF, title: "팀 일정 알림 관리", subTitle: "현재 버전을 표시합니다.")
        let button = AlarmManagementButton(with: viewModel)
        button.addTarget(self, action: #selector(teamCalendarMove), for: .touchUpInside)
        return button
    }()
    private let errandCalendar : AlarmManagementButton = {
        let viewModel = Managementbtn(icon: UIImage(named: "EZY_work")?.withRenderingMode(.alwaysTemplate), iconTintColor : .EZY_AFADFF, title: "심부름 알림 관리", subTitle: "팀 일정의 그룹을 관리합니다.")
        let button = AlarmManagementButton(with: viewModel)
        button.addTarget(self, action: #selector(errandCalendarMove), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    //MARK: - Selectors
    @objc func backbtn(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func personalCalendarMove(){
        let controller = PersonalCalendarViewController()
        navigationController?.pushViewController(controller, animated: true)
 
    }
    @objc func teamCalendarMove(){
        let controller = TeamCalendarViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    @objc func errandCalendarMove(){
        let controller = ErrandCalendarViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        AddView()
        Location()
    }
    func AddView(){
        view.addSubview(backbutton)
        view.addSubview(TitleLabel)
        view.addSubview(personalCalendar)
        view.addSubview(teamCalendar)
        view.addSubview(errandCalendar)
    }
    func Location(){
        backbutton.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/33.8)
            make.left.equalTo(self.view.frame.height/29)
            make.top.equalTo(self.view.frame.height/13.3)
        }
        TitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backbutton.snp.bottom).offset(self.view.frame.height/30.1)
            make.left.equalTo(backbutton.snp.left)
        }
        personalCalendar.snp.makeConstraints { (make) in
            make.top.equalTo(TitleLabel.snp.bottom).offset(view.frame.height/31.2)
            make.height.equalTo(view.frame.height/12.9)
            make.left.equalToSuperview().offset(view.frame.height/28)
            make.right.equalToSuperview().offset(view.frame.height/29 * -1)
        }
        teamCalendar.snp.makeConstraints { (make) in
            make.top.equalTo(personalCalendar.snp.bottom).offset(view.frame.height/47.8)
            make.height.equalTo(view.frame.height/12.9)
            make.left.equalToSuperview().offset(view.frame.height/28)
            make.right.equalToSuperview().offset(view.frame.height/29 * -1)
        }
        errandCalendar.snp.makeConstraints { (make) in
            make.top.equalTo(teamCalendar.snp.bottom).offset(view.frame.height/47.8)
            make.height.equalTo(view.frame.height/12.9)
            make.left.equalToSuperview().offset(view.frame.height/28)
            make.right.equalToSuperview().offset(view.frame.height/29 * -1)
        }
    }
}

