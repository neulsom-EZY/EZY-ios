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
        
    let view  = UIView().then{
        $0.backgroundColor = .clear
    }
    
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
    let switchPushManage = UISwitch().then{
        $0.onTintColor = .EZY_AFADFF
        $0.isOn = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addContentView()
        location()
    }
    

    
    func addContentView(){
        contentView.addSubview(view)
        view.addSubview(title)
        view.addSubview(explanation)
        contentView.addSubview(divider)
        contentView.addSubview(switchPushManage)
    }
    private func location(){

        view.snp.makeConstraints { (make) in
            make.height.equalTo(frame.height/1.706)
            make.centerY.equalTo(snp.centerY)
            
        }
        title.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
        }
        explanation.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(frame.height/11.6)
            make.left.equalTo(view.snp.left).offset(contentView.frame.height/58)
        }
        
        switchPushManage.snp.makeConstraints { (make) in
            make.centerY.equalTo(snp.centerY)
            make.right.equalTo(contentView.snp.right)
        }
        divider.snp.makeConstraints { (make) in
            make.top.equalTo(snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(contentView.frame.height/114)
        }
        switchPushManage.set(width: 34 , height: 17)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
