//
//  inputContainerTextFieldView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/22.
//

import UIKit
import SnapKit
import Then

class inputContainerTextFieldView : UIView{
    
    private let textField = UITextField().then {
        $0.dynamicFont(fontSize: <#T##CGFloat#>, weight: <#T##UIFont.Weight#>)
    }
    private var textFieldModel : TextFieldModel?
    
    init(textFieldModel:TextFieldModel) {
        self.textFieldModel = textFieldModel
        super.init(frame: .zero)
        
    }
    override init(frame: CGRect) {
        self.textFieldModel = nil
        super.init(frame: frame)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
