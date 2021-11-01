//
//  AlarmDatePickerView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/08/03.
//

import UIKit

class AlarmDatePickerView : UIView{
    
    private let view = UIView()
    
    let ampmPickerView = UIPickerView().then{
         $0.backgroundColor = .clear
    }
    let timePickerView = UIPickerView().then{
        $0.backgroundColor = .clear
    }
    let minutePickerView = UIPickerView().then{
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
        view.backgroundColor = .clear
        addView()
    }
    func addView(){
        addSubview(view)
        view.addSubview(ampmPickerView)
        view.addSubview(timePickerView)
        view.addSubview(minutePickerView)
        addSubview(timeLabel)
        addSubview(minuteLabel)
    }
    override func layoutSubviews(){
        super.layoutSubviews()
        view.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(ampmPickerView.snp.left)
            make.right.equalTo(minuteLabel)
            make.centerX.equalToSuperview()
        }
        ampmPickerView.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(frame.width/9.375)
        }
        timePickerView.snp.makeConstraints { (make) in
            make.left.equalTo(ampmPickerView.snp.right)
            make.top.bottom.equalTo(view)
            make.width.equalTo(frame.width/9.375)
        }
        minutePickerView.snp.makeConstraints { (make) in
            make.left.equalTo(timeLabel.snp.right)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(frame.width/9.375)
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
