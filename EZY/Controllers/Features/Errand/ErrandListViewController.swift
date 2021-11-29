//
//  ErrandListViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/15.
//

import UIKit
import Alamofire

class ErrandListViewController : UIViewController{
    //MARK: - API class
    final class API : APIService<ErrandEntireModel>{
        static let shared = API()
    }
    
    let bounds = UIScreen.main.bounds
    
    private let sections : [String] = ["부탁받은 심부름","부탁한 심부름"," 수락 대기 중인 심부름"]
    private let dummy1 : [String] = ["EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의"]
    private let dummy2 : [String] = ["EZY 회의","EZY 회의","EZY 회의","EZY 회의"]
    private let dummy3 : [String] = ["EZY 회의","EZY 회의","EZY 회의","EZY 회의","EZY 회의"]

    //MARK: - Properties
    
    private lazy var tableViewHeader = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: bounds.height/7.315)).then{
        $0.backgroundColor = .clear
    }
    private let backBtn = UIButton().then{
        $0.setImage(UIImage(named: "EZY_RequestBackButton"), for: .normal)
        $0.addTarget( self, action: #selector(BackAction), for: .touchUpInside)
    }
    private let titleLabel = UILabel().then{
        $0.text = "심부름 목록"
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .EZY_AAA8FF
    }

    private let listTv = UITableView().then{
        $0.register(ErrandListTableViewCell.self, forCellReuseIdentifier: ErrandListTableViewCell.identifier)
        $0.register(ErrandListItemTableViewCell.self, forCellReuseIdentifier: ErrandListItemTableViewCell.identifier)
        $0.showsVerticalScrollIndicator = false
        $0.separatorColor = .clear
        $0.backgroundColor = .clear
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
    }
    //MARK: - Selectors
    @objc
    private func BackAction() {
        navigationController?.popViewController(animated: true)
    }
    //MARK: - Helpers
    private func configure(){
        AddView()
        Location()
        tableHeader()
        dataSourceAndDelegateSetting()
    }
    //MARK: - AddView
    private func AddView(){
        [listTv].forEach{ view.addSubview($0)}
    }
    private func Location(){
        listTv.snp.makeConstraints{
            $0.top.bottom.left.right.equalToSuperview()
        }
    }
    //MARK: - TableView Datasource And Delegate
    private func dataSourceAndDelegateSetting(){
        [listTv].forEach{$0.dataSource = self ; $0.delegate = self}
    }
    private func tableHeader(){
        listTv.tableHeaderView = tableViewHeader
        [backBtn,titleLabel].forEach{ listTv.addSubview($0)}
        backBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(bounds.height/47.76)
            $0.left.equalToSuperview().offset(bounds.width/12.32)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(backBtn.snp.bottom).offset(bounds.height/30.07)
            $0.left.equalTo(backBtn)
        }
    }
}
extension ErrandListViewController : UITableViewDelegate , UITableViewDataSource{
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
    private func httpErrandRequest(){
//        let header : HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJAamlob29uIiwiYXV0aCI6W3siYXV0aG9yaXR5IjoiUk9MRV9DTElFTlQifV0sImlhdCI6MTYzODE2MTgxNCwiZXhwIjoxNjM4MTY1NDE0fQ.M01X8KPVz-FkARpHBGe66OSXxb4WBhj9dl5kMwBDXx0"]
//        API.shared.request(url: "", method: .get, header: header,JSONDecodeUsingStatus: true) { (response) in
//            switch response{
//            case.success(let value ):
//            case .requestErr(_):
//                <#code#>
//            case .pathErr:
//                <#code#>
//            case .serverErr:
//                <#code#>
//            case .networkFail:
//                <#code#>
//            case .tokenErr:
//                <#code#>
//            case .authorityErr:
//                <#code#>
//            }
//        }
    }
}
