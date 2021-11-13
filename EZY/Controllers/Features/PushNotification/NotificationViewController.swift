//
//  NotificationViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/04.
//

import UIKit

class NotificationViewController: UIViewController {
    
    // MARK: - Properties
    private var isViewed = [Bool]() // 알림이 조회되었는지
    
    private var scheduleTypeArray = [String]()

    private var notificationContentArray = [String]()

    private var afterNotificationTimeArray = [String]()

    private var scheduleImageByTypeImageArray = [UIImage]()
    
    private var testScheduleTypeArray = ["개인일정","심부름","심부름","개인일정","심부름","심부름","심부름","심부름"]

    private var testNotificationContentArray = ["강아지 산책시키기 일정을 완료하셨나요?\n확인해보세요!","지환님이 마카롱 사기 심부름을 부탁했어요. \n확인해볼까요?","지환님이 마카롱 사기 심부름을 취소했어요!\n심부름이 삭제되었어요!","강아지 산책시키기 일정을 완료하셨나요?\n확인해보세요!","시원님이 마카롱 사기 심부름을 포기했어요!\n심부름이 삭제되었어요!","시원님이 마카롱 사기 심부름을 거절했어요!\n심부름이 삭제되었어요!","시원님이 마카롱 사기 심부름을 수락했어요!\n심부름이 추가되었어요!", "시원님이 마카롱 사기 심부름을 완료했어요!\n감사인사를 전해보세요!"]

    private var testAfterNotificationTimeArray = ["12분 전","12분 전","12분 전","12분 전","12분 전","12분 전","12분 전","12분 전"]
    
    var isErrendAccept: Bool = false
    
    let notificationTableView: UITableView = UITableView().then{
        $0.separatorStyle = .none
        $0.register(NotificationTableViewCell.self, forCellReuseIdentifier: NotificationTableViewCell.NotificationTableViewIdentifier)
    
    }
    
    let items: [String] = ["abc", "def", "ghi"]
        
    private var backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_NotificationBackButton"), for: .normal)
        $0.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private var notificationTitleLabel = UILabel().then {
        $0.text = "알림"
        $0.textColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 23, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private var errendAcceptCheckView = UIView().then{
        $0.backgroundColor = UIColor.rgb(red: 250, green: 250, blue: 250)
        $0.layer.applySketchShadow(color: .lightGray, alpha: 0.4, x: 0, y: 4, blur: 15, spread: 0)
        $0.layer.cornerRadius = 10
        $0.isHidden = true
    }
    
    private var acceptedErrendLabelView = UIView().then{
        $0.backgroundColor = .clear
    }
    
    private var acceptedErrendNameLabel = UILabel().then{
        $0.text = "마카롱 사오기"
        $0.textColor = UIColor.rgb(red: 174, green: 174, blue: 174)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private var acceptedErrendAddCheckLabel = UILabel().then{
        $0.text = "심부름이 추가되었습니다."
        $0.textColor = UIColor.rgb(red: 122, green: 122, blue: 122)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private var noNotificationImageView = UIImageView().then{
        $0.image = UIImage(named: "EZY_NotificationNoImage")
    }
    
    private var noNotificationLabel = UILabel().then{
        $0.text = "알림이 없네요!"
        $0.textColor = UIColor.rgb(red: 82, green: 82, blue: 82)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private var addPlanLabel = UILabel().then{
        $0.text = "메인페이지에서 일정을 추가해보세요!"
        $0.textColor = UIColor.rgb(red: 82, green: 82, blue: 82)
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private var noNotificationComponentView = UIView()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI(){
        addView()
        
        location()
        
        tableViewDelegateAndDataSource()
        
        tableViewSetting()
    }
    
    func tableViewSetting(){
        if testNotificationContentArray.isEmpty {
            noNotificationComponentView.isHidden = false
            notificationTableView.isHidden = true
        }else{
            noNotificationComponentView.isHidden = true
            notificationTableView.isHidden = false
        }
    }
    
    // MARK: - tableViewDelegateAndDataSource
    func tableViewDelegateAndDataSource(){
        self.notificationTableView.dataSource = self
        self.notificationTableView.delegate = self
    }
    
    // MARK: - addView
    func addView(){
        self.view.backgroundColor = .white
        self.view.addSubview(backButton)
        self.view.addSubview(notificationTitleLabel)
        self.view.addSubview(errendAcceptCheckView)
        self.view.addSubview(self.notificationTableView)
        errendAcceptCheckView.addSubview(acceptedErrendLabelView)
        acceptedErrendLabelView.addSubview(acceptedErrendNameLabel)
        acceptedErrendLabelView.addSubview(acceptedErrendAddCheckLabel)
        self.view.addSubview(noNotificationComponentView)
        noNotificationComponentView.addSubview(noNotificationImageView)
        noNotificationComponentView.addSubview(noNotificationLabel)
        noNotificationComponentView.addSubview(addPlanLabel)
    }
    
    // MARK: - location
    func location(){
        notificationTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/30)
            make.left.equalTo(backButton)
        }

        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/13.3)
            make.left.equalToSuperview().offset(self.view.frame.width/13.39)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        notificationTableView.snp.makeConstraints { make in
            make.top.equalTo(notificationTitleLabel.snp.bottom).offset(self.view.frame.height/30.07)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        errendAcceptCheckView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.49)
            make.height.equalToSuperview().dividedBy(12)
        }

        acceptedErrendLabelView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }

        acceptedErrendNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }

        acceptedErrendAddCheckLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        noNotificationComponentView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(2.84)
            make.width.equalToSuperview().dividedBy(1.55)
            make.centerX.centerY.equalToSuperview()
        }

        noNotificationImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.82)
        }

        noNotificationLabel.snp.makeConstraints { make in
            make.top.equalTo(noNotificationImageView.snp.bottom).offset(self.view.frame.height/29)
            make.centerX.equalToSuperview()
        }

        addPlanLabel.snp.makeConstraints { make in
            make.top.equalTo(noNotificationLabel.snp.bottom).offset(self.view.frame.height/162.4)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Selectors
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}

extension NotificationViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if testScheduleTypeArray[indexPath.row] == "개인일정"{
            let nextVC = MyToDoDetailViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }else{
            let nextVC = PlanRequestRespondingViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

extension NotificationViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testScheduleTypeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NotificationTableViewCell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.NotificationTableViewIdentifier, for: indexPath) as! NotificationTableViewCell
        cell.selectionStyle = .none
//        cell.scheduleTypeLabel.text = scheduleTypeArray[indexPath.row]
//        cell.notificationContentLabel.text = notificationContentArray[indexPath.row]
//        cell.afterNotificationTimeLabel.text = afterNotificationTimeArray[indexPath.row]
        
        // 테스트
                cell.scheduleTypeLabel.text = testScheduleTypeArray[indexPath.row]
                cell.notificationContentLabel.text = testNotificationContentArray[indexPath.row]
                cell.afterNotificationTimeLabel.text = testAfterNotificationTimeArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/9.3
    }
}


