//
//  MultilineLabelCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/08.
//

import UIKit

class GroupAddCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "\(GroupAddCollectionViewCell.self)"
    
    var cellBackgroundView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.9
        view.layer.shadowRadius = 7
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
        return view
    }()
    
    var addbutton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_GroupAddButton"), for: .normal)
        $0.isEnabled = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(addbutton)
        
        addbutton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(4)
        }
        
        cellBackgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(26)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.1)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Storyboards are quicker, easier, more seductive. Not stronger then Code.")
    }
}
