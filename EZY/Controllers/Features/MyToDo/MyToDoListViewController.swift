//
//  MyToDoListViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/07/24.
//

import UIKit
import SnapKit
import Then

class MyToDoListViewController : UIViewController{
    //MARK: - API class
    final class API : APIService<ErrandEntireModel>{
        static let shared = API()
    }

    //MARK: - Properties
    let bounds = UIScreen.main.bounds
    
    private lazy var tableViewHeader = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: bounds.height/7.315)).then{
        $0.backgroundColor = .clear
    }
    
    private let topView = TopView().then{
        $0.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        $0.topViewDataSetting(backButtonImage: UIImage(named: "EZY_IdChangeBackButtonImage")!, titleLabelText: "나의 할 일 목록", textColor: UIColor(red: 120/255, green: 81/255, blue: 255/255, alpha: 1))
    }

    private let listTableView = UITableView().then{
        $0.register(ErrandListTableViewCell.self, forCellReuseIdentifier: ErrandListTableViewCell.identifier)
        $0.register(ErrandListItemTableViewCell.self, forCellReuseIdentifier: ErrandListItemTableViewCell.identifier)
        $0.showsVerticalScrollIndicator = false
        $0.separatorColor = .clear
        $0.backgroundColor = .clear
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
        tableHeader()
        dataSourceAndDelegate()
    }
    
    // MARK: - AddView
    private func addView(){
        [topView, listTableView].forEach{ view.addSubview($0)}
    }
    
    // MARK: - location
    private func location(){
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
        listTableView.snp.makeConstraints{
            $0.top.bottom.left.right.equalToSuperview()
        }
    }
    
    // MARK: - dataSourceAndDelegate
    private func dataSourceAndDelegate(){
        [listTableView].forEach{$0.dataSource = self ; $0.delegate = self}
    }
    
    private func tableHeader(){
        listTableView.tableHeaderView = tableViewHeader
    }
}

// MARK: - TableView Extension
extension MyToDoListViewController : UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return dummy1.count
        }else if section == 1{
            return dummy2.count
        }else{
            return dummy3.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0{
            return bounds.height/15.7669
        }
        return bounds.height/8.6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ErrandListTableViewCell.identifier, for: indexPath) as? ErrandListTableViewCell else {return UITableViewCell()}
            cell.label.text = sections[indexPath.section]
            cell.selectionStyle = .none
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ErrandListItemTableViewCell.identifier, for: indexPath) as? ErrandListItemTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.tbTypeLabel.text = sections[indexPath.section]
        cell.ErrandTitle.text = dummy1[indexPath.row]
        cell.Date("11:00 - 13:00", nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item != 0{
            tableViewSectionManager(indexPath: indexPath)
        }
    }
    
    private func tableViewSectionManager(indexPath : IndexPath){
        if indexPath.section ==  0{
            let controller = ErrandDetailsViewController()
            navigationController?.pushViewController(controller, animated: true)
        }else if indexPath.section == 1{
            let controller = ErrandDetailsViewController()
            navigationController?.pushViewController(controller, animated: true)
        }else{
            let controller = PlanRequestRespondingViewController()
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
