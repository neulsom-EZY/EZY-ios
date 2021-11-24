//
//  NoPlaceView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/20.
//

import UIKit
class NoPlace : UIView{
    
    private let iv = UIImageView().then{
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "EZY_NotificationNoImage")
    }
    let title = UILabel().then{
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .black
    }
    let noSearchingText = UILabel().then{
        $0.text = "에 대한 검색결과가 없습니다."
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .black
    }
    private let explain = UILabel().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
        $0.text = "다시 검색해보세요!"
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        [iv,title,noSearchingText,explain].forEach{ addSubview($0)}
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iv.snp.makeConstraints{
            $0.top.left.right.equalToSuperview()
        }
        title.snp.makeConstraints{
            $0.top.equalTo(iv.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
        }
        noSearchingText.snp.makeConstraints{
            $0.top.equalTo(title.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        explain.snp.makeConstraints{
            $0.top.equalTo(noSearchingText.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
