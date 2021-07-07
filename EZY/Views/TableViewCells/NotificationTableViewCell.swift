//
//  NotificationTableViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/04.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    //MARK: Properties
    static let NotificationTableViewIdentifier = "\(NotificationTableViewCell.self)"
    
    lazy var logoCircleImageView = UIImageView().then {
        $0.self.image? = UIImage(named: "EZY_MyJob")!
    }
    
    lazy var cellBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.9
        $0.layer.shadowRadius = 7
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
    }
    
    lazy var scheduleTypeLabel = UILabel().then {
        $0.text = "개인일정"
        $0.textColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 8, currentFontName: "Poppins-SemiBold")
    }

    lazy var notificationContentLabel = UILabel().then {
        $0.text = "지환님이 심부름 일정 변경을 요청했어요. \n확인해볼까요?"
        $0.textColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "Poppins-SemiBold")
        $0.numberOfLines = 2
    }
    
    lazy var afterNotificationTimeLabel = UILabel().then {
        $0.text = "12분 전"
        $0.dynamicFont(fontSize: 10, currentFontName: "Poppins-Light")
        $0.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
    }
    
    lazy var scheduleImageByTypeImageView = UIImageView().then {
        $0.self.image? = UIImage(named: "EZY_MyJob")!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        configureUI()
    }
    
    private func configureUI(){
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(scheduleTypeLabel)
        cellBackgroundView.addSubview(notificationContentLabel)
        cellBackgroundView.addSubview(afterNotificationTimeLabel)
        cellBackgroundView.addSubview(logoCircleImageView)
        logoCircleImageView.addSubview(scheduleImageByTypeImageView)
        
        cellBackgroundView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(contentView.frame.width/13.3)
        }
        
        logoCircleImageView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(9.9)
            make.height.equalTo(logoCircleImageView.snp.width)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(contentView.frame.width/20)
        }
        
        scheduleImageByTypeImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2.1)
            make.width.equalTo(scheduleImageByTypeImageView.snp.height)
        }
        
        afterNotificationTimeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(contentView.frame.height/4)
            make.right.equalToSuperview().offset(-contentView.frame.height/6)
        }
        
        scheduleTypeLabel.snp.makeConstraints { make in
            make.left.equalTo(logoCircleImageView.snp.right).offset(contentView.frame.width/20)
            make.top.equalToSuperview().offset(contentView.frame.height/2.7)
        }
        
        notificationContentLabel.snp.makeConstraints { make in
            make.top.equalTo(scheduleTypeLabel.snp.bottom)
            make.left.equalTo(scheduleTypeLabel)
        }
        
        logoCircleImageView.layer.cornerRadius = (cellBackgroundView.frame.width/9.9)/2
        logoCircleImageView.clipsToBounds = true
        
    }

}
