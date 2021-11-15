//
//  MyToDoListViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/07/24.
//

import UIKit
import SnapKit
import Then

class MyToDoListViewController: UIViewController {
    //MARK: - Properties
        
    private let backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_DetailBackButton"), for: .normal)
        $0.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    private let listName = UILabel().then {
        $0.text = "나의 할 일 목록"
        $0.textColor = UIColor.EZY_AAA8FF
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .clear
    }
    
    private let scrollInnerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let firstListTag = ListTagView().then {
        $0.listLabel.text = "STUDY"
    }
    
    lazy var firstList = ScheduleTimeTableView.init(frame: self.view.frame)
    
    var firstDescriptionArray: [String] = ["STUDY", "STUDY"]
    
    let firstTitleArray: [String] = ["EZY 회의", "EZY 회의"]
    
    let firstPlanTimeArray: [String] = ["12:00 - 13:00", "12:00 - 13:00"]
    
    lazy var firstPlanBackgroundColor: [UIColor] = [.EZY_PLAN_MIDDLEPURPLE, .EZY_PLAN_FINISH_PURPLE]
    
    lazy var firstPlanDoOrFinishColor: [UIColor] = [.EZY_PLAN_DO_BACK, .EZY_PLAN_FINISH_BACK]
    
    lazy var firstPlanShadow: [CGColor] = [.EZY_PLAN_DO_SHADOW, .EZY_PLAN_FINISH_SHADOW]

    
    private let secondListTag = ListTagView().then {
        $0.listLabel.text = "APP Programming"
    }
    
    lazy var secondList = ScheduleTimeTableView.init(frame: self.view.frame)
    
    var secondDescriptionArray: [String] = ["APP Programming", "APP Programming", "APP Programming", "APP Programming"]
    
    let secondTitleArray: [String] = ["강아지 산책시키기", "카페에서 마카롱 사오기", "EZY 회의", "EZY 회의"]
    
    let secondPlanTimeArray: [String] = ["19:00 - 20:00", "20:30 - 21:00", "12:00 - 13:00", "12:00 - 13:00"]
    
    lazy var secondPlanBackgroundColor: [UIColor] = [.EZY_PLAN_PURPLE, .EZY_PLAN_LIGHTPURPLE, .EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE]
    
    lazy var secondPlanDoOrFinishColor: [UIColor] = [.EZY_PLAN_DO_BACK, .EZY_PLAN_DO_BACK, .EZY_PLAN_FINISH_BACK, .EZY_PLAN_FINISH_BACK]
    
    lazy var secondPlanShadow: [CGColor] = [.EZY_PLAN_DO_SHADOW, .EZY_PLAN_DO_SHADOW, .EZY_PLAN_FINISH_SHADOW, .EZY_PLAN_FINISH_SHADOW]
    
    private let noneListTag = ListTagView().then {
        $0.listLabel.text = "태그 없는 일정"
        $0.listLabel.textColor = .EZY_D0D0D0
    }
    
    lazy var noneList = ScheduleTimeTableView.init(frame: self.view.frame)
    
    var noneDescriptionArray: [String] = ["태그 없는 일정", "태그 없는 일정"]
    
    let noneTitleArray: [String] = ["강아지 산책시키기", "카페에서 마카롱 사오기"]
    
    let nonePlanTimeArray: [String] = ["19:00 - 20:00", "12:00 - 13:00"]
    
    lazy var nonePlanBackgroundColor: [UIColor] = [.EZY_PLAN_PURPLE, .EZY_PLAN_FINISH_PURPLE]
    
    lazy var nonePlanDoOrFinishColor: [UIColor] = [.EZY_PLAN_DO_BACK, .EZY_PLAN_FINISH_BACK]
    
    lazy var nonePlanShadow: [CGColor] = [.EZY_PLAN_DO_SHADOW, .EZY_PLAN_FINISH_SHADOW]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc
    private func goBack(){
        navigationController?.popViewController(animated: true )
    }
    
    @objc
    private func goDetail(){
        let controller = MyToDoDetailViewController()
        controller.toDoTag = toDoTag
        controller.toDoTitle = toDoTitle
        controller.toDoTime = toDoTime
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        
        listTagViewSetting()
        ScheduleTimeTableViewSetting()
        
        addView()
        cornerRadius()
        location()
    }
    
    private func addView(){
        view.addSubview(backButton)
        view.addSubview(listName)
        view.addSubview(scrollView)
        scrollView.addSubview(scrollInnerView)
        scrollInnerView.addSubview(firstListTag)
        scrollInnerView.addSubview(firstList)
        scrollInnerView.addSubview(secondListTag)
        scrollInnerView.addSubview(secondList)
        scrollInnerView.addSubview(noneListTag)
        scrollInnerView.addSubview(noneList)
    }
    
    private func cornerRadius(){
        firstListTag.layer.cornerRadius = self.view.frame.width/75
        secondListTag.layer.cornerRadius = self.view.frame.width/75
        noneListTag.layer.cornerRadius = self.view.frame.width/75
    }
    
    private func location(){
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/13.31)
            make.left.equalToSuperview().offset(self.view.frame.width/13.39)
            make.width.height.equalTo(self.view.frame.width/15.63)
        }
        
        listName.snp.makeConstraints { make in
            make.top.equalTo(backButton).offset(self.view.frame.height/15.32)
            make.left.equalTo(backButton)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(listName.snp.bottom).offset(self.view.frame.height/81.2)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        scrollInnerView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide)
            make.bottom.equalTo(scrollView.contentLayoutGuide)
            make.leading.equalTo(scrollView.contentLayoutGuide)
            make.bottom.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
            make.height.equalTo(firstList.tableView.contentSize.height + secondList.tableView.contentSize.height + noneList.tableView.contentSize.height + (self.view.frame.height / 13.5) * 3) // tableView Height만큼 + tag 차지 높이 * tag 수
        }
        
        firstListTag.snp.makeConstraints { make in
            make.top.equalTo(scrollInnerView).offset(self.view.frame.height/46.4)
            make.left.equalTo(listName)
            make.width.equalTo(firstListTag.listLabel).offset(self.view.frame.width/12.5)
            make.height.equalTo(self.view.frame.height/31.23)
        }
        
        firstList.snp.makeConstraints { make in
            firstList.backgroundColor = .clear
            make.top.equalTo(firstListTag).offset(self.view.frame.height/47.76)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(secondListTag).offset(self.view.frame.height/18.92 * -1)
        }
        
        firstList.tableView.snp.makeConstraints { make in
            make.top.equalTo(firstList).offset(self.view.frame.height/36)
            make.width.height.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        secondListTag.snp.makeConstraints { make in
            make.top.equalTo(firstList.tableView).offset(firstList.tableView.contentSize.height + self.view.frame.height / 81.2)
            make.left.equalTo(backButton)
            make.width.equalTo(secondListTag.listLabel).offset(self.view.frame.width/12.5)
            make.height.equalTo(self.view.frame.height/31.23)
        }
        
        secondList.snp.makeConstraints { make in
            secondList.backgroundColor = .clear
            make.top.equalTo(secondListTag).offset(self.view.frame.height/47.76)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(noneListTag).offset(self.view.frame.height/18.92 * -1)
        }
        
        secondList.tableView.snp.makeConstraints { make in
            make.top.equalTo(secondList).offset(self.view.frame.height/36)
            make.width.height.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        noneListTag.snp.makeConstraints { make in
            make.top.equalTo(secondList.tableView).offset(secondList.tableView.contentSize.height + self.view.frame.height / 81.2)
            make.left.equalTo(backButton)
            make.width.equalTo(noneListTag.listLabel).offset(self.view.frame.width/12.5)
            make.height.equalTo(self.view.frame.height/31.23)
        }
        
        noneList.snp.makeConstraints { make in
            noneList.backgroundColor = .clear
            make.top.equalTo(noneListTag).offset(self.view.frame.height/47.76)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        noneList.tableView.snp.makeConstraints { make in
            make.top.equalTo(noneList).offset(self.view.frame.height/36)
            make.width.height.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    private func listTagViewSetting() {
        firstListTag.addSubview(firstListTag.listLabel)
        firstListTag.listTagViewLayoutSetting()
        
        secondListTag.addSubview(secondListTag.listLabel)
        secondListTag.listTagViewLayoutSetting()
        
        noneListTag.addSubview(noneListTag.listLabel)
        noneListTag.listTagViewLayoutSetting()
    }
    
    private func ScheduleTimeTableViewSetting(){
        firstList.tableView.dataSource = self
        firstList.tableView.delegate = self
        
        firstList.tableView.register(ScheduleTimeTableViewCell.self, forCellReuseIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier)
        
        secondList.tableView.dataSource = self
        secondList.tableView.delegate = self
        
        secondList.tableView.register(ScheduleTimeTableViewCell.self, forCellReuseIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier)
        
        noneList.tableView.dataSource = self
        noneList.tableView.delegate = self
        
        noneList.tableView.register(ScheduleTimeTableViewCell.self, forCellReuseIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier)
        
        firstList.tableView.contentSize = CGSize(width: self.view.frame.width, height: (self.view.frame.height/8) * CGFloat(firstDescriptionArray.count))
        secondList.tableView.contentSize = CGSize(width: self.view.frame.width, height: (self.view.frame.height/8) * CGFloat(secondDescriptionArray.count))
        noneList.tableView.contentSize = CGSize(width: self.view.frame.width, height: (self.view.frame.height/8) * CGFloat(noneDescriptionArray.count))
        
        firstList.tableView.isScrollEnabled = false
        secondList.tableView.isScrollEnabled = false
        noneList.tableView.isScrollEnabled = false
    }
}

extension MyToDoListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == firstList.tableView {
            return firstDescriptionArray.count
        } else if tableView == secondList.tableView {
            return secondDescriptionArray.count
        } else {
            return noneDescriptionArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == firstList.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier, for: indexPath) as! ScheduleTimeTableViewCell
            
            cell.groupNameLabel.text = firstDescriptionArray[indexPath.row]
            cell.titleLabel.text = firstTitleArray[indexPath.row]
            cell.planTimeLabel.text = firstPlanTimeArray[indexPath.row]
            cell.EZYLISTCellLeftDecorationView.backgroundColor = firstPlanBackgroundColor[indexPath.row]
            cell.EZYLISTCellBackground.backgroundColor = firstPlanDoOrFinishColor[indexPath.row]
            cell.EZYLISTCellRightDecorationView.backgroundColor = firstPlanDoOrFinishColor[indexPath.row]
            cell.titleLabel.textColor = firstPlanBackgroundColor[indexPath.row]
            cell.groupNameLabel.textColor = firstPlanBackgroundColor[indexPath.row]
            cell.EZYLISTCellRightDecorationView.layer.shadowColor = firstPlanShadow[indexPath.row]
            cell.backgroundColor = .clear
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            return cell
        } else if tableView == secondList.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier, for: indexPath) as! ScheduleTimeTableViewCell
            cell.groupNameLabel.text = secondDescriptionArray[indexPath.row]
            cell.titleLabel.text = secondTitleArray[indexPath.row]
            cell.planTimeLabel.text = secondPlanTimeArray[indexPath.row]
            cell.EZYLISTCellLeftDecorationView.backgroundColor = secondPlanBackgroundColor[indexPath.row]
            cell.EZYLISTCellBackground.backgroundColor = secondPlanDoOrFinishColor[indexPath.row]
            cell.EZYLISTCellRightDecorationView.backgroundColor = secondPlanDoOrFinishColor[indexPath.row]
            cell.titleLabel.textColor = secondPlanBackgroundColor[indexPath.row]
            cell.groupNameLabel.textColor = secondPlanBackgroundColor[indexPath.row]
            cell.EZYLISTCellRightDecorationView.layer.shadowColor = secondPlanShadow[indexPath.row]
            cell.backgroundColor = .clear
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            return cell
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier, for: indexPath) as! ScheduleTimeTableViewCell
            cell.groupNameLabel.text = noneDescriptionArray[indexPath.row]
            cell.titleLabel.text = noneTitleArray[indexPath.row]
            cell.planTimeLabel.text = nonePlanTimeArray[indexPath.row]
            cell.EZYLISTCellLeftDecorationView.backgroundColor = nonePlanBackgroundColor[indexPath.row]
            cell.EZYLISTCellBackground.backgroundColor = nonePlanDoOrFinishColor[indexPath.row]
            cell.EZYLISTCellRightDecorationView.backgroundColor = nonePlanDoOrFinishColor[indexPath.row]
            cell.titleLabel.textColor = nonePlanBackgroundColor[indexPath.row]
            cell.groupNameLabel.textColor = nonePlanBackgroundColor[indexPath.row]
            cell.EZYLISTCellRightDecorationView.layer.shadowColor = nonePlanShadow[indexPath.row]
            cell.backgroundColor = .clear
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/8
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 0
    }

}

extension MyToDoListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var cell = tableView.cellForRow(at: indexPath)
        if tableView == firstList.tableView {
            goDetail()
        } else if tableView == secondList.tableView {
            goDetail()
        } else {
            goDetail()
        }
    }
    

    
}

