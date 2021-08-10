//
//  ScheduleTimeTableView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/03.
//

import UIKit

class ScheduleTimeTableView: UIView {

    let tableView = UITableView().then {
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .white
        addSubview(tableView)
    }

}
