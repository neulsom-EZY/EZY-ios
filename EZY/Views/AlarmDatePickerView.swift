//
//  AlarmDatePickerView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/03.
//

import UIKit

class AlarmDatePickerView : UIView{
    
    private let view = UIView()
    
    private let ampmPickerView = UIPickerView().then{
        $0.backgroundColor = .white
    }
    private let timePickerView = UIPickerView().then{
        $0.backgroundColor = .white
    }
    private let minutePickerView = UIPickerView().then{
        $0.backgroundColor = .white
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
        self.timePickerView.dataSource = self
        self.timePickerView.delegate = self
        self.minutePickerView.dataSource = self
        self.minutePickerView.delegate = self
        addView()
    }
    func addView(){
        addSubview(view)
        addSubview(ampmPickerView)
        view.addSubview(timePickerView)
        view.addSubview(minutePickerView)
        addSubview(timeLabel)
        addSubview(minuteLabel)
    }
    override func layoutSubviews(){
        super.layoutSubviews()
        view.snp.makeConstraints { (make) in
            make.top.right.bottom.left.equalToSuperview()
        }
        ampmPickerView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.top.equalToSuperview().offset(view.frame.height/4.8095)
            make.height.equalTo(frame.height)
            make.width.equalTo(frame.height/2.8)
        }
        timePickerView.snp.makeConstraints { (make) in
            make.left.equalTo(ampmPickerView.snp.right).inset(frame.height/20.2)
            make.top.equalToSuperview().offset(view.frame.height/4.8095)
            make.height.equalTo(frame.height)
            make.width.equalTo(frame.height/2.5)
        }
        minutePickerView.snp.makeConstraints { (make) in
            make.left.equalTo(timeLabel.snp.right)
            make.top.equalToSuperview().offset(view.frame.height/4.8095)
            make.height.equalTo(frame.height)
            make.width.equalTo(frame.height/2.5)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(timePickerView.snp.right).inset(frame.height/20.2)
        }

        minuteLabel.snp.makeConstraints { (make) in
            make.left.equalTo(minutePickerView.snp.right).inset(frame.height/20.2)
            make.centerY.equalToSuperview()
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
        if pickerView == self.ampmPickerView{
            return MoreAlarmModelViewController().ampmData.count
        }
        else if pickerView == self.timePickerView{
            return 12
        }
        else if pickerView == self.minutePickerView{
            return 60
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == self.ampmPickerView{
        return MoreAlarmModelViewController().ampmData[row]
        }
        else if pickerView == self.timePickerView{
            return "\(row)"
        }
        else if pickerView == self.minutePickerView{
            return "\(row)"
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == self.ampmPickerView{
            MoreAlarmModelViewController().ampm = MoreAlarmModelViewController().ampmData[row]
        }
        else if pickerView == self.timePickerView{
            MoreAlarmModelViewController().time = row
        }
        else if pickerView == self.minutePickerView{
            MoreAlarmModelViewController().minute = row
        }
    }



    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        pickerView.subviews[1].backgroundColor = .clear // 회색 뷰 지우기
        
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        if pickerView == self.ampmPickerView{
            
            label.text =  MoreAlarmModelViewController().ampmData[row]
            label.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")

        }else if pickerView == self.timePickerView{
            label.text = "\(row + 1)"
            label.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
            label.textColor = .EZY_8176FF
        }else if pickerView == self.minutePickerView{
            label.text = "\(row)"
            label.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
            label.textColor = .EZY_8176FF
        }
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true

        label.textAlignment = .right
        return label
  
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {

         pickerView.subviews.forEach({

              $0.isHidden = $0.frame.height < 1.0
         })

         return 1
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let w = pickerView.frame.size.width
        return component == 0 ? (2/3.6) * w : (1 / 3.6) * w
    }
    

}
