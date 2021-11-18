//
//  NotificationTableViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/04.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let NotificationTableViewIdentifier = "\(NotificationTableViewCell.self)"
    
    private let logoCircleBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    private let cellBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.9
        $0.layer.shadowRadius = 7
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
    }
    
     let scheduleTypeLabel = UILabel().then {
        $0.text = "개인일정"
        $0.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-Light")
    }

    let notificationContentLabel = UILabel().then {
        $0.text = "지환님이 심부름 일정 변경을 요청했어요. \n확인해볼까요?"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "Poppins-SemiBold")
        $0.numberOfLines = 2
    }
    
    let afterNotificationTimeLabel = UILabel().then {
        $0.text = "12분 전"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Light")
        $0.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
    }
    
    private let scheduleImageByTypeImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_Errand")
    }
    
    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureUI()
    }

    // MARK: - setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        configureUI()
    }
    
    // MARK: - configureUI
    private func configureUI(){
        addView()
        
        location()
    }
    
    // MARK: - addView
    private func addView(){
        contentView.addSubview(cellBackgroundView)
        [scheduleTypeLabel, notificationContentLabel, afterNotificationTimeLabel, logoCircleBackgroundView].forEach { cellBackgroundView.addSubview($0) }
        logoCircleBackgroundView.addSubview(scheduleImageByTypeImageView)
    }
    
    // MARK: - location
    private func location(){
        cellBackgroundView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(1.18)
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(contentView.frame.width/13.3)
        }
        
        logoCircleBackgroundView.snp.makeConstraints { make in
            make.width.equalTo(logoCircleBackgroundView.snp.height)
            make.height.equalToSuperview().dividedBy(2.4)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(contentView.frame.width/20)
            
            logoCircleBackgroundView.layer.cornerRadius = ((contentView.frame.height/1.18)/2.4)/2
        }
        
        scheduleImageByTypeImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.1)
        }
        
        afterNotificationTimeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(contentView.frame.height/4)
            make.right.equalToSuperview().offset(-contentView.frame.height/6)
        }
        
        scheduleTypeLabel.snp.makeConstraints { make in
            make.left.equalTo(logoCircleBackgroundView.snp.right).offset(contentView.frame.width/20)
            make.top.equalToSuperview().offset(contentView.frame.height/2.7)
        }
        
        notificationContentLabel.snp.makeConstraints { make in
            make.top.equalTo(scheduleTypeLabel.snp.bottom)
            make.left.equalTo(scheduleTypeLabel)
        }
    }
}
