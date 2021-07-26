//
//  repeatCollectionViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/07/07.
//

import UIKit

class PersonalPlanAddRepeatDayCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "\(PersonalPlanAddRepeatDayCollectionViewCell.self)"
    
    var model: RepeatCollectionViewModel?

        
    lazy var cellBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
    }
    
    lazy var label = UILabel().then {
        $0.text = "W"
        $0.textColor = UIColor.white
        $0.dynamicFont(fontSize: 15, currentFontName: "AppleSDGothicNeo-SemiBold")
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
    
    func setModel(_ model: RepeatCollectionViewModel){
        self.model = model
        
            cellBackgroundView.backgroundColor = model.backgroundColr
            
            if model.isSelected == true{
                cellBackgroundView.layer.borderWidth = 1
                cellBackgroundView.layer.borderColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1).cgColor
                
                cellBackgroundView.backgroundColor = .white
                
                label.textColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
            }else{
                self.cellBackgroundView.backgroundColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
                label.textColor = UIColor.white
            }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // 셀이 재사용되기 전에 셀의 속성을 초기화시켜준다.
        
        self.cellBackgroundView.backgroundColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
        label.textColor = UIColor.white
    }
    
    func layoutSetting(){
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(label)
        
        cellBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
            
            cellBackgroundView.layer.cornerRadius = contentView.frame.height/2
        }
        
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
