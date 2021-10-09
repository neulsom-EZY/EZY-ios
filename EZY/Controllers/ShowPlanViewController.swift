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
    private var groupNameArray: [String] = ["EZY 회의", "디자인 이론 공부", "강아지 산책시키기", "카페에서 마카롱 사오기", "EZY 회의", "디자인 이론 공부", "강아지 산책시키기", "카페에서 마카롱 사오기"]
    
    private var planTitleTextArray: [String] = ["EZY 회의", "디자인 이론 공부", "강아지 산책시키기", "카페에서 마카롱 사오기", "EZY 회의댜댵", "디자인 이론 공부", "강아지 산책시키기", "카페에서 마카롱 사오기"]
    
    private var planTimeArray: [String] = ["12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00"]
    
    private let scheduleTypesArray = ["나의 할 일","심부름","문의하기", "설정"]
    
    private let icon = [UIImage(named: "EZY_OnePersonImage"), UIImage(named: "EZY_Errand"), UIImage(named: "EZY_InquiryImage"), UIImage(named: "EZY_settingsIcon")]
    
    fileprivate var userName = "Y00ujin"
    
    private lazy var planCompleteModalView = PlanCompleteModalView().then{
        $0.isHidden = true
        $0.okButton.addTarget(self, action: #selector(completeOkButtonClicked(sender:)), for: .touchUpInside)
        $0.cancelButton.addTarget(self, action: #selector(completeCancelButtonClicked(sender:)), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        $0.shadowBackgroundView.addGestureRecognizer(tapGesture)
    }
    
    private var selectedIndex = 0
    
    private let purpleColor: UIColor! = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    
    fileprivate let orangeColor: UIColor! = UIColor(red: 255/255, green: 166/255, blue: 128/255, alpha: 1)
    
    fileprivate let yellowColor: UIColor! = UIColor(red: 255/255, green: 209/255, blue: 141/255, alpha: 1)
    
    fileprivate let greenColor: UIColor! = UIColor(red: 184/255, green: 128/255, blue: 255/255, alpha: 1)
    
    fileprivate lazy var EZYPlanBackgroundColor: [UIColor] = [purpleColor, orangeColor, yellowColor, greenColor, purpleColor, orangeColor, yellowColor, greenColor]
    
    fileprivate let questionTopLabelColorArray = [UIColor(red: 165/255, green: 139/255, blue: 254/255, alpha: 1), UIColor(red: 114/255, green: 111/255, blue: 254/255, alpha: 1)]
    
    private let questionMiddleLabelColorArray = [UIColor(red: 114/255, green: 111/255, blue: 255/255, alpha: 1), UIColor(red: 140/255, green: 139/255, blue: 255/255, alpha: 1)]
    
    private let questionBottomLabelColorArray = [UIColor(red: 140/255, green: 139/255, blue: 255/255, alpha: 1), UIColor(red: 218/255, green: 225/255, blue: 255/255, alpha: 1)]
    
    private let badgeView = UIView().then {
        $0.backgroundColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
        $0.isHidden = true
    }
    
    private let notificationButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_Notification"), for: .normal)
        $0.addTarget(self, action: #selector(notificationButtonClicked), for: .touchUpInside)
    }

    private lazy var questionTopLabel = UILabel().then {
        $0.text = "\(userName)님,"
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 28, currentFontName: "AppleSDGothicNeo-Bold")
        $0.updateGradientTextColor_vertical(gradientColors: questionTopLabelColorArray)
    }
    
    private lazy var questionMiddleLabel = UILabel().then{
        $0.text = "오늘은 어떤 하루를"
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Bold")
        $0.updateGradientTextColor_vertical(gradientColors: questionMiddleLabelColorArray)
    }
    
    private lazy var questionBottomLabel = UILabel().then{
        $0.text = "보내실 건가요?"
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Bold")
        $0.updateGradientTextColor_vertical(gradientColors: questionBottomLabelColorArray)
    }
    
    fileprivate lazy var ezyListTitleLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "EZYLIST"
        $0.dynamicFont(fontSize: 12, currentFontName: "Poppins-Bold")
    }
    
    private let EZYPlanAddButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_PlanAddButton"), for: .normal)
        $0.addTarget(self, action: #selector(EZYPlanAddButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let emptyPlanBoxView = UIView().then{
        $0.backgroundColor = .white
    }
    
    private let emptyLabel = UITextView().then{
        $0.isScrollEnabled = false
        $0.isEditable = false
        $0.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        $0.text = "아직 계획이 없네요 !\n가치있는 하루를 위해 계획을 세워보세요"
        $0.textAlignment = .center
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let emptyImageView = UIImageView().then{
        $0.image = UIImage(named: "EZY_EmptyImage")
    }
    
    private let scheduleTimeTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.register(ScheduleTimeTableViewCell.self, forCellReuseIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier)
    }
    
    private let scheduleTypeCollectionMainView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 17, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        $0.register(ScheduleTypeCollectionViewCell.self, forCellWithReuseIdentifier: ScheduleTypeCollectionViewCell.ScheduleTypeCollectionViewIdentifier)
        $0.backgroundColor = .white
    }
    
    private let bgView = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let middleComponemtView = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 0, height: 5)
        $0.layer.shadowColor = UIColor.white.cgColor
        $0.addTarget(self, action: #selector(middleComponemtViewClicked(sender:)), for: .touchUpInside)
    }
    
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        
        location()
        
        tableViewDataSourceAndDelegate()
        
        collectionViewDataSourceAndDelegate()
    }
    
    // MARK: - resetTableViewCollectionView
    func resetTableViewCollectionView(){
        scheduleTimeTableView.resetTableViewScrollPositionToTop()
        scheduleTypeCollectionMainView.resetCollectionViewScrollPositionToTop()
    }
    
    // MARK: - collectionViewDataSourceAndDelegate
    func collectionViewDataSourceAndDelegate(){
        scheduleTypeCollectionMainView.delegate = self
        scheduleTypeCollectionMainView.dataSource = self
    }
    
    // MARK: - tableViewDataSourceAndDelegate
    func tableViewDataSourceAndDelegate(){
        scheduleTimeTableView.dataSource = self
        scheduleTimeTableView.delegate = self
    }
    
    // MARK: - addView
    func addView(){
        self.view.backgroundColor = .white
        self.view.addSubview(questionTopLabel)
        self.view.addSubview(questionMiddleLabel)
        self.view.addSubview(questionBottomLabel)
        self.view.addSubview(notificationButton)
        self.notificationButton.addSubview(badgeView)
        self.view.addSubview(emptyPlanBoxView)
        emptyPlanBoxView.addSubview(emptyLabel)
        emptyPlanBoxView.addSubview(emptyImageView)
        self.view.addSubview(scheduleTimeTableView)
        self.view.addSubview(middleComponemtView)
        middleComponemtView.addSubview(ezyListTitleLabel)
        middleComponemtView.addSubview(EZYPlanAddButton)
        self.view.addSubview(scheduleTypeCollectionMainView)
        self.view.addSubview(planCompleteModalView)
        
        let attributedString = NSMutableAttributedString(string: ezyListTitleLabel.text!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(3.0), range: NSRange(location: 0, length: attributedString.length))
        ezyListTitleLabel.attributedText = attributedString
    }
    
    // MARK: - location
    func location(){
        questionTopLabel.snp.makeConstraints { make in
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
        
        badgeView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.right.equalToSuperview().offset(-3)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(badgeView.snp.width)
            
            badgeView.layer.cornerRadius = view.frame.height/54.1/4
        }
        
        notificationButton.snp.makeConstraints { make in
            make.top.equalTo(questionTopLabel)
            make.right.equalToSuperview().offset(-26.8)
            make.width.equalToSuperview().dividedBy(31.2/2)
            make.height.equalToSuperview().dividedBy(54.1/2)
        }
        
        scheduleTypeCollectionMainView.snp.makeConstraints { make in
            make.top.equalTo(questionBottomLabel.snp.bottom)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(5.01)
            
            scheduleTypeCollectionMainView.backgroundColor = .clear
        }
        
        middleComponemtView.snp.makeConstraints { make in
            make.top.equalTo(scheduleTypeCollectionMainView.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(13)
        }
        
        ezyListTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(questionTopLabel)
        }

        EZYPlanAddButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(notificationButton)
        }
        
        scheduleTimeTableView.snp.makeConstraints { make in
            make.top.equalTo(ezyListTitleLabel.snp.bottom).offset(self.view.frame.height/36)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        planCompleteModalView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        planCompleteModalView.shadowBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        planCompleteModalView.cancelButton.snp.makeConstraints { make in
            make.bottom.equalTo(planCompleteModalView.okButton)
            make.right.equalTo(planCompleteModalView.okButton.snp.left).offset(-self.view.frame.width/35)
            make.height.width.equalTo(planCompleteModalView.okButton)
        }
        
        planCompleteModalView.okButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.width/22)
            make.right.equalToSuperview().offset(-self.view.frame.width/18)
            make.height.equalToSuperview().dividedBy(3.9)
            make.width.equalToSuperview().dividedBy(4.44)
        }
        
        emptyPlanBoxView.snp.makeConstraints { make in
            make.top.equalTo(ezyListTitleLabel.snp.bottom).offset(self.view.frame.height/12.11)
            make.bottom.equalToSuperview().offset(self.view.frame.height/12.11)
            make.left.right.equalToSuperview()
        }
        
        emptyImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
            make.width.equalToSuperview().dividedBy(1.4)
        }
        
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyImageView.snp.bottom).offset(self.view.frame.height/33.8)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Selectors
    @objc func handleTap(sender:UITapGestureRecognizer){
        planCompleteModalView.isHidden = true
    }
    
    @objc func middleComponemtViewClicked(sender:UIButton){
        let indexPath = NSIndexPath(row: NSNotFound, section: 0)
        self.scheduleTimeTableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
    }
    
    @objc func EZYPlanAddButtonClicked(sender:UIButton){
        let MoreCalendarModalsVC = MoreCalendarModalsViewController.instance()
        present(MoreCalendarModalsVC, animated: true, completion: nil)
        
        MoreCalendarModalsVC.delegate = self
        
        addDim()
    }
    
    @objc func notificationButtonClicked(sender: UIButton) {
        resetTableViewCollectionView()
        let pushVC = NotificationViewController()
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    @objc func completeOkButtonClicked(sender: UIButton) {
        groupNameArray.remove(at: selectedIndex)
        planTitleTextArray.remove(at: selectedIndex)
        planTimeArray.remove(at: selectedIndex)
        EZYPlanBackgroundColor.remove(at: selectedIndex)
        
        scheduleTimeTableView.deleteRows(at: [IndexPath(row: selectedIndex, section: 0)], with: .automatic)
                
        planCompleteModalView.isHidden = true
    }
    
    @objc func completeCancelButtonClicked(sender: UIButton){
        planCompleteModalView.isHidden = true
    }
    
    // MARK: - addDim
    private func addDim() {
           view.addSubview(bgView)
           bgView.snp.makeConstraints { (make) in
               make.edges.equalTo(0)
           }
           
           DispatchQueue.main.async { [weak self] in
               self?.bgView.alpha = 0.2
           }
       }
       
    // MARK: - removeDim
    private func removeDim() {
        DispatchQueue.main.async { [weak self] in
            self?.bgView.removeFromSuperview()
        }
    }
}

// MARK: - collectionView Extension
extension ShowPlanViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.width / 3.45, height: (self.view.frame.width / 3)/0.95)
    }
    
    //MARK: collectionView - left Padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: self.view.frame.width/11)
    }
    
    //MARK: collectionView - cell 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 2{
            resetTableViewCollectionView()
            let nextViewController = InquiryViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        if indexPath.row == 3{
            resetTableViewCollectionView()
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

// MARK: - tableView Extension
extension ShowPlanViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if groupNameArray.count == 0{
            tableView.isHidden = true
            emptyPlanBoxView.isHidden = false
            return groupNameArray.count
        }else{
            emptyPlanBoxView.isHidden = true
            tableView.isHidden = false
            return groupNameArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier, for: indexPath) as! ScheduleTimeTableViewCell
        
        cell.groupNameLabel.text = groupNameArray[indexPath.row]
        cell.titleLabel.text = planTitleTextArray[indexPath.row]
        cell.planTimeLabel.text = planTimeArray[indexPath.row]

        cell.EZYLISTCellLeftDecorationView.backgroundColor = EZYPlanBackgroundColor[indexPath.row]
        cell.titleLabel.textColor = EZYPlanBackgroundColor[indexPath.row]
        cell.groupNameLabel.textColor = EZYPlanBackgroundColor[indexPath.row]
                
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
        
        // 일정 이름 길이에 따른 모달의 layout 변경
        if planTitleTextArray[indexPath.row].count <= 10{
            planCompleteModalView.modalBackgroundView.snp.remakeConstraints { make in
                make.width.equalToSuperview().dividedBy(1.1)
                make.height.equalToSuperview().dividedBy(6.29)
                make.centerX.centerY.equalToSuperview()
            }
                                    
            planCompleteModalView.labelView.snp.remakeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalTo((planTitleTextArray[indexPath.row] as NSString).size(withAttributes: [NSAttributedString.Key.font : planCompleteModalView.planTitleNameLabel.font!]).width + (planCompleteModalView.completeQuestionsLabel.text! as NSString).size(withAttributes: [NSAttributedString.Key.font : planCompleteModalView.completeQuestionsLabel.font!]).width + self.view.frame.width/70)
                make.height.equalToSuperview().dividedBy(10)
                make.top.equalToSuperview().offset(self.view.frame.height/21)
            }
            
            planCompleteModalView.planTitleNameLabel.snp.remakeConstraints { make in
                make.left.centerY.equalToSuperview()
            }
            
            planCompleteModalView.completeQuestionsLabel.snp.remakeConstraints { make in
                make.right.centerY.equalToSuperview()
            }
        }else{
            planCompleteModalView.modalBackgroundView.snp.remakeConstraints { make in
                make.width.equalToSuperview().dividedBy(1.1)
                make.height.equalToSuperview().dividedBy(5.75)
                make.centerX.centerY.equalToSuperview()
            }
            
            planCompleteModalView.labelView.snp.remakeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalToSuperview()
                make.height.equalToSuperview().dividedBy(3.8)
                make.top.equalToSuperview().offset(self.view.frame.height/21)
            }
            
            planCompleteModalView.planTitleNameLabel.snp.remakeConstraints { make in
                make.top.centerX.equalToSuperview()
            }
            
            planCompleteModalView.completeQuestionsLabel.snp.remakeConstraints { make in
                make.bottom.centerX.equalToSuperview()
            }
        }
    
        planCompleteModalView.planTitleNameLabel.text = planTitleTextArray[indexPath.row]
        
        selectedIndex = indexPath.row
        
        planCompleteModalView.isHidden = false
        
    }
}

// MARK: - BulletinDelegate Extension
extension ShowPlanViewController: BulletinDelegate {
    func onTapClose() {
        self.removeDim()
    }
    func update(){
        self.removeDim()
    }
}

extension UIScrollView {
    func resetCollectionViewScrollPositionToTop() {
        self.contentOffset = CGPoint(x: -contentInset.left, y: -contentInset.top)
    }
}

extension UITableView {
    func resetTableViewScrollPositionToTop() {
        let indexPath = NSIndexPath(row: NSNotFound, section: 0)
        self.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
    }
}
