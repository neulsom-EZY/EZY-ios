//
//  GroupAddCollectionViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/07.
//

import UIKit

class GroupAddCollectionViewCell: UICollectionViewCell {
    static var GroupAddCollectionViewCellIdentifier = "\(GroupAddCollectionViewCell.self)"

    lazy var cellBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.9
        $0.layer.shadowRadius = 7
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
    }
    
    lazy var groupAddButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_GroupAddButton"), for: .normal)
    }
    
    //MARK: LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
        configureUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureUI()
    }
    
    func configureUI(){
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(groupAddButton)
        
        cellBackgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.1)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(contentView.frame.height/7)
        }
        
        groupAddButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalToSuperview().dividedBy(4)
        }
    }
}
