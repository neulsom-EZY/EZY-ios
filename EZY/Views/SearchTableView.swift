//
//  SearchTableView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/07.
//

import UIKit

class SearchTableView: UIView {
    
    
    private let view = UIView()
    let searchTableView : UITableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        searchTableView.delegate = self
        searchTableView.dataSource = self
    }
    
    func addView(){
        addSubview(view)
        view.addSubview(searchTableView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view.snp.makeConstraints { (make) in
            make.top.right.left.bottom.equalToSuperview()
        }
        searchTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(view.snp.left).offset(frame.height/11.286)
            make.right.equalTo(view.snp.right).inset(frame.height/11.286)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        
}
extension SearchTableView : UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MorePeopleToDo.searchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = MorePeopleToDo.searchData[indexPath.row]
        return cell
    }
    
}
