//
//  MoreCalendarBtn.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/19.
//

import UIKit

class MoreCalendarBtn : UIButton{
    
    var title : String? {
        didSet{
            let title = title
        }
    }
    var image : UIImage? {
        didSet{
            let image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
