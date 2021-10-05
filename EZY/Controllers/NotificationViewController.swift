//
//  NotificationViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/04.
//

import UIKit

class NotificationViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var notificationTableView = notificationTableMainView.tableView
    
    private var isViewed = [Bool]() // 알림이 조회되었는지
    
    private var scheduleTypeArray = [String]()
    
    private var notificationContentArray = [String]()
    
    private var afterNotificationTimeArray = [String]()
    
    private var scheduleImageByTypeImageArray = [UIImage]()
    
    var isErrendAccept: Bool = false
    
    private lazy var notificationTableMainView = NotificationTableView.init(frame: self.view.frame).then{
        $0.tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: NotificationTableViewCell.NotificationTableViewIdentifier)
    }
    
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
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI(){
        addView()
        
        location()
    }
    
    // MARK: - tagleViewDelegateAndDataSource
    func tagleViewDelegateAndDataSource(){
        notificationTableMainView.tableView.delegate = self
        notificationTableMainView.tableView.dataSource = self
    }
    
    // MARK: - addView
    func addView(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(backButton)
        self.view.addSubview(notificationTitleLabel)
        self.view.addSubview(notificationTableMainView.tableView)
        self.view.addSubview(errendAcceptCheckView)
        errendAcceptCheckView.addSubview(acceptedErrendLabelView)
        acceptedErrendLabelView.addSubview(acceptedErrendNameLabel)
        acceptedErrendLabelView.addSubview(acceptedErrendAddCheckLabel)
    }
    
    // MARK: - location
    func location(){
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
        
    }
    
    // MARK: - Selectors
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDelegate Extension
extension NotificationViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if scheduleTypeArray[indexPath.row] == "개인 일정"{
            let nextViewController = PersonalPlanDetailViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }else if scheduleTypeArray[indexPath.row] == "심부름"{
            // 심부름을 수락한 후라면 심부름 상세 페이지로 전환
            // let nextViewController = ErrandDetailsViewController()
            // self.navigationController?.pushViewController(nextViewController, animated: true)
            
            // 심부름을 수락하기 전이라면 심부름 요청 응답 페이지로 전환
            let nextViewController = PlanRequestRespondingViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}

// MARK: - UITableViewDataSource Extension
extension NotificationViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleTypeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.NotificationTableViewIdentifier, for: indexPath) as! NotificationTableViewCell
        
        cell.scheduleTypeLabel.text = scheduleTypeArray[indexPath.row]
        cell.notificationContentLabel.text = notificationContentArray[indexPath.row]
        cell.afterNotificationTimeLabel.text = afterNotificationTimeArray[indexPath.row]
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/8.54
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 0
    }
}
