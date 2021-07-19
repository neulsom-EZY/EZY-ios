//
//  SwitchBtn.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/01.
//

import UIKit
import SnapKit
import Then

protocol SwitchStateDelegate: class {
    func isOnValueChange(isOn: Bool)
}
class SwitchBtn : UIButton{
    
    lazy var backview = UIView().then{
        $0.backgroundColor = .EZY_AFADFF
    }
    func State(data: Bool?) {
        self.switchState = data!
    }
    lazy var titleBtnView  = UIView().then{
        $0.backgroundColor = .white
    }
    lazy var switchState : Bool = false
    weak var delegate: SwitchStateDelegate?

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

        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        animationstate()
    }
    func animationstate(){
        if (switchState)
        {
            animateOn()
            titleBtnView.backgroundColor = .EZY_AFADFF
            
        }else{
            animateOff()
            titleBtnView.backgroundColor = .clear
            titleBtnView.backgroundColor = .gray
        }
        switchState = !switchState

    }

    func animateOn(){
        self.titleBtnView.snp.makeConstraints { (make) in
            make.right.equalTo(self.backview.snp.right).offset(self.frame.height/12.98 * -1)
            make.height.equalTo(self.frame.height/1.18)
            make.centerY.equalTo(self.backview.snp.centerY)
            make.width.equalTo(self.titleBtnView.snp.height)
        }
        UIView.animate(withDuration: 5, animations: {
            self.titleBtnView.layoutIfNeeded()
        })
    }
    func animateOff(){
        backview.backgroundColor = .EZY_CACACA
        self.titleBtnView.snp.makeConstraints { (make) in
            make.left.equalTo(self.backview.snp.left).offset(self.frame.height/12.98)
            make.height.equalTo(self.frame.height/1.18)
            make.centerY.equalTo(self.backview.snp.centerY)
            make.width.equalTo(self.titleBtnView.snp.height)
        }
        UIView.animate(withDuration: 5, animations: {
            self.titleBtnView.layoutIfNeeded()
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
