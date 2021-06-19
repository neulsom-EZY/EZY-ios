//
//  MoreCalendarModalsController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/19.
//

import UIKit
import Then
import SnapKit

//protocol BulletinDelegate: class{
//    func onTapClase()
//}

class MoreCalendarModalsViewController : UIViewController{
    
    let bgView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 40
    }
    private let titleLable = UILabel().then{
        $0.text = "추가 할 항목을 선택해주세요"
        $0.dynamicFont(fontSize: 22, weight: .thin)
    }
    
//    private let myToDo : MoreCalendarBtn{
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(bgView)
        view.addSubview(titleLable)
        
        
    }
    
    
    
}
