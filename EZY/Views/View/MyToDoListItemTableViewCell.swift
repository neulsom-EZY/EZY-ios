//
//  MyToDoListItemTableViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/11/30.
//

import UIKit

class MyToDoListItemTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let identifier = "ErrandListItemTableViewCell"

    private let bgview = UIView().then{
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    private let tagView = UIView().then{
        $0.backgroundColor = .EZY_BDAAFF
    }
    
    private let view = UIView() // Label 가운데로 잡아주기 위한 view
    
    let tagLabel = UILabel().then{
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .EZY_BDAAFF
    }
    
    let titleLabel = UILabel().then{
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .EZY_BDAAFF
    }
    
    let dateLabel = UILabel().then{
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-Light")
        $0.textColor = .lightGray
    }
    
    let timeLabel = UILabel().then{
        $0.dynamicFont(fontSize: 6, currentFontName: "AppleSDGothicNeo-Light")
        $0.textColor = .lightGray
    }
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addView()
        location()
        
        contentView.layer.applySketchShadow(color: .rgb(red: 219, green: 219, blue: 219), alpha: 1, x: 0, y: 2, blur: 15, spread: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8.5, left: 0, bottom: 8.5, right: 0))
    }
    
    // MARK: - addView
    private func addView(){
        contentView.addSubview(bgview)
        [tagView,tagLabel,view,titleLabel,dateLabel,timeLabel].forEach{ bgview.addSubview($0)}
    }
    
    // MARK: - location
    private func location(){
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
        tagLabel.snp.makeConstraints {
            $0.top.equalTo(view)
            $0.left.equalTo(view)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(tagLabel.snp.bottom).offset(3)
            $0.left.equalTo(tagLabel)
        }
        dateLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.left.equalTo(tagLabel )
            $0.bottom.equalTo(view)
        }
        timeLabel.snp.makeConstraints{
            $0.bottom.equalTo(tagLabel)
            $0.left.equalTo(dateLabel.snp.right)
        }
    }
    
    // MARK: - Date
    func Date(_ date : String?, _ Time : String?){
        if !(Time?.isEmpty ?? false){
            dateLabel.text = date
        }
        dateLabel.text = date
        timeLabel.text = Time
    }
}
