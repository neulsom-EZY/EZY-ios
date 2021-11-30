//
//  MyToDoListViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/24.
//

import UIKit
import SnapKit
import Then

class MyToDoListViewController : UIViewController{
    // MARK: - API class
    final class API : APIService<ErrandEntireModel>{
        static let shared = API()
    }

    // MARK: - Properties
    let bounds = UIScreen.main.bounds
    
    private let tableViewHeader = TableViewHeaderView()
    
    private let topView = TopView().then{
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 10
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 10)
        $0.layer.shadowColor = UIColor.white.cgColor
        $0.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        $0.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "나의 할 일 목록", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
    }

    private lazy var listTableView = UITableView().then{
        $0.register(MyToDoListTableViewCell.self, forCellReuseIdentifier: MyToDoListTableViewCell.identifier)
        $0.register(MyToDoListItemTableViewCell.self, forCellReuseIdentifier: MyToDoListItemTableViewCell.identifier)
        $0.showsVerticalScrollIndicator = false
        $0.separatorColor = .clear
        $0.tableHeaderView = tableViewHeader
    }
    
    private let sections : [String] = ["STUDY","EXERCISE","DATE"]
    private let dummy1 : [String] = ["EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의"]
    private let dummy2 : [String] = ["EZY 회의","EZY 회의","EZY 회의","EZY 회의"]
    private let dummy3 : [String] = ["EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의"]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Selectors
    @objc private func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white

        addView()
        location()
        dataSourceAndDelegate()
    }
    
    // MARK: - AddView
    private func addView(){
        [listTableView, topView].forEach{ view.addSubview($0)}
    }
    
    // MARK: - location
    private func location(){
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(7.6)
        }
        listTableView.snp.makeConstraints{ make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
        }
    }
    
    // MARK: - dataSourceAndDelegate
    private func dataSourceAndDelegate(){
        [listTableView].forEach{$0.dataSource = self ; $0.delegate = self}
    }
}

// MARK: - TableView Extension
extension MyToDoListViewController : UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return sections[0].count
        }else if section == 1{
            return sections[1].count
        }else{
            return sections[2].count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0{
            return self.view.frame.height/14
        }else{
            return self.view.frame.height/9
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyToDoListTableViewCell.identifier, for: indexPath) as? MyToDoListTableViewCell else {return UITableViewCell()}
            cell.label.text = sections[indexPath.section]
            cell.selectionStyle = .none
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyToDoListItemTableViewCell.identifier, for: indexPath) as? MyToDoListItemTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.tagLabel.text = sections[indexPath.section]
        cell.titleLabel.text = dummy1[indexPath.row]
        cell.Date("11:00 - 13:00", nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = MyToDoDetailViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
