//
//  WhoShouldIAsk.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/12.
//

import UIKit

class DayCollectionViewCell : UICollectionViewCell{
    // MARK: - properties
    static let identifier = "DayCollectionViewCell"
    
    var model: RepeatCollectionViewModal?
    
    private let cellBackgroundView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.applySketchShadow(color: UIColor.rgb(red: 225, green: 225, blue: 225), alpha: 1, x: 0, y: 0, blur: 9, spread: 0)
        $0.layer.cornerRadius = 5
        $0.layer.borderWidth = 0.7
    }
    
    let dayKoreanLabel = UILabel().then{
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.rgb(red: 149, green: 149, blue: 149)
        $0.textAlignment = .center
    }
    
    let dayEnglishLabel = UILabel().then{
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor.rgb(red: 100, green: 100, blue: 100)
        $0.textAlignment = .center
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: RepeatCollectionViewModal){
        self.model = model
        if model.isSelected == false{
            cellBackgroundView.layer.borderColor = UIColor.white.cgColor
        }else{
            cellBackgroundView.layer.borderColor = UIColor(red: 170/255, green: 187/255, blue: 255/255, alpha: 1).cgColor
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // 셀이 재사용되기 전에 셀의 속성을 초기화시켜준다.
        cellBackgroundView.layer.borderColor = UIColor.white.cgColor
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
            make.bottom.equalToSuperview().offset(-contentView.frame.width/6.8)
        }
    }
    
}
