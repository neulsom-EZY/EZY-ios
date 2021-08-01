//
//  questionTableViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/07/09.
//

import UIKit

class questionTableViewCell: UITableViewCell {
    
    static let reuseId = "\(questionTableViewCell.self)"
    
    lazy var questionCircleBackgroundView = UIView().then{
        $0.backgroundColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
    }
    
    lazy var questionLogoLabel = UILabel().then {
        $0.text = "Q"
        $0.dynamicFont(fontSize: 12, currentFontName: "Poppins-Bold")
        $0.textColor = UIColor.white
    }
    
    lazy var qnaBackgroundView = UIView().then{
        $0.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        $0.layer.cornerRadius = 3
    }
    
    lazy var answerIconImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_QuestionArrow")
    }
    
    lazy var titleTextView = UITextView().then {
        $0.text = "아이디는 어디서 변경할 수 있나요?"
        $0.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
        $0.isScrollEnabled = false
        $0.isEditable = false
        $0.isSelectable = false
    }
    
    lazy var contentTextView = UITextView().then {
        $0.text = "아이디는 설정 > 아이디 변경 창에서 변경할 수 있습니다."
        $0.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 121/255)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.isEditable = false
        $0.isSelectable = false
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        layoutSetting()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        layoutSetting()
    }
    
    func layoutSetting(){
        contentView.addSubview(questionCircleBackgroundView)
        contentView.addSubview(qnaBackgroundView)
        contentView.addSubview(titleTextView)
        qnaBackgroundView.addSubview(answerIconImageView)
        questionCircleBackgroundView.addSubview(questionLogoLabel)
        qnaBackgroundView.addSubview(contentTextView)
        
        questionCircleBackgroundView.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.width.equalToSuperview().dividedBy(13)
            make.height.equalTo(questionCircleBackgroundView.snp.width)
            
            questionCircleBackgroundView.layer.cornerRadius = (contentView.frame.width/13)/2
        }
        
        questionLogoLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        titleTextView.snp.makeConstraints { make in
            make.left.equalTo(questionCircleBackgroundView.snp.right).offset(contentView.frame.width/44.5)
            make.centerY.equalTo(questionCircleBackgroundView)
            make.height.equalTo(questionCircleBackgroundView)
            make.right.equalToSuperview()
        }
        
        contentTextView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.contentView.frame.height/8)
            make.centerY.equalToSuperview()
            
        }
        
        qnaBackgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(questionCircleBackgroundView.snp.bottom).offset(contentView.frame.height/11.5)
            make.height.equalTo(contentTextView).multipliedBy(1.2)
            make.centerX.equalToSuperview()
        }

    }

}
