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
    
    var errandType:String = ""
    var errandTitle:String = ""
    var errandTime:String = ""
    var errandExplain:String = ""

    private let backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_DetailBackButton"), for: .normal)
        $0.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    private let listName = UILabel().then {
        $0.text = "심부름 목록"
        $0.textColor = UIColor.EZY_AAA8FF
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private let line = UIView().then {
        $0.backgroundColor = .EZY_D0D0D0
    }
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .clear
    }
    
    private let scrollInnerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let acceptErrandTag = ListTagView().then {
        $0.listLabel.text = "부탁받은 심부름"
    }
    
    lazy var acceptTableView = ScheduleTimeTableView.init(frame: self.view.frame)
    
    var acceptDescriptionArray: [String] = ["부탁받은 심부름", "부탁받은 심부름"]
    
    let acceptTitleArray: [String] = ["EZY 회의", "EZY 회의"]
    
    let acceptPlanTimeArray: [String] = ["12:00 - 13:00", "12:00 - 13:00"]
    
    lazy var acceptPlanBackgroundColor: [UIColor] = [.EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE]
    
    lazy var acceptPlanDoOrFinishColor: [UIColor] = [.EZY_PLAN_DO_BACK, .EZY_PLAN_FINISH_BACK]
    
    lazy var acceptPlanShadow: [CGColor] = [.EZY_PLAN_DO_SHADOW, .EZY_PLAN_FINISH_SHADOW]
    
    private let sendErrandTag = ListTagView().then {
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
    
    lazy var sendPlanShadow: [CGColor] = [.EZY_PLAN_DO_SHADOW, .EZY_PLAN_FINISH_SHADOW]

    private let waitErrandTag = ListTagView().then {
        $0.listLabel.text = "수락 대기 중인 심부름"
    }
    
    lazy var waitTableView = ScheduleTimeTableView.init(frame: self.view.frame)
    
    var waitDescriptionArray: [String] = ["수락 대기 중인 심부름", "수락 대기 중인 심부름"]
    
    let waitTitleArray: [String] = ["EZY 회의", "EZY 회의"]
    
    let waitPlanTimeArray: [String] = ["12:00 - 13:00", "12:00 - 13:00"]
    
    lazy var waitPlanBackgroundColor: [UIColor] = [.EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE]
    
    lazy var waitPlanDoOrFinishColor: [UIColor] = [.EZY_PLAN_DO_BACK, .EZY_PLAN_DO_BACK]
    
    lazy var waitPlanShadow: [CGColor] = [.EZY_PLAN_DO_SHADOW, .EZY_PLAN_DO_SHADOW]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc
    func goBack(){
        navigationController?.popViewController(animated: true )
    }
    
    @objc
    private func goDetail(){
        let controller = ErrandDetailsViewController()
        controller.errandType = errandType
        controller.errandTime = errandTime
        controller.errandTitle = errandTitle
        controller.errandExplain = errandExplain
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    private func goRequest(){
        let controller = PlanRequestRespondingViewController()
        controller.errandTime = errandTime
        controller.errandTitle = errandTitle
        navigationController?.pushViewController(controller, animated: true)
    }
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
        view.addSubview(scrollView)
        scrollView.addSubview(scrollInnerView)
        scrollInnerView.addSubview(acceptTableView)
        scrollInnerView.addSubview(sendTableView)
        scrollInnerView.addSubview(waitTableView)
        scrollInnerView.addSubview(acceptErrandTag)
        scrollInnerView.addSubview(sendErrandTag)
        scrollInnerView.addSubview(waitErrandTag)
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
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(line).offset(self.view.frame.height/1624)
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
            make.height.equalTo(acceptTableView.tableView.contentSize.height + sendTableView.tableView.contentSize.height + waitTableView.tableView.contentSize.height + (self.view.frame.height / 13.5) * 3)
        }
        
        acceptErrandTag.snp.makeConstraints { make in
            make.top.equalTo(scrollInnerView).offset(self.view.frame.height/46.4)
            make.left.equalTo(line)
            make.width.equalTo(acceptErrandTag.listLabel).offset(self.view.frame.width/12.5)
            make.height.equalTo(self.view.frame.height/31.23)
        }
        
        acceptTableView.snp.makeConstraints { make in
            acceptTableView.backgroundColor = .clear
            make.top.equalTo(acceptErrandTag).offset(self.view.frame.height/47.76)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(sendErrandTag).offset(self.view.frame.height/18.92 * -1)
        }
        
        acceptTableView.tableView.snp.makeConstraints { make in
            make.top.equalTo(acceptTableView).offset(self.view.frame.height/36)
            make.width.height.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        sendErrandTag.snp.makeConstraints { make in
            make.top.equalTo(acceptTableView.tableView).offset(acceptTableView.tableView.contentSize.height + self.view.frame.height / 81.2)
            make.left.equalTo(listName)
            make.width.equalTo(sendErrandTag.listLabel).offset(self.view.frame.width/12.5)
            make.height.equalTo(self.view.frame.height/31.23)
        }
        
        sendTableView.snp.makeConstraints { make in
            sendTableView.backgroundColor = .clear
            make.top.equalTo(sendErrandTag).offset(self.view.frame.height/47.76)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(waitErrandTag).offset(self.view.frame.height/18.92 * -1)
        }
        
        sendTableView.tableView.snp.makeConstraints { make in
            make.top.equalTo(sendTableView).offset(self.view.frame.height/36)
            make.width.height.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        waitErrandTag.snp.makeConstraints { make in
            make.top.equalTo(sendTableView.tableView).offset(sendTableView.tableView.contentSize.height + self.view.frame.height / 81.2)
            make.left.equalTo(listName)
            make.width.equalTo(waitErrandTag.listLabel).offset(self.view.frame.width/12.5)
            make.height.equalTo(self.view.frame.height/31.23)
        }
        
        waitTableView.snp.makeConstraints { make in
            waitTableView.backgroundColor = .clear
            make.top.equalTo(waitErrandTag).offset(self.view.frame.height/47.76)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        waitTableView.tableView.snp.makeConstraints { make in
            make.top.equalTo(waitTableView).offset(self.view.frame.height/36)
            make.width.height.equalToSuperview()
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
        
        acceptTableView.tableView.contentSize = CGSize(width: self.view.frame.width, height: (self.view.frame.height/8) * CGFloat(acceptDescriptionArray.count))
        sendTableView.tableView.contentSize = CGSize(width: self.view.frame.width, height: (self.view.frame.height/8) * CGFloat(sendDescriptionArray.count))
        waitTableView.tableView.contentSize = CGSize(width: self.view.frame.width, height: (self.view.frame.height/8) * CGFloat(waitDescriptionArray.count))
        
        acceptTableView.tableView.isScrollEnabled = false
        sendTableView.tableView.isScrollEnabled = false
        waitTableView.tableView.isScrollEnabled = false
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
            cell.EZYLISTCellRightDecorationView.layer.shadowColor = acceptPlanShadow[indexPath.row]
            
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
            cell.EZYLISTCellRightDecorationView.layer.shadowColor = sendPlanShadow[indexPath.row]
            
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
            cell.EZYLISTCellRightDecorationView.layer.shadowColor = waitPlanShadow[indexPath.row]
            
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
//        var cell = tableView.cellForRow(at: indexPath)
        if tableView == acceptTableView.tableView {
            errandType = "받은 심부름"
            errandExplain = "어떤 심부름을 부탁받았나요?"
            errandTitle = acceptTitleArray[indexPath.row]
            errandTime = acceptPlanTimeArray[indexPath.row]
            goDetail()
        } else if tableView == sendTableView.tableView {
            errandType = "보낸 심부름"
            errandExplain = "어떤 심부름을 부탁할까요?"
            errandTitle = sendTitleArray[indexPath.row]
            errandTime = sendPlanTimeArray[indexPath.row]
            goDetail()
        } else {
            errandTitle = waitTitleArray[indexPath.row]
            errandTime = waitPlanTimeArray[indexPath.row]
            goRequest()
        }
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
