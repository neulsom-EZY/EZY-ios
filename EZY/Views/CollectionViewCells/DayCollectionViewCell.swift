//
//  WhoShouldIAsk.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/12.
//

import UIKit

class DayCollectionViewCell : UICollectionViewCell{
    // MARK: - properties
    static let identifier = "WhoShouldIAskCell"
    
    private let cellBackgroundView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.applySketchShadow(color: UIColor.rgb(red: 235, green: 235, blue: 235), alpha: 1, x: 0, y: 0, blur: 6, spread: 0)
        $0.layer.cornerRadius = 5
    }
    
    private let dayKoreanLabel = UILabel().then{
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.rgb(red: 149, green: 149, blue: 149)
        $0.textAlignment = .center
    }
    
    private let dayEnglishLabel = UILabel().then{
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor.rgb(red: 149, green: 149, blue: 149)
        $0.textAlignment = .center
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(){
        addView()
        
        location()
    }
    
    func addView(){
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(dayKoreanLabel)
        cellBackgroundView.addSubview(dayEnglishLabel)
    }
    
    func location(){
        cellBackgroundView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        dayKoreanLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(contentView.frame.height/6.8)
        }
        
        dayEnglishLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(contentView.frame.width/6.8)
        }
    }
    
}
