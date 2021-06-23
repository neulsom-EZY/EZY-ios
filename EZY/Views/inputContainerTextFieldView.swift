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
    private let  label = UILabel()
    
    private let view = UIView()
    
    private let  textField = UITextField()
    
    private var textFieldModel : TextFieldModel?
    
    init(textFieldModel:TextFieldModel) {
        self.textFieldModel = textFieldModel
        super.init(frame: .zero)
        
        addSubViews()
        configures(with: textFieldModel)
    }
    override init(frame: CGRect) {
        self.textFieldModel = nil
        super.init(frame: .zero)
        
    }
    private func addSubViews(){
        addSubview(view)
        view.addSubview(label)
        view.addSubview(textField)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configures(with textFieldModel : TextFieldModel){
        layer.backgroundColor = textFieldModel.color?.cgColor
        
        label.text = textFieldModel.title
        label.textColor = textFieldModel.labelColor
        label.dynamicFont(fontSize: textFieldModel.labelSize!, weight: textFieldModel.labelFont!)
        
        textField.textColor = textFieldModel.tfcolor
        textField.dynamicFont(fontSize: textFieldModel.tfSize!, weight: textFieldModel.tfFont!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(frame.height / 38.6)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        textField.snp.makeConstraints { (make) in
            make.right.equalTo(view.snp.right).offset(frame.height/31.2 * -1)
            make.height.equalTo(frame.height/14.7)
            make.centerY.equalToSuperview()
            make.left.equalTo(label.snp.right).offset(frame.height/31.2)
        }
        
    }
}
