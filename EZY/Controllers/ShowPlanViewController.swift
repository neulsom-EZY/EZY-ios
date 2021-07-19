//
//  ShowScheduleViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/05/30.
//

import UIKit
import SnapKit
import Then

class ShowPlanViewController: UIViewController{
    
    //MARK: Properties
    private lazy var scheduleTypeCollectionMainView = ScheduleTypeCollectionView.init(frame: self.view.frame)
    
    private lazy var scheduleTimeTableMainView = ScheduleTimeTableView.init(frame: self.view.frame)
    
    let planCompleteModalView = PlanCompleteModalView()
    
    var groupNameArray: [String] = ["NEULSOM", "공부", "산책", "심부름", "NEULSOM", "공부", "산책", "심부름"]
    let titleArray: [String] = ["EZY 회의", "디자인 이론 공부", "강아지 산책시키기", "카페에서 마카롱 사오기", "EZY 회의", "디자인 이론 공부", "강아지 산책시키기", "카페에서 마카롱 사오기"]
    let planTimeArray: [String] = ["12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00"]
    
    let scheduleTypesArray = ["나의 할 일","우리의 할 일","심부름","문의하기", "설정"]
    let icon = [UIImage(named: "EZY_MyJob"), UIImage(named: "EZY_OurJob"), UIImage(named: "EZY_Errand"), UIImage(named: "EZY_Errand"),UIImage(named: "EZY_Errand")]
    
    lazy var userName = "Y00ujin"
    
    var purpleColor: UIColor! = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    var orangeColor: UIColor! = UIColor(red: 255/255, green: 166/255, blue: 128/255, alpha: 1)
    var yellowColor: UIColor! = UIColor(red: 255/255, green: 209/255, blue: 141/255, alpha: 1)
    var greenColor: UIColor! = UIColor(red: 184/255, green: 128/255, blue: 255/255, alpha: 1)
    
    lazy var EZYPlanBackgroundColor: [UIColor] = [purpleColor, orangeColor, yellowColor, greenColor, purpleColor, orangeColor, yellowColor, greenColor]
    
    let questionTopLabelColorArray = [UIColor(red: 165/255, green: 139/255, blue: 254/255, alpha: 1), UIColor(red: 114/255, green: 111/255, blue: 254/255, alpha: 1)]
    
    let questionMiddleLabelColorArray = [UIColor(red: 114/255, green: 111/255, blue: 255/255, alpha: 1), UIColor(red: 140/255, green: 139/255, blue: 255/255, alpha: 1)]
    
    let questionBottomLabelColorArray = [UIColor(red: 140/255, green: 139/255, blue: 255/255, alpha: 1), UIColor(red: 218/255, green: 225/255, blue: 255/255, alpha: 1)]
    
    lazy var badgeView = UIView().then {
        $0.backgroundColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
    }
    
    lazy var notificationButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_Notification"), for: .normal)
    }

    lazy var questionTopLabel = UILabel().then {
        $0.text = "\(userName)님,"
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 28, currentFontName: "AppleSDGothicNeo-Bold")
        $0.updateGradientTextColor_vertical(gradientColors: questionTopLabelColorArray)
    }
    
    lazy var questionMiddleLabel = UILabel().then{
        $0.text = "오늘은 어떤 하루를"
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Bold")
        $0.updateGradientTextColor_vertical(gradientColors: questionMiddleLabelColorArray)
    }
    
    lazy var questionBottomLabel = UILabel().then{
        $0.text = "보내실 건가요?"
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Bold")
        $0.updateGradientTextColor_vertical(gradientColors: questionBottomLabelColorArray)
    }
    
    lazy var EZYLISTTitleLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "EZYLIST"
        $0.dynamicFont(fontSize: 12, currentFontName: "Poppins-Bold")
    }
    
    var EZYPlanAddButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_PlanAddButton"), for: .normal)
    }
    
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationButtonSetting()
        
        ScheduleTypeCollectionMainViewSetting()
        
        ScheduleTimeTableMainViewSetting()

        layoutSetting()
        
        planCompleteModalViewSetting()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        badgeView.layer.cornerRadius = badgeView.bounds.width/2
        badgeView.isHidden = true
    }
    
    @objc func didBnotificationButtonClick(sender: UIButton!) {
        let pushVC = NotificationViewController()
        
//        pushVC.titleLabel.text = titleArray[indexPath.row]
        
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    @objc func completeOkButtonClicked(sender: UIButton!) {
        planCompleteModalView.isHidden = true
    }
    
    
    func notificationButtonSetting(){
        notificationButton.addTarget(self, action: #selector(didBnotificationButtonClick), for: .touchUpInside)
    }
    
    func ScheduleTypeCollectionMainViewSetting(){
        scheduleTypeCollectionMainView.collectionView.delegate = self
        scheduleTypeCollectionMainView.collectionView.dataSource = self
        
        scheduleTypeCollectionMainView.collectionView.register(ScheduleTypeCollectionViewCell.self, forCellWithReuseIdentifier: ScheduleTypeCollectionViewCell.ScheduleTypeCollectionViewIdentifier)
    }
    
    func ScheduleTimeTableMainViewSetting(){
        
        scheduleTimeTableMainView.tableView.dataSource = self
        scheduleTimeTableMainView.tableView.delegate = self
        
        scheduleTimeTableMainView.tableView.register(ScheduleTimeTableViewCell.self, forCellReuseIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier)
    }
    
    func planCompleteModalViewSetting(){
        self.view.addSubview(planCompleteModalView)
        
        planCompleteModalView.okButton.addTarget(self, action: #selector(completeOkButtonClicked(sender:)), for: .touchUpInside)
        
        planCompleteModalView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        planCompleteModalView.shadowBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        planCompleteModalView.modalBackgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.13)
            make.height.equalToSuperview().dividedBy(3.59)
            make.centerX.centerY.equalToSuperview()
        }
        
        planCompleteModalView.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        planCompleteModalView.iconCircleBackground.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(6.3)
            make.height.equalTo(planCompleteModalView.iconCircleBackground.snp.width)
            make.top.equalTo(planCompleteModalView.titleLabel.snp.bottom).offset(self.view.frame.height/62)
            
            planCompleteModalView.iconCircleBackground.layer.cornerRadius = ((self.view.frame.width/1.13)/6.3)/2
        }
        
        planCompleteModalView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2)
        }
        
        planCompleteModalView.labelView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.7)
            make.height.equalToSuperview().dividedBy(10)
            make.top.equalTo(planCompleteModalView.iconCircleBackground.snp.bottom).offset(self.view.frame.height/54.1)
        }
        
        planCompleteModalView.planTitleNameLabel.snp.makeConstraints { make in
            make.left.centerY.equalToSuperview()
        }
        
        planCompleteModalView.completeQuestionsLabel.snp.makeConstraints { make in
            make.right.centerY.equalToSuperview()
        }
        
        planCompleteModalView.okButton.snp.makeConstraints { make in
            make.bottom.equalTo(planCompleteModalView.cancelButton)
            make.right.equalTo(planCompleteModalView.cancelButton.snp.left).offset(-self.view.frame.width/35)
            make.height.width.equalTo(planCompleteModalView.cancelButton)
        }
        
        planCompleteModalView.cancelButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/30.6)
            make.right.equalToSuperview().offset(-self.view.frame.width/15)
            make.height.equalToSuperview().dividedBy(7.2)
            make.width.equalToSuperview().dividedBy(4.7)
        }
        
        planCompleteModalView.isHidden = true
    }
    
    func layoutSetting(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(scheduleTypeCollectionMainView)
        self.view.addSubview(questionTopLabel)
        self.view.addSubview(questionMiddleLabel)
        self.view.addSubview(questionBottomLabel)
        self.view.addSubview(notificationButton)
        self.view.addSubview(EZYLISTTitleLabel)
        self.view.addSubview(EZYPlanAddButton)
        notificationButton.addSubview(badgeView)
        
        self.view.addSubview(scheduleTimeTableMainView)
        
        scheduleTimeTableMainView.snp.makeConstraints { make in
            scheduleTimeTableMainView.backgroundColor = .clear
            make.top.equalTo(EZYLISTTitleLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        badgeView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.right.equalToSuperview().offset(-3)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(badgeView.snp.width)
        }
        
        notificationButton.snp.makeConstraints { make in
            make.top.equalTo(questionTopLabel)
            make.right.equalToSuperview().offset(-26.8)
            make.width.equalToSuperview().dividedBy(31.2/2)
            make.height.equalToSuperview().dividedBy(54.1/2)
        }
        
        questionTopLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/12.9)
            make.top.equalToSuperview().offset(self.view.frame.height/12)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        questionMiddleLabel.snp.makeConstraints { make in
            make.top.equalTo(questionTopLabel.snp.bottom)
            make.left.equalTo(questionTopLabel)
        }
        
        questionBottomLabel.snp.makeConstraints { make in
            make.top.equalTo(questionMiddleLabel.snp.bottom)
            make.left.equalTo(questionMiddleLabel)
        }
        
        EZYLISTTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(29)
            make.top.equalTo(scheduleTypeCollectionMainView.collectionView.snp.bottom).offset(9)
        }
        
        EZYPlanAddButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(29)
            make.top.equalTo(scheduleTypeCollectionMainView.collectionView.snp.bottom).offset(9)
        }
        
        scheduleTypeCollectionMainView.collectionView.snp.makeConstraints { make in
            make.top.equalTo(questionBottomLabel.snp.bottom)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
        }
        
        scheduleTimeTableMainView.tableView.snp.makeConstraints { make in
            make.top.equalTo(scheduleTimeTableMainView).offset(self.view.frame.height/36)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        let attributedString = NSMutableAttributedString(string: EZYLISTTitleLabel.text!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(3.0), range: NSRange(location: 0, length: attributedString.length))
        EZYLISTTitleLabel.attributedText = attributedString
    }
}

extension ShowPlanViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.width / 3.45, height: (self.view.frame.width / 3)/0.95)
    }
    
    //MARK: collectionView - left Padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    //MARK: collectionView - cell 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 3{
            let nextViewController = InquiryViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        if indexPath.row == 4{
            let nextViewController = SettingViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)

        }
    }
}

extension ShowPlanViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scheduleTypesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                ScheduleTypeCollectionViewCell.ScheduleTypeCollectionViewIdentifier, for: indexPath) as? ScheduleTypeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        cell.label.text = scheduleTypesArray[indexPath.row]
        cell.icon.image = icon[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
}

extension ShowPlanViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier, for: indexPath) as! ScheduleTimeTableViewCell
        
        cell.groupNameLabel.text = groupNameArray[indexPath.row]
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.planTimeLabel.text = planTimeArray[indexPath.row]
        
        cell.EZYLISTCellLeftDecorationView.backgroundColor = EZYPlanBackgroundColor[indexPath.row]
        cell.titleLabel.textColor = EZYPlanBackgroundColor[indexPath.row]
        cell.groupNameLabel.textColor = EZYPlanBackgroundColor[indexPath.row]
        
        print("tableView - cellForRowAt")
        print(indexPath.row)
        print(cell.titleLabel.text ?? "")
        
        cell.backgroundColor = .clear
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/8
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 0
    }

}

extension ShowPlanViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView - didSelectRowAt")
        var cell = tableView.cellForRow(at: indexPath)
        print(indexPath.row)
        print(titleArray[indexPath.row])
        
        planCompleteModalView.isHidden = false
        
    }
}

