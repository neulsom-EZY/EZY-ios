//
//  SwitchButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/11.
//

import UIKit
import SnapKit

protocol SwitchButtonDelegate: class {
    func isOnValueChange(isOn: Bool)
}

class SwitchButton : UIButton{
    typealias SwitchColor = (bar: UIColor, circle: UIColor)
    
    private var barView = UIView()
    private var circleView = UIView()
    weak var delegate: SwitchStateDelegate?

    var isOn: Bool = false {
        didSet {
            self.changeState()
        }
    }
    
    var onColor : SwitchColor = (UIColor.EZY_AFADFF,UIColor.white){
        didSet{
            barView.backgroundColor = onColor.bar
            circleView.backgroundColor = onColor.circle
        }
    }
    var offColor : SwitchColor = (UIColor.EZY_DEDEDE,UIColor.white){
        didSet{
            barView.backgroundColor = offColor.bar
            circleView.backgroundColor = offColor.circle
        }
    }
 
    // 스위치가 이동하는 애니메이션 시간
    var animationDuration: TimeInterval = 0.2

    // 스위치 isOn 값 변경 시 애니메이션 여부
    private var isAnimated: Bool = false

    // barView의 상, 하단 마진 값
    var barViewTopBottomMargin: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.buttonInit(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.buttonInit(frame: frame)
    }

    private func buttonInit(frame: CGRect) {

        let barViewHeight = frame.height - (barViewTopBottomMargin * 0.25)

        barView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        barView.backgroundColor = self.offColor.bar
        barView.layer.masksToBounds = true
        barView.layer.cornerRadius = barViewHeight / 2

        self.addSubview(barView)

        circleView = UIView(frame: CGRect(x: 0, y: 0, width: frame.height , height: frame.height ))
        circleView.backgroundColor = self.offColor.circle
        circleView.layer.masksToBounds = true
        circleView.layer.cornerRadius = frame.height / 2

        self.addSubview(circleView)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.setOn(on: !self.isOn, animated: true)
    }

    func setOn(on: Bool, animated: Bool) {
        self.isAnimated = animated
        self.isOn = on
    }

    private func changeState() {

        var circleCenter: CGFloat = 100
        var barViewColor: UIColor = .clear
        var circleViewColor: UIColor = .clear

        if self.isOn {
            circleCenter = self.frame.width - (self.circleView.frame.width / 2)
            barViewColor = self.onColor.bar
            circleViewColor = self.onColor.circle
        } else {
            circleCenter = self.circleView.frame.width / 2
            barViewColor = self.offColor.bar
            circleViewColor = self.offColor.circle
        }

        let duration = self.isAnimated ? self.animationDuration : 0

        UIView.animate(withDuration: duration, animations: { [weak self] in
            guard let self = self else { return }

            self.circleView.center.x = circleCenter
            self.barView.backgroundColor = barViewColor
            self.circleView.backgroundColor = circleViewColor

        }) { [weak self] _ in
            guard let self = self else { return }

            self.delegate?.isOnValueChange(isOn: self.isOn)
            self.isAnimated = false
        }
    }
}


