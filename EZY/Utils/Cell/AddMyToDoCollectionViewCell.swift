//
//  AddMyToDoCollectionViewCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/07.
//

import UIKit
import SnapKit
import Alamofire
import Then

class AddMyToDoCollectionViewCell: UICollectionViewCell {
    static let identifier = "AddMyToDoCollectionViewCell"
    
    let cellClickButton = UILabel().then {
        $0.backgroundColor = .clear
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLocation()
        
    }
    override var isSelected: Bool{
        didSet{
            if isSelected{
                backgroundColor = AddMyToDoViewController.cellColor[IndexPath().count]
                cellClickButton.textColor = .white
            }else{
                backgroundColor = .clear
                cellClickButton.textColor = AddMyToDoViewController.cellColor.first
            }
        }
    }
    
    func setLocation(){
        addSubview(cellClickButton)
        cellClickButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
