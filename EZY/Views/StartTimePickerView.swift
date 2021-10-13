//
//  StartTimePickerView.swift
//  EZY
//
//  Created by 김유진 on 2021/10/13.
//

import UIKit

class StartTimePickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    var startTimeDataArray = [["01:00","02:00","03:00","04:00"],["05:00","06:00","07:00","08:00"]]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return startTimeDataArray[component].count
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return startTimeDataArray[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let myView = UIView()

        var pickerLabel = UILabel().then{
            $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
            $0.textColor = UIColor(red: 120/255, green: 108/255, blue: 255/255, alpha: 1)
            $0.textAlignment = .center
        }
        
        pickerLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalToSuperview()
        }
        
        myView.addSubview(pickerLabel)
        
        pickerLabel.text = startTimeDataArray[component][row]
        pickerView.subviews[1].backgroundColor = .clear // 회색 뷰 지우기
            
        return myView
    }
}
