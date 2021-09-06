//
//  searchResultsView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/09.
//

import UIKit

class SearchResultsView: UIView {
    lazy var searchResultsBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.9
        $0.layer.shadowRadius = 7
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
    }
    
    func searchResultDataSetting(){
        
    }
    
    func searchResultLayoutSetting(screenHeight: Double, screenWeight: Double, textfieldBackground: UIView){
        searchResultsBackgroundView.snp.makeConstraints { make in
            make.centerX.equalTo(textfieldBackground)
            make.width.equalTo(textfieldBackground)
            make.height.equalTo(100)
            make.top.equalTo(textfieldBackground.snp.bottom).offset(10)
        }
    }
}
