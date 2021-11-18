//
//  ErrandListTableViewCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/15.
//

import UIKit
class ErrandListTableViewCell : UITableViewCell{
    //MARK: - Properties
    static let identifier = "ErrandListTableViewCell"
    private let view = UIView()
    let label = UILabel().then{
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
        $0.text = "씨발 ㅈ같은 EZYtlqkflqklqkdlqwkldkqlwkd"
        $0.textColor = .EZY_796DFF
    }
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .lightGray
        view.backgroundColor = .white
        AddView()
        location()
        layerSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper
    private func AddView(){
        contentView.frame .inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        contentView.addSubview(view)
        view.addSubview(label)
    }
    private func location(){
        view.snp.makeConstraints{
            $0.top.bottom.equalTo(label).inset(-5)
            $0.left.equalToSuperview().offset(bounds.width/13.39)
            $0.centerY.equalToSuperview()
        }
        label.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).inset(15)
            $0.right.equalTo(view.snp.right).inset(15)
        }
    }
    private func layerSetting(){
        [view.layer].forEach{
            $0.borderColor = UIColor.EZY_796DFF.cgColor
            $0.cornerRadius = 5
            $0.borderWidth = 0.5
            $0.applySketchShadow(color: .lightGray, alpha: 1, x: 0, y: 0, blur: 10, spread: 0)
        }
    }
}
