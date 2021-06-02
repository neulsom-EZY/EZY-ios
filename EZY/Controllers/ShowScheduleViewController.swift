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
    var schedulebyTypeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 17, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    
    let scheduleTypesArray = ["나의 할 일","우리의 할 일","심부름","문의하기"]
    let icon = [UIImage(named: "EZY_MyJob"), UIImage(named: "EZY_OurJob"), UIImage(named: "EZY_Errand"), UIImage(named: "EZY_Errand")]
    
    lazy var userName = "Y00ujin"
    
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
    
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        schedulebyTypeCollectionView.register(ScheduleTypeCollectionViewCell.self, forCellWithReuseIdentifier: ScheduleTypeCollectionViewCell.Identifier)

        schedulebyTypeCollectionView.delegate = self
        schedulebyTypeCollectionView.dataSource = self
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        badgeView.layer.cornerRadius = badgeView.bounds.width/2
        badgeView.isHidden = true
    }
    
    func configureUI(){
        self.view.backgroundColor = .white
    
        self.view.addSubview(schedulebyTypeCollectionView)
        self.view.addSubview(questionTopLabel)
        self.view.addSubview(questionMiddleLabel)
        self.view.addSubview(questionBottomLabel)
        self.view.addSubview(notificationButton)
        notificationButton.addSubview(badgeView)
        
        schedulebyTypeCollectionView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(5)
            make.width.equalToSuperview()
            make.top.equalTo(questionBottomLabel.snp.bottom).offset(17)
            make.centerX.equalToSuperview()
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
            make.left.equalToSuperview().offset(29)
            make.top.equalToSuperview().offset(76)
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
                                                                ScheduleTypeCollectionViewCell.Identifier, for: indexPath) as? ScheduleTypeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.label.text = scheduleTypesArray[indexPath.row]
        cell.icon.image = icon[indexPath.row]
        cell.backgroundColor = .clear
        return cell
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
    default:
      print("not an iPhone")
      break
    }
  }
}
