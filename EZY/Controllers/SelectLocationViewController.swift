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
    
    lazy var locationHalfModalView = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 50, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner]) // 그림자 코드 뒤에 넣으면 그림자가 안먹음
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 20
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1).cgColor
    }
    
    lazy var locationTableView = UITableView().then {
        $0.backgroundColor = .yellow
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        layoutSetting()
    }
    
    func layoutSetting(){
        self.view.addSubview(backButton)
        self.view.addSubview(textFieldBackgroundView)
        self.view.addSubview(locationHalfModalView)
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
            make.width.equalToSuperview().dividedBy(1.19)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        locationHalfModalView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
        }
    }

}
