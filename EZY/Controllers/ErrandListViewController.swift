//
//  ErrandListViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/07/19.
//

import UIKit
import SnapKit
import Then

class ErrandListViewController: UIViewController {
    //MARK: - Properties

    lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_ListBackBtn"), for: .normal)
    }
    
    lazy var listName = UILabel().then {
        $0.text = "심부름 목록"
        $0.textColor = UIColor.EZY_AAA8FF
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var line = UIView().then {
        $0.backgroundColor = .EZY_D0D0D0
    }
    
    lazy var acceptErrandTag = ListTagView().then {
        $0.listLabel.text = "부탁받은 심부름"
    }
    
    lazy var acceptTableView = ScheduleTimeTableView.init(frame: self.view.frame)
    
    var acceptDescriptionArray: [String] = ["부탁받은 심부름", "부탁받은 심부름"]
    
    let acceptTitleArray: [String] = ["EZY 회의", "EZY 회의"]
    
    let acceptPlanTimeArray: [String] = ["12:00 - 13:00", "12:00 - 13:00"]
    
    lazy var acceptPlanBackgroundColor: [UIColor] = [.EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE]
    
    lazy var acceptPlanDoOrFinishColor: [UIColor] = [.EZY_PLAN_DO_BACK, .EZY_PLAN_FINISH_BACK]
    
    lazy var sendErrandTag = ListTagView().then {
        $0.listLabel.text = "부탁한 심부름"
        $0.listLabel.textColor = .EZY_8F85FF
        $0.layer.borderColor = UIColor.EZY_8F85FF.cgColor
    }
    
    lazy var sendTableView = ScheduleTimeTableView.init(frame: self.view.frame)
    
    var sendDescriptionArray: [String] = ["부탁한 심부름", "부탁한 심부름"]
    
    let sendTitleArray: [String] = ["EZY 회의", "EZY 회의"]
    
    let sendPlanTimeArray: [String] = ["12:00 - 13:00", "12:00 - 13:00"]
    
    lazy var sendPlanBackgroundColor: [UIColor] = [.EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE]
    
    lazy var sendPlanDoOrFinishColor: [UIColor] = [.EZY_PLAN_DO_BACK, .EZY_PLAN_FINISH_BACK]

    lazy var waitErrandTag = ListTagView().then {
        $0.listLabel.text = "수락 대기 중인 심부름"
    }
    
    lazy var waitTableView = ScheduleTimeTableView.init(frame: self.view.frame)
    
    var waitDescriptionArray: [String] = ["수락 대기 중인 심부름", "수락 대기 중인 심부름"]
    
    let waitTitleArray: [String] = ["EZY 회의", "EZY 회의"]
    
    let waitPlanTimeArray: [String] = ["12:00 - 13:00", "12:00 - 13:00"]
    
    lazy var waitPlanBackgroundColor: [UIColor] = [.EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE]
    
    lazy var waitPlanDoOrFinishColor: [UIColor] = [.EZY_PLAN_DO_BACK, .EZY_PLAN_DO_BACK]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        
        listTagViewSetting()
        ScheduleTimeTableViewSetting()
        
        addView()
        cornerRadius()
        location()
    }
    
    func addView(){
        view.addSubview(backButton)
        view.addSubview(listName)
        view.addSubview(line)
        view.addSubview(acceptTableView)
        view.addSubview(sendTableView)
        view.addSubview(waitTableView)
        view.addSubview(acceptErrandTag)
        view.addSubview(sendErrandTag)
        view.addSubview(waitErrandTag)
    }
    
    func cornerRadius(){
        acceptErrandTag.layer.cornerRadius = self.view.frame.width/75
        sendErrandTag.layer.cornerRadius = self.view.frame.width/75
        waitErrandTag.layer.cornerRadius = self.view.frame.width/75
    }
    
    func location(){
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/13.31)
            make.left.equalToSuperview().offset(self.view.frame.width/13.39)
            make.width.height.equalTo(self.view.frame.width/15.63)
        }
        listName.snp.makeConstraints { make in
            make.top.equalTo(backButton).offset(self.view.frame.height/15.32)
            make.left.equalTo(backButton)
        }
        line.snp.makeConstraints { make in
            make.width.equalTo(self.view.frame.width/1.18)
            make.height.equalTo(self.view.frame.height/1624)
            make.centerX.equalToSuperview()
            make.top.equalTo(listName).offset(self.view.frame.height/16.57)
        }
        
        acceptErrandTag.snp.makeConstraints { make in
            make.top.equalTo(line).offset(self.view.frame.height/62.46)
            make.left.equalTo(line)
            make.width.equalTo(acceptErrandTag.listLabel).offset(self.view.frame.width/12.5)
            make.height.equalTo(self.view.frame.height/31.23)
        }
        
        acceptTableView.snp.makeConstraints { make in
            acceptTableView.backgroundColor = .clear
            make.top.equalTo(acceptErrandTag).offset(self.view.frame.height/67.67)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(sendErrandTag).offset(self.view.frame.height/18.92 * -1)
        }
        
        acceptTableView.tableView.snp.makeConstraints { make in
            make.top.equalTo(acceptTableView).offset(self.view.frame.height/36)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        sendErrandTag.snp.makeConstraints { make in
            make.bottom.equalTo(acceptErrandTag).offset(self.view.frame.height/3.58)
            make.left.equalTo(line)
            make.width.equalTo(sendErrandTag.listLabel).offset(self.view.frame.width/12.5)
            make.height.equalTo(self.view.frame.height/31.23)
        }
        
        sendTableView.snp.makeConstraints { make in
            acceptTableView.backgroundColor = .clear
            make.top.equalTo(sendErrandTag).offset(self.view.frame.height/67.67)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(waitErrandTag).offset(self.view.frame.height/18.92 * -1)
        }
        
        sendTableView.tableView.snp.makeConstraints { make in
            make.top.equalTo(sendTableView).offset(self.view.frame.height/36)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        waitErrandTag.snp.makeConstraints { make in
            make.bottom.equalTo(sendErrandTag).offset(self.view.frame.height/3.58)
            make.left.equalTo(line)
            make.width.equalTo(waitErrandTag.listLabel).offset(self.view.frame.width/12.5)
            make.height.equalTo(self.view.frame.height/31.23)
        }
        
        waitTableView.snp.makeConstraints { make in
            acceptTableView.backgroundColor = .clear
            make.top.equalTo(waitErrandTag).offset(self.view.frame.height/67.67)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        waitTableView.tableView.snp.makeConstraints { make in
            make.top.equalTo(waitTableView).offset(self.view.frame.height/36)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func listTagViewSetting() {
        acceptErrandTag.addSubview(acceptErrandTag.listLabel)
        acceptErrandTag.listTagViewLayoutSetting()
        
        sendErrandTag.addSubview(sendErrandTag.listLabel)
        sendErrandTag.listTagViewLayoutSetting()
        
        waitErrandTag.addSubview(waitErrandTag.listLabel)
        waitErrandTag.listTagViewLayoutSetting()
    }
    
    func ScheduleTimeTableViewSetting(){
        acceptTableView.tableView.dataSource = self
        acceptTableView.tableView.delegate = self
        
        acceptTableView.tableView.register(ScheduleTimeTableViewCell.self, forCellReuseIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier)
        
        sendTableView.tableView.dataSource = self
        sendTableView.tableView.delegate = self
        
        sendTableView.tableView.register(ScheduleTimeTableViewCell.self, forCellReuseIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier)
        
        waitTableView.tableView.dataSource = self
        waitTableView.tableView.delegate = self
        
        waitTableView.tableView.register(ScheduleTimeTableViewCell.self, forCellReuseIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier)
    }

}

extension ErrandListViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == acceptTableView.tableView {
            return acceptDescriptionArray.count
        } else if tableView == sendTableView.tableView {
            return sendDescriptionArray.count
        }
        return waitDescriptionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == acceptTableView.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier, for: indexPath) as! ScheduleTimeTableViewCell
            
            cell.groupNameLabel.text = acceptDescriptionArray[indexPath.row]
            cell.titleLabel.text = acceptTitleArray[indexPath.row]
            cell.planTimeLabel.text = acceptPlanTimeArray[indexPath.row]
            cell.EZYLISTCellLeftDecorationView.backgroundColor = acceptPlanBackgroundColor[indexPath.row]
            cell.EZYLISTCellBackground.backgroundColor = acceptPlanDoOrFinishColor[indexPath.row]
            cell.EZYLISTCellRightDecorationView.backgroundColor = acceptPlanDoOrFinishColor[indexPath.row]
            cell.titleLabel.textColor = acceptPlanBackgroundColor[indexPath.row]
            cell.groupNameLabel.textColor = acceptPlanBackgroundColor[indexPath.row]
            
            cell.backgroundColor = .clear
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            return cell
        } else if tableView == sendTableView.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier, for: indexPath) as! ScheduleTimeTableViewCell
            
            cell.groupNameLabel.text = sendDescriptionArray[indexPath.row]
            cell.titleLabel.text = sendTitleArray[indexPath.row]
            cell.planTimeLabel.text = sendPlanTimeArray[indexPath.row]
            cell.EZYLISTCellLeftDecorationView.backgroundColor = sendPlanBackgroundColor[indexPath.row]
            cell.EZYLISTCellBackground.backgroundColor = sendPlanDoOrFinishColor[indexPath.row]
            cell.EZYLISTCellRightDecorationView.backgroundColor = sendPlanDoOrFinishColor[indexPath.row]
            cell.titleLabel.textColor = sendPlanBackgroundColor[indexPath.row]
            cell.groupNameLabel.textColor = sendPlanBackgroundColor[indexPath.row]
            
            cell.backgroundColor = .clear
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier, for: indexPath) as! ScheduleTimeTableViewCell
            
            cell.groupNameLabel.text = waitDescriptionArray[indexPath.row]
            cell.titleLabel.text = waitTitleArray[indexPath.row]
            cell.planTimeLabel.text = waitPlanTimeArray[indexPath.row]
            cell.EZYLISTCellLeftDecorationView.backgroundColor = waitPlanBackgroundColor[indexPath.row]
            cell.EZYLISTCellBackground.backgroundColor = waitPlanDoOrFinishColor[indexPath.row]
            cell.EZYLISTCellRightDecorationView.backgroundColor = waitPlanDoOrFinishColor[indexPath.row]
            cell.titleLabel.textColor = waitPlanBackgroundColor[indexPath.row]
            cell.groupNameLabel.textColor = waitPlanBackgroundColor[indexPath.row]
            
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

extension ErrandListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cell = tableView.cellForRow(at: indexPath)
    }

    
}

//MARK: - Preview

#if DEBUG
import SwiftUI
struct ErrandListViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ErrandListViewController()
    }
}
@available(iOS 13.0, *)
struct ErrandListViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ErrandListViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

