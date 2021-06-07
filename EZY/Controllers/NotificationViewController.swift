//
//  NotificationViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/04.
//

import UIKit

class NotificationViewController: UIViewController {
    
    //MARK: Properties
    private lazy var notificationTableMainView = NotificationTableView.init(frame: self.view.frame)
    
    private lazy var notificationTableView = notificationTableMainView.tableView
    
    lazy var scheduleType = ["개인 일정", "팀 일정", "심부름","개인 일정", "팀 일정", "심부름","개인 일정", "팀 일정", "심부름"]
    
    lazy var notificationContent = ["산책 일정이 30분 남았어요. \n준비하세요!","지환님이 팀 일정을 보내셨어요. \n확인해볼까요?","지환님이 심부름 일정 변경을 요청했어요. \n확인해볼까요?","산책 일정이 30분 남았어요. \n준비하세요!","지환님이 팀 일정을 보내셨어요. \n확인해볼까요?","지환님이 심부름 일정 변경을 요청했어요. \n확인해볼까요?","산책 일정이 30분 남았어요. \n준비하세요!","지환님이 팀 일정을 보내셨어요. \n확인해볼까요?","지환님이 심부름 일정 변경을 요청했어요. \n확인해볼까요?"]
    
    lazy var afterNotificationTime = ["12분 전", "17분 전", "1시간 전","12분 전", "17분 전", "1시간 전","12분 전", "17분 전", "1시간 전"]
    
    lazy var scheduleImageByTypeImage = [UIImage(named: "EZY_MyJob"), UIImage(named: "EZY_OurJob"), UIImage(named: "EZY_Errand"),UIImage(named: "EZY_MyJob"), UIImage(named: "EZY_OurJob"), UIImage(named: "EZY_Errand"),UIImage(named: "EZY_MyJob"), UIImage(named: "EZY_OurJob"), UIImage(named: "EZY_Errand")]
    
    let circleView = [UIImage(named: "EZY_PersonalBackgroundView"), UIImage(named: "EZY_TeamBackgroundView"), UIImage(named: "EZY_ErrendBackgroundView"), UIImage(named: "EZY_PersonalBackgroundView"), UIImage(named: "EZY_TeamBackgroundView"), UIImage(named: "EZY_ErrendBackgroundView"),UIImage(named: "EZY_PersonalBackgroundView"), UIImage(named: "EZY_TeamBackgroundView"), UIImage(named: "EZY_ErrendBackgroundView")]
    
    lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_NotificationBackButton"), for: .normal)
        $0.addTarget(self, action: #selector(didbackButtonClick(_:)), for: .touchUpInside)
    }
    
    lazy var notificationTitleLabel = UILabel().then {
        $0.text = "알림"
        $0.textColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 23, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    var personalScheduleColor: UIColor! = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1)
    var teamScheduleColor: UIColor! = UIColor(red: 207/255, green: 203/255, blue: 255/255, alpha: 1)
    var errendColor: UIColor! = UIColor(red: 175/255, green: 173/255, blue: 255/255, alpha: 1)
    
    lazy var notificationColor: [UIColor] = [personalScheduleColor, teamScheduleColor, errendColor, personalScheduleColor, teamScheduleColor, errendColor, personalScheduleColor, teamScheduleColor, errendColor]
    
    //MARK: Lifecycles
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        super.viewDidLoad()
        
        notificationTableMainView.tableView.delegate = self
        notificationTableMainView.tableView.dataSource = self
        
        print("height\(self.view.bounds.size.height)")
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }

    
    func configureUI(){
        
        self.view.addSubview(backButton)
        self.view.addSubview(notificationTitleLabel)
        self.view.addSubview(notificationTableMainView.tableView)
        
        notificationTableMainView.tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: NotificationTableViewCell.NotificationTableViewIdentifier)
        
        notificationTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/30)
            make.left.equalTo(backButton)
        }

        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/13.3)
            make.left.equalToSuperview().offset(20)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        notificationTableMainView.tableView.snp.makeConstraints { make in
            make.top.equalTo(notificationTitleLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    @objc func didbackButtonClick(_ button: UIButton){
        navigationController?.popViewController(animated: true)
    }
}

extension NotificationViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView - didSelectRowAt")
    }
}

extension NotificationViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.NotificationTableViewIdentifier, for: indexPath) as! NotificationTableViewCell
        
        cell.scheduleTypeLabel.text = scheduleType[indexPath.row]
        cell.scheduleTypeLabel.textColor = notificationColor[indexPath.row]
        cell.notificationContentLabel.text = notificationContent[indexPath.row]
        cell.notificationContentLabel.textColor = notificationColor[indexPath.row]
        cell.scheduleImageByTypeImageView.image = scheduleImageByTypeImage[indexPath.row]
        cell.afterNotificationTimeLabel.text = afterNotificationTime[indexPath.row]
        cell.logoCircleImageView.image = circleView[indexPath.row]
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return self.view.frame.height/7
        return 95
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 0
    }
}
