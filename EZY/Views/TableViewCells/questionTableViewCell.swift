//
//  questionTableViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/07/09.
//

import UIKit

class questionTableViewCell: UITableViewCell {
    // MARK: - Properties
    static let reuseId = "\(questionTableViewCell.self)"
    
    private let viewBounds = UIScreen.main.bounds
    
    private let questionCircleBackgroundView = UIView().then{
        $0.backgroundColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
    }
    
    private let questionLogoLabel = UILabel().then {
        $0.text = "Q"
        $0.dynamicFont(fontSize: 12, currentFontName: "Poppins-Bold")
        $0.textColor = UIColor.white
    }
    
    private let qnaBackgroundView = UIView().then{
        $0.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        $0.layer.cornerRadius = 3
    }
    
    let titleTextView = UITextView().then {
        $0.text = "아이디는 어디서 변경할 수 있나요?"
        $0.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
        $0.isScrollEnabled = false
        $0.isEditable = false
        $0.isSelectable = false
    }
    
    let contentTextView = UITextView().then {
        $0.text = "아이디는 설정 > 아이디 변경 창에서 변경할 수 있습니다."
        $0.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 121/255)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.isEditable = false
        $0.isSelectable = false
    }

    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()

        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI(){
        addView()
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [questionCircleBackgroundView, qnaBackgroundView, titleTextView].forEach { contentView.addSubview($0) }
        [contentTextView].forEach { qnaBackgroundView.addSubview($0) }
        [questionLogoLabel].forEach { questionCircleBackgroundView.addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        questionCircleBackgroundView.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.width.equalToSuperview().dividedBy(13)
            make.height.equalTo(contentView.snp.width).dividedBy(13)
            questionCircleBackgroundView.layer.cornerRadius = (contentView.frame.width/13)/2
        }
        questionLogoLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        titleTextView.snp.makeConstraints { make in
            make.centerY.equalTo(questionCircleBackgroundView).offset(-viewBounds.height/320)
            make.height.equalTo(questionCircleBackgroundView)
            make.left.equalTo(questionCircleBackgroundView.snp.right).offset(viewBounds.width/50)
        }
        qnaBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(questionCircleBackgroundView)
            make.centerX.equalToSuperview()
            make.height.equalTo(contentTextView).multipliedBy(1.2)
            make.top.equalTo(questionCircleBackgroundView.snp.bottom).offset(viewBounds.height/80)
        }
        contentTextView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(viewBounds.width/50)
            make.centerY.equalToSuperview()
        }
    }
}
