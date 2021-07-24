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
    lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_ListBackBtn"), for: .normal)
    }
    
    lazy var listName = UILabel().then {
        $0.text = "나의 할 일 목록"
        $0.textColor = UIColor.EZY_AAA8FF
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var line = UIView().then {
        $0.backgroundColor = .EZY_D0D0D0
    }
    
    lazy var firstListTag = ListTagView().then {
        $0.listLabel.text = "STUDY"
    }
    
    private lazy var firstList = ScheduleTimeTableView.init(frame: self.view.frame)
    
    var firstDescriptionArray: [String] = ["NEULSOM", "NEULSOM"]
    
    let firstTitleArray: [String] = ["EZY 회의", "EZY 회의"]
    
    let firstPlanTimeArray: [String] = ["12:00 - 13:00", "12:00 - 13:00"]
    
    lazy var firstPlanBackgroundColor: [UIColor] = [.EZY_PLAN_MIDDLEPURPLE, .EZY_PLAN_FINISH_PURPLE]
    
    lazy var firstPlanDoOrFinishColor: [UIColor] = [.EZY_PLAN_DO_BACK, .EZY_PLAN_FINISH_BACK]
    
    lazy var secondListTag = ListTagView().then {
        $0.listLabel.text = "APP Programming"
    }
    
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
        view.addSubview(firstListTag)
        view.addSubview(firstList)
        view.addSubview(secondListTag)
    }
    
    func cornerRadius(){
        firstListTag.layer.cornerRadius = self.view.frame.width/75
        secondListTag.layer.cornerRadius = self.view.frame.width/75
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
        firstListTag.snp.makeConstraints { make in
            make.top.equalTo(line).offset(self.view.frame.height/62.46)
            make.left.equalTo(line)
            make.width.equalTo(firstListTag.listLabel).offset(self.view.frame.width/12.5)
            make.height.equalTo(self.view.frame.height/31.23)
        }
        
        firstList.snp.makeConstraints { make in
            firstList.backgroundColor = .clear
            make.top.equalTo(firstListTag).offset(self.view.frame.height/67.67)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(self.view.frame.height/2.05 * -1)
        }
        
        firstList.tableView.snp.makeConstraints { make in
            make.top.equalTo(firstList).offset(self.view.frame.height/36)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func listTagViewSetting() {
        firstListTag.addSubview(firstListTag.listLabel)
        firstListTag.listTagViewLayoutSetting()
        
        secondListTag.addSubview(secondListTag.listLabel)
        secondListTag.listTagViewLayoutSetting()
    }
    
    func ScheduleTimeTableViewSetting(){
        firstList.tableView.dataSource = self
        firstList.tableView.delegate = self
        
        firstList.tableView.register(ScheduleTimeTableViewCell.self, forCellReuseIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier)
    }

}

extension MyToDoListViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstDescriptionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier, for: indexPath) as! ScheduleTimeTableViewCell
        
        cell.groupNameLabel.text = firstDescriptionArray[indexPath.row]
        cell.titleLabel.text = firstTitleArray[indexPath.row]
        cell.planTimeLabel.text = firstPlanTimeArray[indexPath.row]
        cell.EZYLISTCellLeftDecorationView.backgroundColor = firstPlanBackgroundColor[indexPath.row]
        cell.EZYLISTCellBackground.backgroundColor = firstPlanDoOrFinishColor[indexPath.row]
        cell.EZYLISTCellRightDecorationView.backgroundColor = firstPlanDoOrFinishColor[indexPath.row]
        cell.titleLabel.textColor = firstPlanBackgroundColor[indexPath.row]
        cell.groupNameLabel.textColor = firstPlanBackgroundColor[indexPath.row]
        
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

extension MyToDoListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView - didSelectRowAt")
        var cell = tableView.cellForRow(at: indexPath)
        print(indexPath.row)
        print(firstTitleArray[indexPath.row])
    }

    
}


//MARK: - Preview

#if DEBUG
import SwiftUI
struct MyToDoListViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        MyToDoListViewController()
    }
}
@available(iOS 13.0, *)
struct MyToDoListViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            MyToDoListViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

