//
//  reErrandListViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/15.
//

import UIKit
class reErrandListViewController : UIViewController{
    let bounds = UIScreen.main.bounds
    
    private let sections : [String] = ["부탁받은 심부름","부탁한 심부름"," 수락 대기 중인 심부름"]
    
    //MARK: - Properties
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
        $0.backgroundColor = .red
        $0.allowsSelection = false
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
        dataSourceAndDelegateSetting()
    }
    //MARK: - AddView
    private func AddView(){
        [backBtn,titleLabel,listTv].forEach{ view.addSubview($0)}
    }
    private func Location(){
        backBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(bounds.height/13.31)
            $0.left.equalToSuperview().offset(bounds.width/12.32)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(backBtn.snp.bottom).offset(bounds.height/30.07)
            $0.left.equalTo(backBtn)
        }

        listTv.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(bounds.height/35.3)
            $0.bottom.left.right.equalToSuperview()
        }
    }
    //MARK: - TableView Datasource And Delegate
    private func dataSourceAndDelegateSetting(){
        listTv.delegate = self
        listTv.dataSource = self
    }
}
extension reErrandListViewController : UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return bounds.height/10.545
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ErrandListItemTableViewCell.identifier, for: indexPath) as? ErrandListItemTableViewCell else {return UITableViewCell()}
            return cell
        }else if indexPath.item == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ErrandListTableViewCell.identifier, for: indexPath) as? ErrandListTableViewCell else {return UITableViewCell()}
        }
        return UITableViewCell()
    }
    

}
