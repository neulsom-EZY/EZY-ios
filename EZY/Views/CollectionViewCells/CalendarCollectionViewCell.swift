//
//  CalendarCollectionViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/23.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    static let reuseId = "\(CalendarCollectionViewCell.self)"
    
    
    
    lazy var dayOfTheWeekLabel = UILabel().then{
        $0.text = "W"
        $0.textColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1)
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var dateLabel = UILabel().then {
        $0.text = "12"
        $0.textColor = UIColor(red: 125/255, green: 151/255, blue: 252/255, alpha: 1)
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    
    lazy var calendarSelectedView = UIView().then {
        $0.backgroundColor = UIColor(red: 233/255, green: 237/255, blue: 255/255, alpha: 1)
    }


    
    //MARK: LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
        layoutSetting()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layoutSetting()
    }
    
    func layoutSetting(){
        
        contentView.addSubview(calendarSelectedView)
        contentView.addSubview(dayOfTheWeekLabel)
        contentView.addSubview(dateLabel)
        
        dayOfTheWeekLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(dayOfTheWeekLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        calendarSelectedView.snp.makeConstraints { make in
            make.bottom.equalTo(dateLabel).offset(-contentView.frame.height/9)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8.2)
        }
    }
}
