//
//  ViewModel.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/04.
//

import UIKit

protocol FormViewMdoel {
    func updateForm()
}

protocol SwitchViewModel {
    var switchState : Bool{get}
}

struct Switch : SwitchViewModel {
    
    var click : Bool?
    
    var switchState: Bool{
        return click!
    }
}
