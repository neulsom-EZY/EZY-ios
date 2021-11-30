//
//  ListTableViewHeaderView.swift
//  
//
//  Created by 김유진 on 2021/11/30.
//

import UIKit

class ListTableViewHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    static let identifier = "ListTableViewHeaderView"
    
    private let viewBounds = UIScreen.main.bounds
    
    private let headerView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.applySketchShadow(x: 0, y: 3, blur: 10)
        $0.layer.cornerRadius = 5
    }
    
    var titleLabel = UILabel().then{
        $0.text = "태그 이름"
        $0.textColor = .black
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
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
        headerView.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalToSuperview().dividedBy(1.69)
            make.left.equalToSuperview().dividedBy(13.39)
            make.centerY.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }

    // MARK: - dataSetting
    func dataSetting(titleText: String, titleColor: UIColor){
        titleLabel.text = titleText
        titleLabel.textColor = titleColor
        
        [headerView].forEach { self.addSubview($0) }
        [titleLabel].forEach { headerView.addSubview($0) }

        headerView.snp.remakeConstraints { make in
            make.width.equalTo(titleText.size(withAttributes:[NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)]).width + 25)
            make.height.equalToSuperview().multipliedBy(1.2)
            make.left.equalToSuperview().offset(viewBounds.width/13.39)
            make.top.equalToSuperview()
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
