//
//  repeatCollectionViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/07/07.
//

import UIKit

class PersonalPlanAddRepeatDayCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "\(PersonalPlanAddRepeatDayCollectionViewCell.self)"
    
    var model: TagCollectionViewModel?

        
    lazy var cellBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
    }
    
//    lazy var xiconImageView = UIImageView().then{
//        $0.image = UIImage(named: "")
//    }
    
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
    
    func setModel(_ model: TagCollectionViewModel, indexPath: IndexPath){
        self.model = model
        
            cellBackgroundView.backgroundColor = model.backgroundColor
            
        if label.text != "X"{
            
            if model.isSelected == true{
                cellBackgroundView.layer.borderWidth = 1
                cellBackgroundView.layer.borderColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1).cgColor
                
                cellBackgroundView.backgroundColor = .white
                
                label.textColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
                
                // 여기서 취소할 때 다른 것들도 다 취소되어있으면 X가 눌러지게
            }else{
                self.cellBackgroundView.backgroundColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
                label.textColor = UIColor.white
                
                // 여기서 선택하면 X 사라지게
                if indexPath == [0,0]{
                    cellBackgroundView.layer.borderWidth = 1
                    cellBackgroundView.layer.borderColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1).cgColor
                    
                    cellBackgroundView.backgroundColor = .white
                    
                    label.textColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
                }
            }
            
        }else{
            if model.isSelected == true{
                cellBackgroundView.layer.borderWidth = 1
                cellBackgroundView.layer.borderColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1).cgColor
                
                cellBackgroundView.backgroundColor = .white
                
                label.textColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
                
                // 여기서 취소할 때 안되게 하기
            }else{
                self.cellBackgroundView.backgroundColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
                label.textColor = UIColor.white
            }
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
