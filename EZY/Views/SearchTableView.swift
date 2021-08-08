//
//  SearchTableView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/08.
//

import UIKit

class SearchTableView : UIView {
    let view = UIView()
    let tv = UITableView()

    
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
        addSubview(view)
        view.addSubview(tv)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view.layer.cornerRadius = frame.height/15.8
        tv.layer.cornerRadius = frame.height/15.8
        view.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
            make.height.equalTo(frame.height)
        }
        tv.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalTo(view.snp.right)
            make.bottom.equalToSuperview()
        }


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SearchTableView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MorePeopleToDo.searchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "numberofRooms")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "numberofRooms")
            cell?.textLabel?.text = "\(MorePeopleToDo.searchData[indexPath.row])"
            cell?.textLabel?.dynamicFont(fontSize: 10, currentFontName:  "AppleSDGothicNeo-Bold")

        }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return frame.height/4.270
    }
    
}
