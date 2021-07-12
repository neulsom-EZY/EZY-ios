//
//  AddScheduleModalBtn .swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/12.
//

import UIKit

class AddScheduleModalBtn : UIButton{
    
    private let label = UILabel().then{
        $0.dynamicFont(fontSize: 10, weight: .semibold)
        $0.textColor = .EZY_AEA9F2
    }
    private let view = UIView().then{
        $0.backgroundColor = .EZY_AEA9F2
    }
    private let image = UIImageView().then{
        $0.tintColor = .white
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
