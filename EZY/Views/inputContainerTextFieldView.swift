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
    private let label = UILabel()
    
    private let view = UIView()
    
    private let textField = UITextField()
    
    private var textFieldModel : TextFieldModel?
    
    init(textFieldModel:TextFieldModel) {
        self.textFieldModel = textFieldModel
        super.init(frame: .zero)
        
    }
    override init(frame: CGRect) {
        self.textFieldModel = nil
        super.init(frame: frame)
        
    }
    private func addSubViews(){
        addSubview(label)
        addSubview(textField)
        addSubview(view)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(with textFieldModel : TextFieldModel){
        view.layer.backgroundColor = textFieldModel.color?.cgColor
        label.textColor = textFieldModel.tfcolor
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
