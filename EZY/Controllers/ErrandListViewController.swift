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
    
    private lazy var scheduleTableView = ScheduleTimeTableView.init(frame: self.view.frame)
    
    var descriptionArray: [String] = ["부탁받은 심부름", "부탁받은 심부름", "부탁받은 심부름", "부탁받은 심부름", "부탁받은 심부름", "부탁받은 심부름", "부탁받은 심부름", "부탁받은 심부름"]
    
    let titleArray: [String] = ["EZY 회의", "EZY 회의", "EZY 회의", "EZY 회의", "EZY 회의", "EZY 회의", "EZY 회의", "EZY 회의"]
    
    let planTimeArray: [String] = ["7월 24일 AM 10:24까지", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00"]
    
    lazy var planBackgroundColor: [UIColor] = [.EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE, .EZY_PLAN_FINISH_PURPLE]
    
    lazy var planDoOrFinishColor: [UIColor] = [.EZY_PLAN_FINISH_BACK, .EZY_PLAN_FINISH_BACK, .EZY_PLAN_FINISH_BACK, .EZY_PLAN_FINISH_BACK, .EZY_PLAN_FINISH_BACK, .EZY_PLAN_FINISH_BACK, .EZY_PLAN_FINISH_BACK, .EZY_PLAN_FINISH_BACK]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ScheduleTimeTableViewSetting()
        configureUI()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
    }
    
    func addView(){
        view.addSubview(backButton)
        view.addSubview(listName)
        view.addSubview(line)
        view.addSubview(scheduleTableView)
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
        
        scheduleTableView.snp.makeConstraints { make in
            scheduleTableView.backgroundColor = .clear
            make.top.equalTo(line)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        scheduleTableView.tableView.snp.makeConstraints { make in
            make.top.equalTo(scheduleTableView).offset(self.view.frame.height/36)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func ScheduleTimeTableViewSetting(){
        scheduleTableView.tableView.dataSource = self
        scheduleTableView.tableView.delegate = self
        
        scheduleTableView.tableView.register(ScheduleTimeTableViewCell.self, forCellReuseIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier)
    }

}

extension ErrandListViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier, for: indexPath) as! ScheduleTimeTableViewCell
        
        cell.groupNameLabel.text = descriptionArray[indexPath.row]
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.planTimeLabel.text = planTimeArray[indexPath.row]
        cell.EZYLISTCellLeftDecorationView.backgroundColor = planBackgroundColor[indexPath.row]
        cell.EZYLISTCellBackground.backgroundColor = planDoOrFinishColor[indexPath.row]
        cell.EZYLISTCellRightDecorationView.backgroundColor = planDoOrFinishColor[indexPath.row]
        cell.titleLabel.textColor = planBackgroundColor[indexPath.row]
        cell.groupNameLabel.textColor = planBackgroundColor[indexPath.row]
        
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

extension ErrandListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView - didSelectRowAt")
        var cell = tableView.cellForRow(at: indexPath)
        print(indexPath.row)
        print(titleArray[indexPath.row])
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
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ErrandListViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

