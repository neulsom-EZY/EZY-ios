//
//  CustomManagePushNotificationCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/27.
//

import UIKit
import SnapKit
import Then

class CustomManagePushNotificationCell: UITableViewCell {
    
    static let identifier = "ManagePushNotificationCell"
    
    var switchClick = true

     let title = UILabel().then{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dynamicFont(fontSize: 14, weight: .regular)
        $0.textColor = .EZY_656565
    }
     let explanation = UILabel().then{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dynamicFont(fontSize: 8, weight: .regular)
        $0.textColor = .EZY_CDCDCD
    }
    private let divider = UIView().then{
        $0.backgroundColor = .EZY_DEDEDE
    }
    private let switchPushManage = UISwitch().then{
        $0.onTintColor = .EZY_AFADFF
        $0.isUserInteractionEnabled = true
        
        $0.isOn = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
        location()
    }
    func addContentView(){
        contentView.addSubview(title)
        contentView.addSubview(explanation)
        contentView.addSubview(divider)
        contentView.addSubview(switchPushManage)
    }
    private func location(){
        title.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top).offset(frame.height/4.8)
            make.left.equalTo(snp.left)
        }
        explanation.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(frame.height/5.7)
            make.left.equalTo(title.snp.left)
        }
        switchPushManage.snp.makeConstraints { (make) in
            make.centerY.equalTo(snp.centerY)
            make.right.equalTo(snp.right)
        }
        divider.snp.makeConstraints { (make) in
            make.bottom.equalTo(snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(frame.height/114)
        }
        switchPushManage.set(width: 34 , height: 17)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
