//
//  ErrandListItemTableViewCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/15.
//

import UIKit

class ErrandListItemTableViewCell : UITableViewCell {
    static let identifier = "ErrandListItemTableViewCell"
    
    //MARK: - Properties
    let bgview = UIView().then{
        $0.backgroundColor = .white
        $0.layer.applySketchShadow(color: .lightGray, alpha: 1, x: 0, y: 4, blur: 20, spread: 0)
    }
    let tagView = UIView().then{
        $0.backgroundColor = .EZY_BDAAFF
    }
    //MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        AddView()
        Location()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper
    private func AddView(){
        contentView.addSubview(bgview)
        [tagView].forEach{ bgview.addSubview($0)}
    }
    private func Location(){
        bgview.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(30)
        }
        tagView.snp.makeConstraints{
            $0.top.bottom.left.equalToSuperview()
            $0.width.equalTo(10)
        }
    }
}
