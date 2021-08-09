//
//  SearchTableView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/08.
//

import UIKit

class SearchTableView : UIView {
    let tv = UITableView().then{
        $0.register(SearchTableCell.self, forCellReuseIdentifier: SearchTableCell.identifier)
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tv.delegate = self
        tv.dataSource = self
        addView()
        backgroundColor = .white
        tv.showsVerticalScrollIndicator = false
        tv.separatorStyle = .none
    }
    func addView(){
        addSubview(tv)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tv.layer.cornerRadius = frame.height/15.8

        tv.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(frame.height)
        }


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SearchTableView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !MorePeopleToDo().filterData.isEmpty{
            return MorePeopleToDo().filterData.count
        }
        return MorePeopleToDo().filtered ? 0 : MorePeopleToDo().data.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableCell.identifier) as! SearchTableCell
        if !MorePeopleToDo().filterData.isEmpty {
            cell.personName.text = MorePeopleToDo().filterData[indexPath.row]
        }else{
            cell.personName.text = MorePeopleToDo().data[indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return frame.height/3.95
    }
    
}
