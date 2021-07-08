//
//  SelectLocationViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/08.
//

import UIKit

class SelectLocationViewController: UIViewController {
    
    lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_LocationBackButton"), for: .normal)
    }
    
    lazy var textFieldBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    lazy var locationTextField = UITextField().then {
        $0.placeholder = "광주소프트웨어마이스터고등학교"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        layoutSetting()
    }
    
    func layoutSetting(){
        self.view.addSubview(backButton)
        self.view.addSubview(textFieldBackgroundView)
        textFieldBackgroundView.addSubview(locationTextField)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/30)
            make.left.equalToSuperview().offset(self.view.frame.height/30)
            make.height.equalToSuperview().dividedBy(33.8)
            make.width.equalTo(backButton.snp.height)
        }
        
        textFieldBackgroundView.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(21.3)
            make.width.equalToSuperview().dividedBy(1.5)
        }
        locationTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.09)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview()
        }
    }

}
