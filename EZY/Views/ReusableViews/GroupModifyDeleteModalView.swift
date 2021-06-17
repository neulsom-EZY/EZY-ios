//
//  GroupModifyDeleteModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/15.
//

import UIKit

class GroupModifyDeleteModalView: UIView {
    
    lazy var backgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
    }
    
    lazy var modalBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 40
        $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
    }
    
    lazy var lineView = UIView().then {
        $0.backgroundColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
    }
    
    lazy var groupModifyLabelBackgroundView = UIView().then{
        $0.backgroundColor = UIColor(red: 255/255, green: 236/255, blue: 236/255, alpha: 1)
    }
    
    lazy var groupDeleteLabelBackgroundView = UIView().then{
        $0.backgroundColor = UIColor(red: 255/255, green: 236/255, blue: 236/255, alpha: 1)
    }
    
    lazy var groupModifyButton = UIButton().then{
        $0.setTitle("그룹 수정", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 15 * 0.92)
    }
    
    lazy var groupDeleteButton = UIButton().then{
        $0.setTitle("그룹 삭제", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 15 * 0.92)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
