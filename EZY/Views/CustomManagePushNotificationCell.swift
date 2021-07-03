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
    
    //MARK: - Properties
    static let identifier = "ManagePushNotificationCell"
    
    static var switchState :Bool? = false
    
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
    let switchPushManage : SwitchBtn = {
        let button = SwitchBtn()
        button.addTarget(self, action: #selector(SwitchMoveButton), for: .touchUpInside)
        return button
    }()
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
        location()
    }

    //MARK: - Selctors
    @objc func SwitchMoveButton(){
        if CustomManagePushNotificationCell.switchState!{
            SwitchBtn().switchState = true
        }
        else{
            SwitchBtn().switchState = false
        }
        SwitchBtn().switchState != SwitchBtn().switchState

    }
    //MARK: - HELPERs
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
            make.height.equalTo(frame.height/2.71)
            make.width.equalTo(frame.height/1.35)
        }
        divider.snp.makeConstraints { (make) in
            make.top.equalTo(snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(contentView.frame.height/114)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
