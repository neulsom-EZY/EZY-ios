//
//  TableViewHeaderView.swift
//  EZY
//
//  Created by 김유진 on 2021/11/30.
//

import UIKit

class TableViewHeaderView: UIView {
    // MARK: - Properties
    private let headerView = UIView().then{
        $0.layer.applySketchShadow(x: 0, y: 3, blur: 10)
        $0.layer.cornerRadius = 5
    }
    
    private let titleLabel = UILabel().then{
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI(){
        self.backgroundColor = .white
        
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [headerView].forEach { self.addSubview($0) }
        [titleLabel].forEach { headerView.addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    // MARK: - dataSetting
    func dataSetting(titleText: String, titleColor: UIColor){
        titleLabel.text = titleText
        titleLabel.textColor = titleColor
        
        headerView.snp.makeConstraints { make in
            make.width.equalTo(titleText.size(withAttributes:[NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)]).width + 25)
            make.height.equalToSuperview().dividedBy(1.69)
            make.left.equalToSuperview().dividedBy(13.39)
            make.centerY.equalToSuperview()
        }
    }
}
