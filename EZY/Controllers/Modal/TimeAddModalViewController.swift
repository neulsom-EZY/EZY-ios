//
//  TimeAddModalViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/10/21.
//

import UIKit

protocol TimeAddDelegate: AnyObject {
    func updateData(leftOrRight: [String], selectedTime: [String], selectedTimeIndex: [Int])
}

class TimeAddModalViewController: BaseModal{
    // MARK: - Properties
    weak var delegate: TimeAddDelegate?
    
    private let bgView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let modalTitleLabel = UILabel().then {
        $0.text = "시간 선택"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let waveLabel = UILabel().then {
        $0.text = "~"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    }
    
    private let completeButton = UIButton().then{
        $0.setTitle("완 료", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(MakeTodo), for: .touchUpInside)
    }
    
    private let startPickerView = UIPickerView().then{
        $0.tintColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    private let endPickerView = UIPickerView().then{
        $0.tintColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    private let startMorningLabel = TimeLabel().then { $0.text = "오전" }

    private let startAfternoonLabel = TimeLabel().then { $0.text = "오후" }

    private let endMorningLabel = TimeLabel().then { $0.text = "오전" }

    private let endAfternoonLabel = TimeLabel().then { $0.text = "오후" }
    
    private let startHourLabel = TimeLabel().then{ $0.text = "시" }

    private let startMinLabel = TimeLabel().then{ $0.text = "분" }

    private let endHourLabel = TimeLabel().then{ $0.text = "시" }

    private let endMinLabel = TimeLabel().then{ $0.text = "분" }
    
    private let startButton = SwitchBtn(), endButton = SwitchBtn()
    
    private var selectedTimeIndex: [Int] = [0,0,0,0]

    private var selectedTime: [String] = ["01","00","01","00"]

    // MARK: - Helpers
    override func configure() {
        super.configure()

        addView()
        location()
        delegateAndDataSource()
    }
    
    //MARK: - addView
    private func addView(){
        [bgView].forEach { view.addSubview($0) }
        [modalTitleLabel, completeButton, waveLabel, completeButton, startMorningLabel, startAfternoonLabel, startButton, endMorningLabel, endAfternoonLabel, endButton, startPickerView, endPickerView, startHourLabel, startMinLabel, endHourLabel, endMinLabel].forEach { bgView.addSubview($0) }
    }
    
    //MARK: - delegateAndDataSource
    private func delegateAndDataSource(){
        startPickerView.delegate = self
        startPickerView.dataSource = self
        endPickerView.delegate = self
        endPickerView.dataSource = self
        endButton.delegate = self
        startButton.delegate = self
    }
    
    //MARK: - location
    private func location(){
        bgView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.13)
            make.height.equalToSuperview().dividedBy(3.04)
        }
        modalTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/15.62)
            make.top.equalToSuperview().offset(self.view.frame.height/33.83)
        }
        startMorningLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/7.97)
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(self.view.frame.height/31.23)
        }
        startButton.snp.makeConstraints { make in
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(self.view.frame.height/31.23)
            make.height.equalToSuperview().dividedBy(20.53)
            make.width.equalToSuperview().dividedBy(12.69)
            make.left.equalToSuperview().offset(self.view.frame.width/5)
        }
        endButton.snp.makeConstraints { make in
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(self.view.frame.height/31.23)
            make.height.equalToSuperview().dividedBy(20.53)
            make.width.equalToSuperview().dividedBy(12.69)
            make.right.equalToSuperview().offset(-self.view.frame.width/5)
        }
        startAfternoonLabel.snp.makeConstraints { make in
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(self.view.frame.height/31.23)
            make.left.equalTo(startButton.snp.right).offset(self.view.frame.width/38.33)
        }
        endAfternoonLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/7.97)
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(self.view.frame.height/31.23)
        }
        endMorningLabel.snp.makeConstraints { make in
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(self.view.frame.height/31.23)
            make.right.equalTo(endButton.snp.left).offset(-self.view.frame.width/38.33)
        }
        startPickerView.snp.makeConstraints { make in
            make.centerX.equalTo(startButton).offset(-self.view.frame.width/45)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(2)
            make.top.equalTo(startMorningLabel.snp.bottom).offset(self.view.frame.height/300)
        }
        endPickerView.snp.makeConstraints { make in
            make.centerX.equalTo(endButton).offset(-self.view.frame.width/45)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(2)
            make.top.equalTo(endMorningLabel.snp.bottom).offset(self.view.frame.height/300)
        }
        startHourLabel.snp.makeConstraints { make in
            make.centerY.equalTo(startPickerView)
            make.centerX.equalTo(startPickerView).offset(-self.view.frame.width/50)
        }
        startMinLabel.snp.makeConstraints { make in
            make.centerY.equalTo(startPickerView)
            make.centerX.equalTo(startPickerView).offset(self.view.frame.width/9)
        }
        endHourLabel.snp.makeConstraints { make in
            make.centerY.equalTo(endPickerView)
            make.centerX.equalTo(endPickerView).offset(-self.view.frame.width/50)
        }
        endMinLabel.snp.makeConstraints { make in
            make.centerY.equalTo(endPickerView)
            make.centerX.equalTo(endPickerView).offset(self.view.frame.width/9)
        }
        completeButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/15)
            make.top.equalTo(endPickerView.snp.bottom)
            make.width.equalToSuperview().dividedBy(4.71)
            make.height.equalToSuperview().dividedBy(8.09)
        }
        waveLabel.snp.makeConstraints { make in
            make.centerY.equalTo(startHourLabel)
            make.centerX.equalToSuperview()
        }
    }
    
    static func instance() -> TimeAddModalViewController {
        return TimeAddModalViewController(nibName: nil, bundle: nil).then {
            $0.modalPresentationStyle = .overFullScreen
        }
    }
    
    //MARK: - selectors
    @objc private func MakeTodo(){
        baseDelegate?.onTapClose()
        dismiss(animated: true, completion: nil)
        delegate?.updateData(leftOrRight: ["오전","오전"],
                             selectedTime: self.selectedTime,
                             selectedTimeIndex: self.selectedTimeIndex)
    }
    
    private func highlightedLabel(label:UILabel){
        label.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private func unHighlightedLabel(label:UILabel){
        label.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private func addZero(n: Int) -> String{
        if n < 10 { return "0\(n)" } else { return "\(n)" }
    }

    func timeValueSetting(leftOrRight: [String], selectedValuesIndex: [Int]){
        // 이전에 선택했던 값으로 datapickerview setting
        startPickerView.selectRow(selectedValuesIndex[0], inComponent: 0, animated: false)
        startPickerView.selectRow(selectedValuesIndex[1], inComponent: 1, animated: false)
        endPickerView.selectRow(selectedValuesIndex[2], inComponent: 0, animated: false)
        endPickerView.selectRow(selectedValuesIndex[3], inComponent: 1, animated: false)
    }
}

extension TimeAddModalViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 { return 12 }else{ return 60 }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == startPickerView{
            if component == 0{
                print("0 : \(addZero(n: row+1))")
                selectedTime[0] = addZero(n: row+1)
                selectedTimeIndex[0] = row
            }else {
                print("1 : \(addZero(n: row))")

                selectedTime[1] = addZero(n: row)
                selectedTimeIndex[1] = row
            }
        }else if pickerView == endPickerView{
            if component == 0{
                print("2 : \(addZero(n: row+1))")

                selectedTime[2] = addZero(n: row+1)
                selectedTimeIndex[2] = row
            }else {
                print("3 : \(addZero(n: row))")

                selectedTime[3] = addZero(n: row)
                selectedTimeIndex[3] = row
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        var pickerLabel = view as? UILabel
        
        if (pickerLabel == nil)
        {
            pickerLabel = UILabel()
            
            pickerLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
            pickerLabel?.textColor = UIColor(red: 120/255, green: 108/255, blue: 255/255, alpha: 1)
            pickerLabel?.textAlignment = .center
        }
        
        if component == 0{
            pickerLabel?.text = "\(addZero(n:row+1))"
        }else{ // component == 1
            pickerLabel?.text = "\(addZero(n:row))"
        }
        
        pickerView.subviews[1].backgroundColor = .clear // 회색 뷰 지우기
        
        return pickerLabel!

    }
}

extension TimeAddModalViewController: SwitchStateDelegate{
    func isOnValueChange(isOn: Bool) {
        print("endbutton \(endButton.switchState)")
        print("startbutton \(startButton.switchState)")
    }
}
