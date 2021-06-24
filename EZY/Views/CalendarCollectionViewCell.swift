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
    }
    
    lazy var dateLabel = UILabel().then {
        $0.text = "12"
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
        contentView.addSubview(dayOfTheWeekLabel)
        contentView.addSubview(dateLabel)
    }
}
