//
//  TimeAddModalViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/10/21.
//

import UIKit

protocol TimeAddDelegate: AnyObject {
    func updateData(leftOrRight: [String], startTime: String, endTime: String, afterOrMorn: [String], selectedTimeIndex: [Int])
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
    
    private let startMorningLabel = UILabel().then {
        $0.text = "오전"
        $0.textColor = UIColor(red: 114/255, green: 114/255, blue: 114/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let startAfternoonLabel = UILabel().then {
        $0.text = "오후"
        $0.textColor = UIColor(red: 114/255, green: 114/255, blue: 114/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let endMorningLabel = UILabel().then {
        $0.text = "오전"
        $0.textColor = UIColor(red: 114/255, green: 114/255, blue: 114/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let endAfternoonLabel = UILabel().then {
        $0.text = "오후"
        $0.textColor = UIColor(red: 114/255, green: 114/255, blue: 114/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let startHourLabel = UILabel().then{
        $0.text = "시"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let startMinLabel = UILabel().then{
        $0.text = "분"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let endHourLabel = UILabel().then{
        $0.text = "시"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let endMinLabel = UILabel().then{
        $0.text = "분"
        $0.textColor = UIColor.black
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let startSelectBackButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.addTarget(self, action: #selector(startSelectCircleButton(sender:)), for: .touchUpInside)
    }
    
    private let endSelectBackButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.addTarget(self, action: #selector(endSelectCircleButton(sender:)), for: .touchUpInside)
    }
    
    private let startSelectCircleButton = UIButton().then {
        $0.backgroundColor = UIColor.white
        $0.isUserInteractionEnabled = false
    }
    
    private let endSelectCircleButton = UIButton().then {
        $0.backgroundColor = UIColor.white
        $0.isUserInteractionEnabled = false
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
    
    private var leftOrRight = ["L", "L"]
    
    fileprivate var startSelectedLabelText = "L"
    
    fileprivate var endSelectedLabelText = "L"
    
    fileprivate var startHourTime = "01"
    
    fileprivate var startMinTime = "00"
    
    fileprivate var startTime = "01 : 00"
    
    fileprivate var endHourTime = "01"
    
    fileprivate var endMinTime = "00"
    
    fileprivate var endTime = "01 : 00"
    
    private var afterOrMorn = ["오후","오후"]
    
    private var sendStartTime = "01 : 00"
    
    private var sendEndTime = "01 : 00"
    
    private var selectedTimeIndex: [Int] = [0,0,0,0]
    
    static func instance() -> TimeAddModalViewController {
        return TimeAddModalViewController(nibName: nil, bundle: nil).then {
            $0.modalPresentationStyle = .overFullScreen
        }
    }
    

    // MARK: - Helpers
    override func configure() {
        super.configure()
        addView()
        
        location()
        
        delegateAndDataSource()
    }
    
    //MARK: - delegateAndDataSource
    func delegateAndDataSource(){
        startPickerView.delegate = self
        startPickerView.dataSource = self
        endPickerView.delegate = self
        endPickerView.dataSource = self
    }
    
    //MARK: - addLayout
    func location(){
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
        
        startSelectBackButton.snp.makeConstraints { make in
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(self.view.frame.height/31.23)
            make.height.equalToSuperview().dividedBy(20.53)
            make.width.equalToSuperview().dividedBy(12.69)
            make.left.equalTo(startMorningLabel.snp.right).offset(self.view.frame.width/38.33)
            
            startSelectBackButton.layer.cornerRadius = self.view.frame.height/3.04/20.53/2
        }
        
        startSelectCircleButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/290)
            make.height.equalToSuperview().dividedBy(1.2)
            make.width.equalTo(startSelectBackButton.snp.height).dividedBy(1.2)
            
            startSelectCircleButton.layer.cornerRadius = self.view.frame.height/3.04/20.53/1.2/2
        }
        
        startAfternoonLabel.snp.makeConstraints { make in
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(self.view.frame.height/31.23)
            make.left.equalTo(startSelectBackButton.snp.right).offset(self.view.frame.width/38.33)
        }
        
        endAfternoonLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/7.97)
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(self.view.frame.height/31.23)
        }
        
        endSelectBackButton.snp.makeConstraints { make in
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(self.view.frame.height/31.23)
            make.height.equalToSuperview().dividedBy(20.53)
            make.width.equalToSuperview().dividedBy(12.69)
            make.right.equalTo(endAfternoonLabel.snp.left).offset(-self.view.frame.width/38.33)
            
            endSelectBackButton.layer.cornerRadius = self.view.frame.height/3.04/20.53/2
        }
        
        endSelectCircleButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/290)
            make.height.equalToSuperview().dividedBy(1.2)
            make.width.equalTo(startSelectBackButton.snp.height).dividedBy(1.2)
                        
            endSelectCircleButton.layer.cornerRadius = self.view.frame.height/3.04/20.53/1.2/2
        }
        
        endMorningLabel.snp.makeConstraints { make in
            make.top.equalTo(modalTitleLabel.snp.bottom).offset(self.view.frame.height/31.23)
            make.right.equalTo(endSelectBackButton.snp.left).offset(-self.view.frame.width/38.33)
        }
        
        startPickerView.snp.makeConstraints { make in
            make.centerX.equalTo(startSelectBackButton).offset(-self.view.frame.width/45)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(2)
            make.top.equalTo(startMorningLabel.snp.bottom).offset(self.view.frame.height/300)
        }
        
        endPickerView.snp.makeConstraints { make in
            make.centerX.equalTo(endSelectBackButton).offset(-self.view.frame.width/45)
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
            make.right.equalToSuperview().offset(-self.view.frame.width/13.2)
            make.top.equalTo(endPickerView.snp.bottom)
            make.width.equalToSuperview().dividedBy(4.71)
            make.height.equalToSuperview().dividedBy(8.09)
        }
        
        waveLabel.snp.makeConstraints { make in
            make.centerY.equalTo(startHourLabel)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: - addView
    func addView(){
        self.view.addSubview(bgView)
        bgView.addSubview(modalTitleLabel)
        bgView.addSubview(completeButton)
        bgView.addSubview(waveLabel)
        bgView.addSubview(completeButton)
        
        bgView.addSubview(startMorningLabel)
        bgView.addSubview(startAfternoonLabel)
        bgView.addSubview(startSelectBackButton)
        startSelectBackButton.addSubview(startSelectCircleButton)
        
        bgView.addSubview(endMorningLabel)
        bgView.addSubview(endAfternoonLabel)
        bgView.addSubview(endSelectBackButton)
        endSelectBackButton.addSubview(endSelectCircleButton)
        
        bgView.addSubview(startPickerView)
        bgView.addSubview(endPickerView)
        
        bgView.addSubview(startHourLabel)
        bgView.addSubview(startMinLabel)
        bgView.addSubview(endHourLabel)
        bgView.addSubview(endMinLabel)
    }
    
    //MARK: - selectors
    @objc func MakeTodo(){
        baseDelegate?.onTapClose()
        dismiss(animated: true, completion: nil)
        afterOrMorn = [startSelectedLabelText, endSelectedLabelText]

        // startHourTime 그니까 시분이랑 sendStartTime이랑 다르면 sendStartTime의 hour, 또는 min자리에 넣어주면될듯~!!진짜루~!

        delegate?.updateData(leftOrRight: self.leftOrRight,
                             startTime: self.sendStartTime,
                             endTime: self.sendEndTime,
                             afterOrMorn: self.afterOrMorn,
                             selectedTimeIndex: self.selectedTimeIndex)
    }
    
    @objc func endSelectCircleButton(sender:UIButton){
        endSelectCircleButtonMove(endSelectedLabelText: endSelectedLabelText)
    }
    
    @objc func startSelectCircleButton(sender:UIButton){
        startSelectCircleButtonMove(startSelectedLabelText: startSelectedLabelText)
    }
    
    func highlightedLabel(label:UILabel){
        label.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    func unHighlightedLabel(label:UILabel){
        label.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    func addZero(n: Int) -> String{
        if n < 10 { return "0\(n)" } else { return "\(n)" }
    }
    
    func startSelectCircleButtonMove(startSelectedLabelText: String){
        UIView.animate(withDuration: 0.3) { [self] in
            self.startSelectCircleButton.snp.remakeConstraints { make in
                make.centerY.equalToSuperview()
                make.height.equalToSuperview().dividedBy(1.2)
                make.width.equalTo(self.startSelectBackButton.snp.height).dividedBy(1.2)
                
                if leftOrRight[0] == "L"{
                    make.right.equalToSuperview().offset(-self.view.frame.width/290)
                    
                    self.highlightedLabel(label: self.startAfternoonLabel)
                    self.unHighlightedLabel(label: self.startMorningLabel)
                    
                    self.leftOrRight[0] = "R"
                }else{
                    make.left.equalToSuperview().offset(self.view.frame.width/290)
                    
                    self.highlightedLabel(label: self.startMorningLabel)
                    self.unHighlightedLabel(label: self.startAfternoonLabel)
                    
                    self.leftOrRight[0] = "L"

                }
            }
            
            self.view.layoutIfNeeded()
        }
    }
    
    func endSelectCircleButtonMove(endSelectedLabelText: String){
        UIView.animate(withDuration: 0.3) { [self] in
            self.endSelectCircleButton.snp.remakeConstraints { make in
                make.centerY.equalToSuperview()
                make.height.equalToSuperview().dividedBy(1.2)
                make.width.equalTo(self.endSelectBackButton.snp.height).dividedBy(1.2)
                
                if leftOrRight[1] == "L"{
                    make.right.equalToSuperview().offset(-self.view.frame.width/290)
                    
                    self.highlightedLabel(label: self.endAfternoonLabel)
                    self.unHighlightedLabel(label: self.endMorningLabel)
                    
                    self.leftOrRight[1] = "R"
                }else{
                    make.left.equalToSuperview().offset(self.view.frame.width/290)
                    
                    self.highlightedLabel(label: self.endMorningLabel)
                    self.unHighlightedLabel(label: self.endAfternoonLabel)
                    
                    self.leftOrRight[1] = "L"
                }
            }
            self.view.layoutIfNeeded()
        }
    }
    
    func timeValueSetting(receiveStartTime: String, receiveEndTime: String, leftOrRight: [String], selectedValuesIndex: [Int]){
        // 이전에 선택했던 값 변수에 save
        self.leftOrRight = leftOrRight
        self.selectedTimeIndex = selectedValuesIndex
        self.sendStartTime = receiveStartTime
        self.sendEndTime = receiveEndTime
        
        // 이전에 선택했던 값으로 datapickerview setting
        startPickerView.selectRow(selectedValuesIndex[0], inComponent: 0, animated: false)
        startPickerView.selectRow(selectedValuesIndex[1], inComponent: 1, animated: false)
        endPickerView.selectRow(selectedValuesIndex[2], inComponent: 0, animated: false)
        endPickerView.selectRow(selectedValuesIndex[3], inComponent: 1, animated: false)
        
        // 이전에 선택했던 오전, 오후 값으로 setting
        if leftOrRight[0] == "R"{
            self.startSelectCircleButton.snp.remakeConstraints { make in
                make.centerY.equalToSuperview()
                make.height.equalToSuperview().dividedBy(1.2)
                make.width.equalTo(self.startSelectBackButton.snp.height).dividedBy(1.2)
                make.right.equalToSuperview().offset(-self.view.frame.width/290)
            }
            
            self.highlightedLabel(label: self.startAfternoonLabel)
            self.unHighlightedLabel(label: self.startMorningLabel)
        }else{
            self.startSelectCircleButton.snp.remakeConstraints { make in
                make.centerY.equalToSuperview()
                make.height.equalToSuperview().dividedBy(1.2)
                make.width.equalTo(self.startSelectBackButton.snp.height).dividedBy(1.2)
                make.left.equalToSuperview().offset(self.view.frame.width/290)
            }
            self.highlightedLabel(label: self.startMorningLabel)
            self.unHighlightedLabel(label: self.startAfternoonLabel)
        }
        
        if leftOrRight[1] == "R"{
            self.endSelectCircleButton.snp.remakeConstraints { make in
                make.centerY.equalToSuperview()
                make.height.equalToSuperview().dividedBy(1.2)
                make.width.equalTo(self.endSelectBackButton.snp.height).dividedBy(1.2)
                make.right.equalToSuperview().offset(-self.view.frame.width/290)
            }
            
            self.highlightedLabel(label: self.endAfternoonLabel)
            self.unHighlightedLabel(label: self.endMorningLabel)
        }else{
            self.endSelectCircleButton.snp.remakeConstraints { make in
                make.centerY.equalToSuperview()
                make.height.equalToSuperview().dividedBy(1.2)
                make.width.equalTo(self.endSelectBackButton.snp.height).dividedBy(1.2)
                make.left.equalToSuperview().offset(self.view.frame.width/290)
            }
            
            self.highlightedLabel(label: self.endMorningLabel)
            self.unHighlightedLabel(label: self.endAfternoonLabel)
        }
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
                startHourTime = "\(addZero(n: row+1))"
                selectedTimeIndex[0] = row
            }else {
                startMinTime = addZero(n: row)
                selectedTimeIndex[1] = row
            }
        }else if pickerView == endPickerView{
            if component == 0{
                endHourTime = addZero(n: row+1)
                selectedTimeIndex[2] = row
            }else {
                endMinTime = addZero(n: row)
                selectedTimeIndex[3] = row
            }
        }
        
        // 여기서 변경된 값만 넣어줘야함 그래서.. 이 아래 두 코드를 여기서 넣어주면 안되고 근데 maketodo에 또 넣으면 안됨 ㅅㅂ
        sendStartTime = "\(startHourTime) : \(startMinTime)"
        sendEndTime = "\(endHourTime) : \(endMinTime)"
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
