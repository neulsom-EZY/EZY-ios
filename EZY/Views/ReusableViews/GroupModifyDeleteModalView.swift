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
    lazy var groupModifyLabelBackgroundView = UIView().then{
        $0.backgroundColor = UIColor(red: 255/255, green: 236/255, blue: 236/255, alpha: 1)
    }
    
    lazy var groupDeleteLabelBackgroundView = UIView().then{
        $0.backgroundColor = UIColor(red: 255/255, green: 236/255, blue: 236/255, alpha: 1)
    }
    
    lazy var introTitleLabel = UILabel().then {
        $0.text = "항목을 선택해주세요"
        $0.dynamicFont(fontSize: 19, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var modifyViewButton = UIButton().then {

        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.9
        $0.layer.shadowRadius = 7
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
    }
    
    lazy var deleteViewButton = UIButton().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 136/255, green: 128/255, blue: 255/255, alpha: 1).cgColor
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.9
        $0.layer.shadowRadius = 7
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
    }
    
    lazy var modifyIconBackgroundCircleView = UIView().then {
        $0.backgroundColor = UIColor(red: 136/255, green: 128/255, blue: 255/255, alpha: 1)
    }
    
    lazy var deleteIconBackgroundCircleView = UIView().then {
        $0.backgroundColor = UIColor(red: 174/255, green: 169/255, blue: 242/255, alpha: 1)
    }
    
    lazy var modifyLabel = UILabel().then {
        $0.text = "일정 수정"
        $0.textColor = UIColor(red: 174/255, green: 169/255, blue: 242/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var deleteLabel = UILabel().then {
        $0.text = "일정 삭제"
        $0.textColor = UIColor(red: 136/255, green: 128/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var modifyIconImageView = UIImageView().then{
        $0.image = UIImage(named: "EZY_EditWhiteButton")
    }
    
    lazy var deleteIconImageView = UIImageView().then{
        $0.image = UIImage(named: "EZY_DeleteWhiteButton")
    }
    
    lazy var selectButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 136/255, green: 128/255, blue: 255/255, alpha: 1)
        $0.setTitle("선 택", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
