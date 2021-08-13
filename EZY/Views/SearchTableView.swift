//
//  SearchTableView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/08.
//

import UIKit

class SearchTableView : UIView {
    let view = UIView()
    let tv = UITableView().then{
        $0.register(SearchTableCell.self, forCellReuseIdentifier: SearchTableCell.identifier)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        view.backgroundColor = .white
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
            make.top.left.right.bottom.equalToSuperview()
            make.height.equalTo(frame.height)
        }
        tv.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(view.frame.height)
        }



    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
