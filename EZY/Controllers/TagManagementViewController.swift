//
//  TagManagementViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/22.
//

import UIKit

class TagManagementViewController: UIViewController {
    
    lazy var backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_IdChangeBackButtonImage"), for: .normal)
    }
    
    lazy var mainTitleLabel = UILabel().then {
        $0.text = "태그 관리"
        $0.textColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "Poppins-SemiBold")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSetting()
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    func layoutSetting(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(backButton)
        self.view.addSubview(mainTitleLabel)
        
        backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/50)
        }
    }

}
