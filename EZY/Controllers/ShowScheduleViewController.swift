//
//  ShowScheduleViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/05/30.
//

import UIKit
import SnapKit
import Then

class ShowScheduleViewController: UIViewController{
    
    //MARK: Properties
    private lazy var ScheduleTypeCollectionMainView = ScheduleTypeCollectionView.init(frame: self.view.frame)
    
    private lazy var ScheduleTimeTableMainView = ScheduleTimeTableView.init(frame: self.view.frame)
    
    var groupNameArray: [String] = ["NEULSOM", "공부", "산책", "심부름", "NEULSOM", "공부", "산책", "심부름"]
    let titleArray: [String] = ["EZY 회의", "디자인 이론 공부", "강아지 산책시키기", "카페에서 마카롱 사오기", "EZY 회의", "디자인 이론 공부", "강아지 산책시키기", "카페에서 마카롱 사오기"]
    let planTimeArray: [String] = ["12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00"]
    
    let scheduleTypesArray = ["나의 할 일","우리의 할 일","심부름","문의하기"]
    let icon = [UIImage(named: "EZY_MyJob"), UIImage(named: "EZY_OurJob"), UIImage(named: "EZY_Errand"), UIImage(named: "EZY_Errand")]
    
    lazy var userName = "Y00ujin"
    
    var purpleColor: UIColor! = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    var orangeColor: UIColor! = UIColor(red: 255/255, green: 166/255, blue: 128/255, alpha: 1)
    var yellowColor: UIColor! = UIColor(red: 255/255, green: 209/255, blue: 141/255, alpha: 1)
    var greenColor: UIColor! = UIColor(red: 184/255, green: 128/255, blue: 255/255, alpha: 1)
    
    lazy var EZYPlanBackgroundColor: [UIColor] = [purpleColor, orangeColor, yellowColor, greenColor, purpleColor, orangeColor, yellowColor, greenColor]
    
    lazy var badgeView = UIView().then {
        $0.backgroundColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
    }
    
    lazy var notificationButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_Notification"), for: .normal)
    }

    lazy var questionTopLabel = UILabel().then {
        $0.text = "\(userName)님,"
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 154/255, green: 161/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 28, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var questionMiddleLabel = UILabel().then{
        $0.text = "오늘은 어떤 하루를"
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 154/255, green: 161/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Bold")

    }
    
    lazy var questionBottomLabel = UILabel().then{
        $0.text = "보내실 건가요?"
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 154/255, green: 161/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var EZYLISTTitleLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "EZYLIST"
        $0.dynamicFont(fontSize: 12, currentFontName: "Poppins-Bold")
    }
    
    var EZYPlanAddButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_PlanAddButton"), for: .normal)
    }
    
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        ScheduleTypeCollectionMainView.collectionView.register(ScheduleTypeCollectionViewCell.self, forCellWithReuseIdentifier: ScheduleTypeCollectionViewCell.ScheduleTypeCollectionViewIdentifier)
        ScheduleTimeTableMainView.tableView.register(ScheduleTimeTableViewCell.self, forCellReuseIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier)
        
        notificationButton.addTarget(self, action: #selector(didBnotificationButtonClick), for: .touchUpInside)

        ScheduleTypeCollectionMainView.collectionView.delegate = self
        ScheduleTypeCollectionMainView.collectionView.dataSource = self
        
        ScheduleTimeTableMainView.tableView.dataSource = self
        ScheduleTimeTableMainView.tableView.delegate = self
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        badgeView.layer.cornerRadius = badgeView.bounds.width/2
        badgeView.isHidden = true
        
        
    }
    
    @objc func didBnotificationButtonClick(sender: UIButton!) {
        let pushVC = NotificationViewController()
        
//        pushVC.titleLabel.text = titleArray[indexPath.row]
        
        self.navigationController?.pushViewController(pushVC, animated: true)
        
    }
    
    func configureUI(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(ScheduleTypeCollectionMainView)
        self.view.addSubview(questionTopLabel)
        self.view.addSubview(questionMiddleLabel)
        self.view.addSubview(questionBottomLabel)
        self.view.addSubview(notificationButton)
        self.view.addSubview(EZYLISTTitleLabel)
        self.view.addSubview(EZYPlanAddButton)
        notificationButton.addSubview(badgeView)
        
        self.view.addSubview(ScheduleTimeTableMainView)
        
        ScheduleTimeTableMainView.snp.makeConstraints { make in
            ScheduleTimeTableMainView.backgroundColor = .clear
            make.top.equalTo(EZYLISTTitleLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        badgeView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.right.equalToSuperview().offset(-3)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(badgeView.snp.width)
        }
        
        notificationButton.snp.makeConstraints { make in
            make.top.equalTo(questionTopLabel)
            make.right.equalToSuperview().offset(-26.8)
            make.width.equalToSuperview().dividedBy(31.2/2)
            make.height.equalToSuperview().dividedBy(54.1/2)
        }
        
        questionTopLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/12.9)
            make.top.equalToSuperview().offset(self.view.frame.height/12)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        questionMiddleLabel.snp.makeConstraints { make in
            make.top.equalTo(questionTopLabel.snp.bottom)
            make.left.equalTo(questionTopLabel)
        }
        
        questionBottomLabel.snp.makeConstraints { make in
            make.top.equalTo(questionMiddleLabel.snp.bottom)
            make.left.equalTo(questionMiddleLabel)
        }
        
        EZYLISTTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(29)
            make.top.equalTo(ScheduleTypeCollectionMainView.collectionView.snp.bottom).offset(9)
        }
        
        EZYPlanAddButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(29)
            make.top.equalTo(ScheduleTypeCollectionMainView.collectionView.snp.bottom).offset(9)
        }
        
        ScheduleTypeCollectionMainView.collectionView.snp.makeConstraints { make in
            make.top.equalTo(questionBottomLabel.snp.bottom)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
        }
        
        ScheduleTimeTableMainView.tableView.snp.makeConstraints { make in
            make.top.equalTo(ScheduleTimeTableMainView).offset(self.view.frame.height/36)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        
        
        let attributedString = NSMutableAttributedString(string: EZYLISTTitleLabel.text!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(3.0), range: NSRange(location: 0, length: attributedString.length))
        EZYLISTTitleLabel.attributedText = attributedString
    }
}

extension ShowScheduleViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.width / 3.45, height: (self.view.frame.width / 3)/0.95)
    }
    
    //MARK: collectionView - left Padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    //MARK: collectionView - cell 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
}

extension ShowScheduleViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scheduleTypesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                ScheduleTypeCollectionViewCell.ScheduleTypeCollectionViewIdentifier, for: indexPath) as? ScheduleTypeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        cell.label.text = scheduleTypesArray[indexPath.row]
        cell.icon.image = icon[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
}

extension ShowScheduleViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier, for: indexPath) as! ScheduleTimeTableViewCell
        
        cell.groupNameLabel.text = groupNameArray[indexPath.row]
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.planTimeLabel.text = planTimeArray[indexPath.row]
        
        cell.EZYLISTCellLeftDecorationView.backgroundColor = EZYPlanBackgroundColor[indexPath.row]
        cell.titleLabel.textColor = EZYPlanBackgroundColor[indexPath.row]
        cell.groupNameLabel.textColor = EZYPlanBackgroundColor[indexPath.row]
        
        print("tableView - cellForRowAt")
        print(indexPath.row)
        print(cell.titleLabel.text ?? "")
        
        cell.backgroundColor = .clear
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/8
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 0
    }

}

extension ShowScheduleViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView - didSelectRowAt")
        var cell = tableView.cellForRow(at: indexPath)
        print(indexPath.row)
        print(titleArray[indexPath.row])
        
//        let pushVC = NextViewController()
        
//        pushVC.titleLabel.text = titleArray[indexPath.row]
        
//        self.navigationController?.pushViewController(pushVC, animated: true)
    }

    
}

extension UILabel {
    func dynamicFont(fontSize size: CGFloat, currentFontName: String) {
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height
    
    switch height {
    case 480.0: //Iphone 3,4S => 3.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.7)
      break
    case 568.0: //iphone 5, SE => 4 inch
        self.font = UIFont(name: currentFontName, size: size * 0.8)
      break
    case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
        self.font = UIFont(name: currentFontName, size: size * 0.92)
      break
    case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.95)
      break
    case 812.0: //iphone X, XS => 5.8 inch
        self.font = UIFont(name: currentFontName, size: size)
      break
    case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
        self.font = UIFont(name: currentFontName, size: size * 1.15)
      break
    case 926.0: //iphone 12 Pro Max
        self.font = UIFont(name:currentFontName, size: size * 1.18)
    default:
      print("not an iPhone")
      break
    }
  }
}

extension UIButton {
    func dynamicFont(fontSize size: CGFloat, currentFontName: String) {
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0: //Iphone 3,4S => 3.5 inch
            self.titleLabel!.font = UIFont(name: currentFontName, size: size * 0.7)
          break
        case 568.0: //iphone 5, SE => 4 inch
            self.titleLabel!.font = UIFont(name: currentFontName, size: size * 0.8)
          break
        case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
            self.titleLabel!.font = UIFont(name: currentFontName, size: size * 0.92)
          break
        case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
            self.titleLabel!.font = UIFont(name: currentFontName, size: size * 0.95)
          break
        case 812.0: //iphone X, XS => 5.8 inch
            self.titleLabel!.font = UIFont(name: currentFontName, size: size * size)
          break
        case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
            self.titleLabel!.font = UIFont(name: currentFontName, size: size * 1.15)
          break
        case 926.0: //iphone 12 Pro Max
            self.titleLabel!.font = UIFont(name: currentFontName, size: size * 1.18)
        default:
          print("not an iPhone")
          break
        }
    }
}

extension UITextField {
    func dynamicFont(fontSize size: CGFloat, currentFontName: String) {
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height

    switch height {
    case 480.0: //Iphone 3,4S => 3.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.7)
      break
    case 568.0: //iphone 5, SE => 4 inch
        self.font = UIFont(name: currentFontName, size: size * 0.8)
      break
    case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
        self.font = UIFont(name: currentFontName, size: size * 0.92)
      break
    case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.95)
      break
    case 812.0: //iphone X, XS => 5.8 inch
        self.font = UIFont(name: currentFontName, size: size)
      break
    case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
        self.font = UIFont(name: currentFontName, size: size * 1.15)
      break
    case 926.0: //iphone 12 Pro Max
        self.font = UIFont(name:currentFontName, size: size * 1.18)
    default:
      print("not an iPhone")
      break
    }
  }
}
