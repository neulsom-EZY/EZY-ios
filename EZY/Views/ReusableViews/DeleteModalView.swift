//
//  DeleteModal.swift
//  EZY
//
//  Created by 김유진 on 2021/06/16.
//

import UIKit

class DeleteModalView: UIView {
    
    lazy var backgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    lazy var modalBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    lazy var modalTitleLabel = UILabel().then {
        $0.text = "그룹 삭제"
        $0.textColor = UIColor(red: 236/255, green: 188/255, blue: 116/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var circleView = UIView().then {
        $0.backgroundColor = UIColor(red: 255/255, green: 225/255, blue: 181/255, alpha: 1)
    }
    
    let iconImageView: UIImageView = UIImageView(image: UIImage(named: "EZY_OurJob"))
    
    lazy var userName = UILabel().then {
        $0.text = "민지님의"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var labelContentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var planNameLabel = UILabel().then {
        $0.text = "STUDY GROUP"
        $0.textColor = UIColor(red: 255/255, green: 203/255, blue: 124/255, alpha: 1)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var deleteLabel = UILabel().then {
        $0.text = "그룹을 삭제할까요?"
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var cancelButton = UIButton().then {
        $0.setTitle("취 소", for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 255/255, green: 197/255, blue: 109/255, alpha: 1)
        $0.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12 * 0.92)
    }
    
    lazy var deleteButton = UIButton().then {
        $0.setTitle("삭 제", for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 255/255, green: 214/255, blue: 153/255, alpha: 1)
        $0.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12 * 0.92)

    }
    
    lazy var labeltobottomView = UIView().then {
        $0.backgroundColor = .white
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
