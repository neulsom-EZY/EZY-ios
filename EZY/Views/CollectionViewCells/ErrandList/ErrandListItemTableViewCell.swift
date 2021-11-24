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
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    let tagView = UIView().then{
        $0.backgroundColor = .EZY_BDAAFF
    }
    //MARK: - Label 가운데로 잡아주기 위한 view
    let view = UIView()
    let tbTypeLabel = UILabel().then{
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .EZY_BDAAFF
    }
    let ErrandTitle = UILabel().then{
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .EZY_BDAAFF
    }
    let ErrandDate = UILabel().then{
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-Light")
        $0.textColor = .lightGray
    }
    let ErrandTime = UILabel().then{
        $0.dynamicFont(fontSize: 6, currentFontName: "AppleSDGothicNeo-Light")
        $0.textColor = .lightGray
    }
    //MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        AddView()
        Location()
        contentView.layer.applySketchShadow(color: .rgb(red: 219, green: 219, blue: 219), alpha: 1, x: 0, y: 4, blur: 20, spread: 0)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LayoutSubView
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8.5, left: 0, bottom: 8.5, right: 0))
    }
    //MARK: - Helper
    private func AddView(){
        contentView.addSubview(bgview)
        [tagView,tbTypeLabel,view,ErrandTitle,ErrandDate,ErrandTime].forEach{ bgview.addSubview($0)}
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
        view.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(bounds.width/14.423)
        }
        tbTypeLabel.snp.makeConstraints {
            $0.top.equalTo(view)
            $0.left.equalTo(view)
        }
        ErrandTitle.snp.makeConstraints{
            $0.top.equalTo(tbTypeLabel.snp.bottom).offset(3)
            $0.left.equalTo(tbTypeLabel)
        }
        ErrandDate.snp.makeConstraints{
            $0.top.equalTo(ErrandTitle.snp.bottom)
            $0.left.equalTo(tbTypeLabel )
            $0.bottom.equalTo(view)
        }
        ErrandTime.snp.makeConstraints{
            $0.bottom.equalTo(ErrandDate)
            $0.left.equalTo(ErrandDate.snp.right)
        }
    }
    func Date(_ date : String?, _ Time : String?){
        if !(Time?.isEmpty ?? false){
            ErrandDate.text = date
        }
        ErrandDate.text = date
        ErrandTime.text = Time
    }
}
