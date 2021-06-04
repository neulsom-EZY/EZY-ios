//
//  ScheduleTimeTableViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/03.
//

import UIKit
import SnapKit

class ScheduleTimeTableViewCell: UITableViewCell {
    static let ScheduleTimeTableViewIdentifier = "\(ScheduleTimeTableViewCell.self)"

    var groupNameLabel = UILabel().then {
        $0.dynamicFont(fontSize: 8, currentFontName: "Poppins-SemiBold")
    }
    var titleLabel = UILabel().then {
        $0.dynamicFont(fontSize: 14, currentFontName: "Poppins-SemiBold")
    }
    var planTimeLabel = UILabel().then {
        $0.dynamicFont(fontSize: 8, currentFontName: "Poppins-Light")
    }
    var EZYLISTCellLeftDecorationView = UIView().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    var EZYLISTCellRightDecorationView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 6
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    var EZYLISTCellBackground = UIView().then {
        $0.backgroundColor = .white
    }
    var EZYLISTCellColor: [UIColor]!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureUI(){
        
        contentView.addSubview(EZYLISTCellRightDecorationView)
        EZYLISTCellRightDecorationView.addSubview(EZYLISTCellLeftDecorationView)
        EZYLISTCellLeftDecorationView.addSubview(EZYLISTCellBackground)
        EZYLISTCellBackground.addSubview(groupNameLabel)
        EZYLISTCellBackground.addSubview(titleLabel)
        EZYLISTCellBackground.addSubview(planTimeLabel)
        
        
        
        EZYLISTCellBackground.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalTo(EZYLISTCellRightDecorationView)
            make.width.equalTo(EZYLISTCellRightDecorationView).dividedBy(1.07)
            make.bottom.equalToSuperview()
        }
        
        EZYLISTCellLeftDecorationView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        
        EZYLISTCellRightDecorationView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalTo(77)
            make.centerX.equalToSuperview()
        }
        
        groupNameLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.bottom.equalTo(titleLabel.snp.top).offset(-3)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
        }
        
        planTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
            make.left.equalTo(titleLabel)
        }
    }
}
