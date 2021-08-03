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
        ampmPickerView.tintColor = .clear
        addView()
    }
    func addView(){
        addSubview(view)
        view.addSubview(ampmPickerView)
//        view.addSubview(timeLabel)
//        view.addSubview(minuteLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        view.snp.makeConstraints { (make) in
            make.top.right.bottom.left.equalToSuperview()
        }
        ampmPickerView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.height.equalTo(frame.height/2.80556)
            make.width.equalTo(frame.width)
        }
//        timeLabel.snp.makeConstraints { (make) in
//            make.centerY.equalToSuperview()
//        }
//
//        minuteLabel.snp.makeConstraints { (make) in
//            make.centerY.equalToSuperview()
//        }
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
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return frame.height/2.80556
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
        label.text =  MoreAlarmModelViewController().ampmData[row]
        label.textAlignment = .center
        return label
    }
    
}
