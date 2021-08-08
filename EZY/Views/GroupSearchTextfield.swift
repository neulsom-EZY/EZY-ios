//
//  GroupSearchTextfield.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/08.
//

import UIKit

class GroupSearchTextfield: UITextField {
    let tf = UITextField()
    let spacer = UIView()
    
    init(placeholder : String) {
        super.init(frame: .zero)
        tf.delegate = self
        leftView = spacer
        leftViewMode = .always
        borderStyle = .none
        keyboardAppearance = .dark
        backgroundColor = .EZY_F5F5F5
        textColor = .EZY_656565
        dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.EZY_CACACA])
        tf.snp.makeConstraints { (make) in
            make.height.equalTo(frame.height)
            make.width.equalTo(frame.width)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/3.8
        spacer.snp.makeConstraints { (make) in
            make.height.equalTo(frame.height)
            make.width.equalTo(frame.height/2.11)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension GroupSearchTextfield : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text{
            filterText(text+string)
        }
        return true
    }
    func filterText(_ query: String){
        MorePeopleToDo.filterData.removeAll()
        for string in MorePeopleToDo.data{
            if string.lowercased().starts(with: query.lowercased()){
                MorePeopleToDo.filterData.append(string)
            }
        }
        SearchTableView().tv.reloadData()
        MorePeopleToDo.filtered = true
        
    }
}
