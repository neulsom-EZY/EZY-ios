//
//  startTimeTableViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/07/07.
//

import UIKit

class StartTimeTableViewCell: UITableViewCell {
    
    static let reuseId = "\(StartTimeTableViewCell.self)"

    lazy var hourLabel = UILabel().then{
        $0.text = "12"
        $0.textColor = UIColor(red: 130/255, green: 197/255, blue: 165/255, alpha: 1)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var minuteLabel = UILabel().then{
        $0.text = "24"
        $0.textColor = UIColor(red: 130/255, green: 197/255, blue: 165/255, alpha: 1)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-SemiBold")

    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layoutSetting()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        layoutSetting()
    }
    
    func layoutSetting(){
        contentView.addSubview(hourLabel)
        contentView.addSubview(minuteLabel)

        contentView.backgroundColor = .clear
        
        hourLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.contentView.frame.width/15)
            make.top.equalToSuperview()
        }
        
        minuteLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.contentView.frame.width/40)
            make.top.equalToSuperview()
        }
    }

}
