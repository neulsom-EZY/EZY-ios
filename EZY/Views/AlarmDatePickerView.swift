//
//  AlarmDatePickerView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/03.
//

import UIKit

class AlarmDatePickerView : UIView{
    
    private let ampmPickerView = UIPickerView().then{
        $0.backgroundColor = .clear
    }
    private let timeLabel = UILabel().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
        $0.text = "시"
    }
    private let minuteLabel = UILabel().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
        $0.text = "분"
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.ampmPickerView.delegate = self
        self.ampmPickerView.dataSource = self
        addView()
    }
    func addView(){
        addSubview(ampmPickerView)
        addSubview(timeLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        ampmPickerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.top.centerY.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension AlarmDatePickerView : UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MoreAlarmModelViewController().ampmData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return MoreAlarmModelViewController().ampmData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(row)")
    }
    
 
    
}
