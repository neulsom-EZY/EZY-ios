//
//  MyToDoListTableViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/11/30.
//

import UIKit

class MyToDoListTableViewCell: UITableViewCell {

    //MARK: - Properties
    static let identifier = "ErrandListTableViewCell"
    
    private let view = UIView()
    
    let label = UILabel().then{
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = .EZY_796DFF
    }
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        view.backgroundColor = .white
        
        addView()
        location()
        layerSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addView
    private func addView(){
        contentView.frame .inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        contentView.addSubview(view)
        view.addSubview(label)
    }
    
    // MARK: - location
    private func location(){
        view.snp.makeConstraints{
            $0.top.bottom.equalTo(label).inset(-6)
            $0.left.equalToSuperview().offset(bounds.width/11)
            $0.centerY.equalToSuperview()
        }
        label.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).inset(15)
            $0.right.equalTo(view.snp.right).inset(15)
        }
    }
    
    // MARK: - layerSetting
    private func layerSetting(){
        [view.layer].forEach{
            $0.borderColor = UIColor.EZY_796DFF.cgColor
            $0.cornerRadius = 5
            $0.borderWidth = 0.5
        }
    }
}
