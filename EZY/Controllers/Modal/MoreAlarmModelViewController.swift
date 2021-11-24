//
//  MoreAlarmModelViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/26.
//

import UIKit
import SnapKit
import Then

protocol AlarmModelDelegate: AnyObject {
    func updateData(ampm : String , time : Int , minute : Int)
}

class MoreAlarmModelViewController : BaseModal{
    private  let ampmData = ["오후","오전"]
    private  lazy var ampm = self.ampmData[0]
    private var time = 0
    private var minute = 0
    //MARK: - Properties
    weak var delegate: AlarmModelDelegate?
    
    let bgView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 40
    }
    
    
    private let makeButton = UIButton().then{
        $0.backgroundColor = .rgb(red: 129, green: 118, blue: 255)
        $0.addTarget(self, action: #selector(MakeTodo), for: .touchUpInside)
    }
    private let makeTitle = UILabel().then{
        $0.text = "완 료"
        $0.textColor = .white
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    private let AlarmDateView = AlarmDatePickerView().then{
        $0.backgroundColor = .clear
    }
    
    static func instance() -> MoreAlarmModelViewController {
        return MoreAlarmModelViewController(nibName: nil, bundle: nil).then {
            $0.modalPresentationStyle = .overFullScreen
        }
    }
    //MARK: - Lifecycle
    override func configure() {
        super.configure()
        addView()
        cornerRadius()
        location()
        delegateAndDataSource()
    }
    
    //MARK: - Selectors
    @objc func onTapClose() {
        baseDelegate?.onTapClose()
        dismiss(animated: true, completion: nil)
    }
    

    @objc func MakeTodo(){
        baseDelegate?.onTapClose()
        dismiss(animated: true, completion: nil)
        delegate?.updateData(ampm: ampm , time: time, minute: minute)
    }
    //MARK: - HELPERS
    private func configureUI(){
        
    }
    private func addView(){
        [transparentView,bgView,makeButton].forEach {view.addSubview($0)}
        makeButton.addSubview(makeTitle)
        bgView.addSubview(AlarmDateView)
    }
    
    private func delegateAndDataSource(){
        [AlarmDateView.ampmPickerView,AlarmDateView.timePickerView,AlarmDateView.minutePickerView].forEach { $0.dataSource = self; $0.delegate = self}
    }
    
    private func cornerRadius(){
        makeButton.layer.cornerRadius = view.frame.height/81.2
    }
    private func location(){
        bgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(30)
            make.height.equalToSuperview().dividedBy(3.85)
        }
        AlarmDateView.snp.makeConstraints { (make) in
            make.top.equalTo(bgView).offset(view.frame.height/22.5555)
            make.height.equalTo(view.frame.height/8.04)
            make.left.right.equalToSuperview()
        }
   
        makeButton.snp.makeConstraints { (make) in
            make.top.equalTo(bgView.snp.top).offset(view.frame.height/6.15)
            make.right.equalTo(view.snp.right).offset(view.frame.height/22.56 * -1)
            make.width.equalTo(view.frame.height/11.6)
            make.height.equalTo(view.frame.height/24.61 )
        }
        makeTitle.snp.makeConstraints { (make) in
            make.center.equalTo(makeButton.snp.center)
        }
        
        
    }

}
//MARK: - PickerView Setting
extension MoreAlarmModelViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == AlarmDateView.ampmPickerView{
            return ampmData.count
        }
        else if pickerView == AlarmDateView.timePickerView{
            return 12
        }
        else if pickerView == AlarmDateView.minutePickerView{
            return 60
        }
        return 0
    }
    //MARK: - Picker 갯수
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == AlarmDateView.ampmPickerView{
            return ampmData[row]
        }
        else if pickerView == AlarmDateView.timePickerView{
            return "\(row)"
        }
        else if pickerView == AlarmDateView.minutePickerView{
            return "\(row)"
        }
        return ""
    }
    //MARK: - picker Result
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == AlarmDateView.ampmPickerView{
            ampm = ampmData[row]
            print(ampmData[row])
        }
        else if pickerView == AlarmDateView.timePickerView{
            time = row
            print(row + 1)
        }
        else if pickerView == AlarmDateView.minutePickerView{
            minute = row
            print(row)
        }
    }
    //MARK: - PickerView Setting
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        pickerView.subviews[1].backgroundColor = .clear // 회색 뷰 지우기
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        if pickerView == AlarmDateView.ampmPickerView{
            label.text = ampmData[row]
            label.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
        }else if pickerView == AlarmDateView.timePickerView{
            label.text = "\(row + 1)"
            label.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
            label.textColor = .rgb(red: 129, green: 118, blue: 255)
        }else if pickerView == AlarmDateView.minutePickerView{
            label.text = "\(row)"
            label.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
            label.textColor = .rgb(red: 129, green: 118, blue: 255)
        }
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true

        label.textAlignment = .right
        return label
  
    }
    //MARK: - Picker width
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let w = pickerView.frame.size.width
        return component == 0 ? (2/3.6) * w : (1 / 3.6) * w
    }
}
