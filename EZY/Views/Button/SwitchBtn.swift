//
//  SwitchBtn.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/01.
//

import UIKit
import SnapKit
import Then


class SwitchBtn : UIButton{
    
    lazy var backview = UIView().then{
        $0.backgroundColor = .EZY_968DFF
    }
    func State(data: Bool?) {
        self.switchState = data!
    }
    lazy var titleBtnView  = UIView().then{
        $0.backgroundColor = .white
    }
    var switchState : Bool = false
    weak var delegate: SwitchStateDelegate?
    var switchStateArray: [Bool] = [false, false]

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    func configureUI(){
        addSubview(backview)
        backview.addSubview(titleBtnView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backview.isUserInteractionEnabled = false
        backview.layer.cornerRadius = frame.height/2
        titleBtnView.layer.cornerRadius = titleBtnView.frame.height/2
        backview.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        self.titleBtnView.snp.makeConstraints { (make) in
            make.right.equalTo(self.backview.snp.right).offset(self.frame.height/12.98 * -1)
            make.height.equalTo(frame.height/1.18)
            make.centerY.equalTo(self.backview.snp.centerY)
            make.width.equalTo(self.titleBtnView.snp.height)
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        animationstate()
    }
    func animationstate(){
        if (switchState){
            animateOn()
        }else{
            animateOff()
        }
        switchState = !switchState

    }

    func animateOn(){
        UIView.animate(withDuration: 0.25, animations: {[weak self] in
            guard let self = self else {return}
            self.backview.backgroundColor = .EZY_968DFF
            self.titleBtnView.center.x = self.frame.width - (self.titleBtnView.frame.width / 2) - self.backview.frame.height/12.98
        }){ [weak self] _ in
            guard let self = self else {return}
            self.delegate?.isOnValueChange(isOn: self.switchState)
        }
    }
    
    func animateOff(){
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            guard let self = self else {return}
            self.backview.backgroundColor = .EZY_DEDEDE
            self.titleBtnView.center.x = self.titleBtnView.frame.width/2 + self.backview.frame.height/12.98
        }){ [weak self] _ in
            guard let self = self else {return}
            self.delegate?.isOnValueChange(isOn: self.switchState)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
