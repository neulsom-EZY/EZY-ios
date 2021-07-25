//
//  RescheduleViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/19.
//

import UIKit

class PersonalPlanChangeViewController: UIViewController {
    
    lazy var calendarViewButton = WhiteBackgroundView()
    
    lazy var timeViewButton = WhiteBackgroundView()
    
    lazy var locationViewButton = WhiteBackgroundView()
    
    lazy var tagAddModalView = TagAddModalView()
    
    lazy var selectCalendarModalView = SelectCalendarModalView()
    
    lazy var selectTimeModalView = SelectTimeModalView()
    
    var isChecked: [Bool] = [true, false, false, false]
    
    var RepeatModels: [RepeatCollectionViewModel] = [RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: false),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: false),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: false),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: false),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: false),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: false),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: false)]
    
    var TagColorModels: [TagColorCollectionViewModel] = [TagColorCollectionViewModel(backgroundColor: UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: false),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 196/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 206/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 216/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 226/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 236/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 246/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 190/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 180/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 170/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 160/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 150/255, blue: 255/255, alpha: 1), isSelected: true)]
    
    var TagModels: [TagCollectionViewModel] = [TagCollectionViewModel(backgroundColor: UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                               TagCollectionViewModel(backgroundColor: UIColor(red: 196/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                               TagCollectionViewModel(backgroundColor: UIColor(red: 206/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: false),
                                               TagCollectionViewModel(backgroundColor: UIColor(red: 216/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                               TagCollectionViewModel(backgroundColor: UIColor(red: 226/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                               TagCollectionViewModel(backgroundColor: UIColor(red: 236/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                               TagCollectionViewModel(backgroundColor: UIColor(red: 246/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                               TagCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
                                               TagCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 190/255, blue: 255/255, alpha: 1), isSelected: true),
                                               TagCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 180/255, blue: 255/255, alpha: 1), isSelected: true),
                                               TagCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 170/255, blue: 255/255, alpha: 1), isSelected: true),
                                               TagCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 160/255, blue: 255/255, alpha: 1), isSelected: true),
                                               TagCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 150/255, blue: 255/255, alpha: 1), isSelected: true)]
    
    lazy var tagButton: [UIButton] = [tagStudyButton, tagWalkButton, tagMajorBandButton, tagFreedomBandButton]
    
    var tagColorPreciousSelectedIndex = 0
    
    var tagPreciousSelectedIndex = 2
    
    var tagNameTextArray = ["공부", "산책", "토익", "코딩", "요리", "운동", "정리", "청소","공부", "산책", "토익", "코딩", "요리", "운동", "정리", "청소","공부", "산책", "토익", "코딩", "요리", "운동", "정리", "청소","공부", "산책", "토익", "코딩", "요리", "운동", "정리", "청소"]
    
    var dayArray = ["24","25","26","27","28","29","30","1","2","3","24","25","26","27","28","29","30","1","2","3"]
    
    var dayOfTheWeekArray = ["S","M","T","W","T","F","S","S","M","T","S","M","T","W","T","F","S","S","M","T"]
    
    var RepeatDayOfTheWeekArray = ["S","M", "T","W","T","F","S"]
    
    let calendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CalendarViewLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    
    let tagColorCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CalendarViewLayout()).then {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 30, height: 30)
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .white
    }
    
    let repeatCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 30, height: 30)
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .white
    }
    
    let tagCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .white
    }
    
    let startTimeTableView = UITableView().then{
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
    }
    
    let endTimeTableView = UITableView().then{
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
    }
    
    lazy var titleBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 244/255, green: 246/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "제목"
        $0.textColor = UIColor(red: 128/255, green: 153/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var titleTextField = UITextField().then {
        $0.text = "강아지 산책 시키기"
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var calendarLabelButton = UIButton().then {
        $0.setTitle("2021. 05. 09 화요일", for: .normal)
        $0.setTitleColor(UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1), for: .normal)
        $0.dynamicFont(fontSize: 16, currentFontName: "Poppins-Regular")
    }
    
    lazy var timeLabelButton = UIButton().then {
        $0.setTitle("11:00AM - 1:00PM", for: .normal)
        $0.setTitleColor(UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1), for: .normal)
        $0.dynamicFont(fontSize: 16, currentFontName: "Poppins-Regular")
    }
    
    lazy var locationLabelButton = UIButton().then {
        $0.setTitle("송정역 이디야 카페", for: .normal)
        $0.setTitleColor(UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1), for: .normal)
        $0.dynamicFont(fontSize: 16, currentFontName: "Poppins-Regular")
    }
    
    lazy var explanationBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 246/255, green: 243/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    
    lazy var explanationTitleLabel = UILabel().then {
        $0.text = "설명"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var explanationTextView = UITextView().then {
        $0.text = "카페에서 디자인 이론 공부 하기, 카페에서 디자인 이론 공부 하기"
        $0.textAlignment = .left
        $0.backgroundColor = .clear
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var tagLabel = UILabel().then {
        $0.text = "태그"
        $0.textColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var tagStudyButton = UIButton().then {
        $0.setTitle("공부", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var tagWalkButton = UIButton().then {
        $0.setTitle("산책", for: .normal)
        $0.setTitleColor(UIColor(red: 186/255, green: 222/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 186/255, green: 222/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var tagMajorBandButton = UIButton().then {
        $0.setTitle("전공동아리", for: .normal)
        $0.setTitleColor(UIColor(red: 207/255, green: 227/255, blue: 206/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 207/255, green: 227/255, blue: 206/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var tagFreedomBandButton = UIButton().then {
        $0.setTitle("자율동아리", for: .normal)
        $0.setTitleColor(UIColor(red: 228/255, green: 201/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 228/255, green: 201/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var tagAddButton = UIButton().then {
        $0.setTitle("+ 추가", for: .normal)
        $0.setTitleColor(UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var changeButton = UIButton().then {
        $0.setTitle("변 경", for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var mainTitleLabel = UILabel().then{
        $0.text = "나의 할 일 변경"
        $0.textColor = UIColor(red: 154/255, green: 174/255, blue: 254/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var notificationTitleLabel = UILabel().then {
        $0.text = "알림 설정"
        $0.textColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var notificationBackgroundView = UIButton().then {
        $0.backgroundColor = UIColor(red: 253/255, green: 253/255, blue: 253/255, alpha: 1)
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 10
        $0.setTitle("오전 12:12", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "Poppins-Light")
        $0.setTitleColor(UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1), for: .normal)
    }
    
    lazy var backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_LocationBackButton"), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
                
        layoutSetting()
        
        calendarViewSetting()
        
        timeViewSetting()
        
        locationViewSetting()

        labelSetting()
        
        tagCollectionViewSetting()
        
        tagAddModalViewSetting()
        
        tagColorCollectionViewSetting()
        
        calendarModalViewSetting()
        
        calendarCollectionViewSetting()
        
        selectTimeModalViewSetting()
        
        TimeTableViewSetting()
        
        repeatCollectionViewSetting()
    }
    
    func tagCollectionViewSetting(){
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
        tagCollectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.reuseId)
        
        self.view.addSubview(tagCollectionView)
        
        tagCollectionView.snp.makeConstraints { make in
            tagCollectionView.backgroundColor = .clear
            
            make.top.equalTo(tagLabel.snp.bottom).offset(self.view.frame.height/60)
            make.left.equalTo(tagLabel)
            make.height.equalToSuperview().dividedBy(10)
            make.right.equalToSuperview()
        }
        
        notificationTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(tagCollectionView)
            make.top.equalTo(tagCollectionView.snp.bottom).offset(self.view.frame.height/38.6)
        }
        
        notificationBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(notificationTitleLabel)
            make.top.equalTo(notificationTitleLabel.snp.bottom).offset(self.view.frame.height/80)
            make.height.equalToSuperview().dividedBy(22)
            make.width.equalToSuperview().dividedBy(4.07)
        }
        
        
        changeButton.snp.makeConstraints { make in
            make.top.equalTo(notificationBackgroundView.snp.bottom).offset(self.view.frame.height/38.6)
            make.width.equalToSuperview().dividedBy(1.17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(18.6)
        }
    }
    
    func repeatCollectionViewSetting(){
        repeatCollectionView.delegate = self
        repeatCollectionView.dataSource = self
        
        repeatCollectionView.register(PersonalPlanAddRepeatDayCollectionViewCell.self, forCellWithReuseIdentifier: PersonalPlanAddRepeatDayCollectionViewCell.reuseId)
        
        selectCalendarModalView.modalBackgroundView.addSubview(repeatCollectionView)
        
        
        repeatCollectionView.snp.makeConstraints { make in
            make.top.equalTo(selectCalendarModalView.repeatLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(7)
        }
        
        selectCalendarModalView.calendarAddButton.snp.makeConstraints { make in
            make.top.equalTo(repeatCollectionView.snp.bottom).offset(self.view.frame.width/43.8)
            make.right.equalTo(repeatCollectionView).offset(-self.view.frame.width/20.8)
            make.width.equalToSuperview().dividedBy(4.7)
            make.height.equalToSuperview().dividedBy(10.4)
        }
    }
    
    func TimeTableViewSetting(){
        startTimeTableView.delegate = self
        startTimeTableView.dataSource = self
        
        selectTimeModalView.modalBackgroundView.addSubview(startTimeTableView)
        
        startTimeTableView.register(StartTimeTableViewCell.self, forCellReuseIdentifier: StartTimeTableViewCell.reuseId)
        
        startTimeTableView.snp.makeConstraints { make in
            make.top.equalTo(selectTimeModalView.startMorningLabel.snp.bottom).offset(self.view.frame.height/60)
            make.left.equalTo(selectTimeModalView.startMorningLabel)
            make.right.equalTo(selectTimeModalView.startAfternoonLabel)
            make.height.equalToSuperview().dividedBy(2.7)
        }
        
        endTimeTableView.delegate = self
        endTimeTableView.dataSource = self
        
        selectTimeModalView.modalBackgroundView.addSubview(endTimeTableView)
        
        endTimeTableView.register(EndTimeTableViewCell.self, forCellReuseIdentifier: EndTimeTableViewCell.reuseId)
        
        endTimeTableView.snp.makeConstraints { make in
            make.top.equalTo(selectTimeModalView.endMorningLabel.snp.bottom).offset(self.view.frame.height/60)
            make.left.equalTo(selectTimeModalView.endMorningLabel)
            make.right.equalTo(selectTimeModalView.endAfternoonLabel)
            make.height.equalToSuperview().dividedBy(2.7)
        }
        
        selectTimeModalView.waveLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(endTimeTableView)
        }
        
        selectTimeModalView.completeButton.snp.makeConstraints { make in
            make.top.equalTo(endTimeTableView.snp.bottom).offset(self.view.frame.height/60)
            make.width.equalToSuperview().dividedBy(4.7)
            make.height.equalToSuperview().dividedBy(8)
            make.right.equalToSuperview().offset(-self.view.frame.width/18)
        }
        
        selectTimeModalView.completeButton.addTarget(self, action: #selector(completeButtonClicked(sender:)), for: .touchUpInside)
    }

    func selectTimeModalViewSetting(){
        self.view.addSubview(selectTimeModalView)
        
        selectTimeModalView.snp.makeConstraints { make in
            make.bottom.top.right.left.equalToSuperview()
        }
        
        selectTimeModalView.backgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        
        selectTimeModalView.modalBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.2)
            make.height.equalToSuperview().dividedBy(3.2)
        }
        
        selectTimeModalView.modalTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        selectTimeModalView.startMorningLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/10)
            make.top.equalTo(selectTimeModalView.modalTitleLabel.snp.bottom).offset(self.view.frame.height/28)
            make.height.equalToSuperview().dividedBy(19)
        }
        
        selectTimeModalView.startAfternoonLabel.snp.makeConstraints { make in
            make.left.equalTo(selectTimeModalView.startSelectBackButton.snp.right).offset(self.view.frame.width/41.6)
            make.top.bottom.equalTo(selectTimeModalView.startMorningLabel)
        }

        selectTimeModalView.startSelectCircleButton.snp.makeConstraints { make in
            make.top.equalTo(selectTimeModalView.startSelectBackButton).offset(selectTimeModalView.startSelectBackButton.frame.height/2)
            make.left.equalTo(selectTimeModalView.startSelectBackButton).offset(self.view.frame.width/200)
            make.height.width.equalTo(selectTimeModalView.startSelectBackButton.snp.height).dividedBy(1.2)
            
            selectTimeModalView.startSelectCircleButton.layer.cornerRadius = ((((self.view.frame.height)/3.2)/19)/1.2)/2
        }
        
        selectTimeModalView.startSelectBarView.snp.makeConstraints { make in
            make.bottom.equalTo(selectTimeModalView.startMorningLabel)
            make.left.equalTo(selectTimeModalView.startMorningLabel).offset(-self.view.frame.width/200)
            make.right.equalTo(selectTimeModalView.startMorningLabel).offset(self.view.frame.width/200)
            make.height.equalTo(selectTimeModalView.startMorningLabel).dividedBy(2)
        }
        
        selectTimeModalView.startSelectBackButton.snp.makeConstraints { make in
            make.left.equalTo(selectTimeModalView.startMorningLabel.snp.right).offset(self.view.frame.width/41.6)
            make.width.equalToSuperview().dividedBy(12.6)
            make.top.bottom.equalTo(selectTimeModalView.startMorningLabel)

            selectTimeModalView.startSelectBackButton.layer.cornerRadius = ((self.view.frame.height/3.2)/19)/2
        }

        selectTimeModalView.endMorningLabel.snp.makeConstraints { make in
            make.right.equalTo(selectTimeModalView.endSelectBackButton.snp.left).offset(-self.view.frame.width/41.6)
            make.top.bottom.equalTo(selectTimeModalView.endAfternoonLabel)
        }

        selectTimeModalView.endAfternoonLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/10)
            make.top.equalTo(selectTimeModalView.modalTitleLabel.snp.bottom).offset(self.view.frame.height/28)
            make.height.equalToSuperview().dividedBy(19)
        }

        selectTimeModalView.endSelectBarView.snp.makeConstraints { make in
            make.bottom.equalTo(selectTimeModalView.endMorningLabel)
            make.left.equalTo(selectTimeModalView.endMorningLabel).offset(-self.view.frame.width/200)
            make.right.equalTo(selectTimeModalView.endMorningLabel).offset(self.view.frame.width/200)
            make.height.equalTo(selectTimeModalView.endMorningLabel).dividedBy(2)
        }

        selectTimeModalView.endSelectCircleButton.snp.makeConstraints { make in
            make.top.equalTo(selectTimeModalView.endSelectBackButton).offset(selectTimeModalView.startSelectBackButton.frame.height/2)
            make.left.equalTo(selectTimeModalView.endSelectBackButton).offset(self.view.frame.width/200)
            make.height.width.equalTo(selectTimeModalView.endSelectBackButton.snp.height).dividedBy(1.2)

            selectTimeModalView.endSelectCircleButton.layer.cornerRadius = ((((self.view.frame.height)/3.2)/19)/1.2)/2
        }

        selectTimeModalView.endSelectBackButton.snp.makeConstraints { make in
            make.right.equalTo(selectTimeModalView.endAfternoonLabel.snp.left).offset(-self.view.frame.width/41.6)
            make.width.equalToSuperview().dividedBy(12.6)
            make.top.bottom.equalTo(selectTimeModalView.endAfternoonLabel)

            selectTimeModalView.endSelectBackButton.layer.cornerRadius = ((self.view.frame.height/3.2)/19)/2
        }
        
        selectTimeModalView.isHidden = true
    }
    
    func calendarCollectionViewSetting(){
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.bounces = false
        
        calendarCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.reuseId)
    }
    
    func calendarModalViewSetting(){
        self.view.addSubview(selectCalendarModalView)
        selectCalendarModalView.addSubview(selectCalendarModalView.shadowBackgroundView)
        selectCalendarModalView.addSubview(selectCalendarModalView.modalBackgroundView)
        selectCalendarModalView.modalBackgroundView.addSubview(calendarCollectionView)
        selectCalendarModalView.modalBackgroundView.addSubview(selectCalendarModalView.titleLabel)
        selectCalendarModalView.modalBackgroundView.addSubview(selectCalendarModalView.monthLabel)
        selectCalendarModalView.modalBackgroundView.addSubview(selectCalendarModalView.monthYearLabel)
        selectCalendarModalView.modalBackgroundView.addSubview(selectCalendarModalView.calendarTriangleImageView)
        selectCalendarModalView.modalBackgroundView.addSubview(selectCalendarModalView.repeatLabel)
        selectCalendarModalView.modalBackgroundView.addSubview(selectCalendarModalView.calendarAddButton)
        selectCalendarModalView.modalBackgroundView.addSubview(selectCalendarModalView.divideLineView)
        
        selectCalendarModalView.calendarAddButton.addTarget(self,action:#selector(calendarAddButtonClicked(sender:)),
                                 for:.touchUpInside)
        
        selectCalendarModalView.snp.makeConstraints { make in
            make.bottom.top.right.left.equalToSuperview()
        }
        
        selectCalendarModalView.shadowBackgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        
        selectCalendarModalView.modalBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.2)
            make.height.equalToSuperview().dividedBy(2.3)
        }
        
        selectCalendarModalView.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        selectCalendarModalView.monthLabel.snp.makeConstraints { make in
            make.left.equalTo(selectCalendarModalView.titleLabel).offset(self.view.frame.height/61.2)
            make.top.equalTo(selectCalendarModalView.titleLabel.snp.bottom).offset(self.view.frame.height/51.2)
        }
        
        selectCalendarModalView.monthYearLabel.snp.makeConstraints { make in
            make.bottom.equalTo(selectCalendarModalView.monthLabel).offset(-self.view.frame.height/131.2)
            make.left.equalTo(selectCalendarModalView.monthLabel.snp.right).offset(self.view.frame.height/161.2)
        }
        
        selectCalendarModalView.calendarTriangleImageView.snp.makeConstraints { make in
            make.top.equalTo(selectCalendarModalView.monthLabel.snp.bottom).offset(self.view.frame.height/51)
            make.height.width.equalTo(10)
            make.centerX.equalToSuperview()
        }
        
        calendarCollectionView.snp.makeConstraints { (make) in
            make.left.equalTo(selectCalendarModalView.modalBackgroundView).offset(self.view.frame.width/10.4)
            make.centerX.equalToSuperview()
            make.top.equalTo(selectCalendarModalView.calendarTriangleImageView.snp.bottom).offset(self.view.frame.height/61.2)
            make.height.equalToSuperview().dividedBy(4.7)
        }
        
        selectCalendarModalView.divideLineView.snp.makeConstraints { make in
            make.top.equalTo(calendarCollectionView.snp.bottom)
            make.right.equalToSuperview().offset(-self.view.frame.width/18)
            make.left.equalToSuperview().offset(self.view.frame.width/18)
            make.height.equalTo(0.5)
        }
        
        selectCalendarModalView.repeatLabel.snp.makeConstraints { make in
            make.top.equalTo(selectCalendarModalView.divideLineView.snp.bottom).offset(self.view.frame.height/33.8)
            make.left.equalTo(selectCalendarModalView.divideLineView)
        }
        
        selectCalendarModalView.isHidden = true
    }

    
    func tagAddModalViewSetting(){
        self.view.addSubview(tagAddModalView)
        tagAddModalView.addSubview(tagAddModalView.shadowBackgroundView)
        tagAddModalView.shadowBackgroundView.addSubview(tagAddModalView.modalBackgroundView)
        tagAddModalView.modalBackgroundView.addSubview(tagAddModalView.titleLabel)
        tagAddModalView.modalBackgroundView.addSubview(tagAddModalView.tagNameLabel)
        tagAddModalView.modalBackgroundView.addSubview(tagAddModalView.tagNameBackgroundView)
        tagAddModalView.tagNameBackgroundView.addSubview(tagAddModalView.tagNameTextField)
        tagAddModalView.modalBackgroundView.addSubview(tagAddModalView.tagColorLabel)
        tagAddModalView.modalBackgroundView.addSubview(tagAddModalView.tagAddButton)
        
        tagAddModalView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        tagAddModalView.shadowBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        tagAddModalView.modalBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.2)
            make.height.equalToSuperview().dividedBy(3.3)
        }
        
        tagAddModalView.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        tagAddModalView.tagNameLabel.snp.makeConstraints { make in
            make.top.equalTo(tagAddModalView.titleLabel.snp.bottom).offset(self.view.frame.height/62.4)
            make.left.equalTo(tagAddModalView.titleLabel)
        }
        
        tagAddModalView.tagNameBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(tagAddModalView.tagNameLabel)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(6.3)
            make.top.equalTo(tagAddModalView.tagNameLabel.snp.bottom).offset(self.view.frame.height/135.3)
        }
        
        tagAddModalView.tagNameTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/28.8)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        tagAddModalView.tagColorLabel.snp.makeConstraints { make in
            make.top.equalTo(tagAddModalView.tagNameBackgroundView.snp.bottom).offset(self.view.frame.height/50.7)
            make.left.equalTo(tagAddModalView.tagNameBackgroundView)
        }
        
        tagAddModalView.tagAddButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/40.6)
            make.right.equalToSuperview().offset(-self.view.frame.width/15)
            make.height.equalToSuperview().dividedBy(7.2)
            make.width.equalToSuperview().dividedBy(4.7)
        }
        
        tagAddModalView.tagAddButton.addTarget(self,action:#selector(tagAddCompletionbuttonClicked(sender:)),
                                 for:.touchUpInside)
        
        tagAddModalView.isHidden = true
    }
    
    func tagColorCollectionViewSetting(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        


        tagColorCollectionView.showsHorizontalScrollIndicator = false
        tagColorCollectionView.dataSource = self
        tagColorCollectionView.delegate = self
        
        tagColorCollectionView.register(TagColorCollectionViewCell.self, forCellWithReuseIdentifier: TagColorCollectionViewCell.reuseId)
        
        tagColorCollectionView.backgroundColor = UIColor.white
        tagAddModalView.modalBackgroundView.addSubview(tagColorCollectionView)
        
            tagColorCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tagAddModalView.tagColorLabel.snp.bottom)
            make.left.equalToSuperview()
            make.height.equalTo(tagAddModalView.modalBackgroundView).dividedBy(5)
            make.right.equalTo(tagAddModalView.modalBackgroundView)
        }
        
        let firstCell = tagColorCollectionView.cellForItem(at: [0, 0]) as? TagColorCollectionViewCell
        
        firstCell?.checkImage.isHidden = false
    }
    
    @objc //MARK: 모달 창 올리기
    func keyboardWillShow(_ sender: Notification) {
        tagAddModalView.modalBackgroundView.frame.origin.y = self.view.frame.height/5
    }

    @objc //MARK: 모달 창 원래대로
    func keyboardWillHide(_ sender: Notification) {
        tagAddModalView.modalBackgroundView.frame.origin.y = (self.view.frame.height/2) - (tagAddModalView.modalBackgroundView.frame.height/2)
    }
    
    //MARK: 화면터치하여 모달 추가 창 나가기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
        tagAddModalView.isHidden = true
    }
    
    @objc func tagAddCompletionbuttonClicked(sender:UIButton)
    {
        tagAddModalView.isHidden = true
    }
    
    @objc func tagAddButtonClicked(sender:UIButton){
        tagAddModalView.isHidden = false
        tagColorCollectionView.isHidden = false
    }
    
    @objc func calendarAddButtonClicked(sender:UIButton){
        selectCalendarModalView.isHidden = true
    }
    
    @objc func completeButtonClicked(sender:UIButton){
        selectTimeModalView.isHidden = true
    }
    
    @objc func tagbuttonClicked(sender:UIButton)
    {
        var backgroundColor: UIColor
        var borderColor: CGColor
        
        if isChecked[sender.tag] == true{
            // 1개만 체크되어있을때 눌러서 체크해제하려고할때 다른 버튼이 체크되어있는지 확인하고 체크되어있으면 바꾸고 되어있지않으면 그냥 나가게
            for index in 0...isChecked.count-1{
                if isChecked[index] == true{
                    if isChecked[index] != isChecked[sender.tag]{
                        backgroundColor = sender.backgroundColor!
                        
                        sender.backgroundColor = .white
                        sender.setTitleColor(backgroundColor, for: .normal)
                        sender.layer.borderWidth = 1
                        sender.layer.borderColor = backgroundColor.cgColor
                        
                        isChecked[sender.tag] = false
                    }
                }
            }
        }else{
            // 다른 버튼중에 선택된게 있다면 지우기
            for index in 0...isChecked.count-1{
                if isChecked[index] == true{
                    backgroundColor = tagButton[index].backgroundColor!
                    
                    tagButton[index].backgroundColor = .white
                    tagButton[index].setTitleColor(backgroundColor, for: .normal)
                    tagButton[index].layer.borderWidth = 1
                    tagButton[index].layer.borderColor = backgroundColor.cgColor
                    
                    isChecked[index] = false
                }
            }
            
            borderColor = sender.layer.borderColor!
            
            sender.backgroundColor = UIColor(cgColor: borderColor)
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.layer.borderWidth = 0
            
            isChecked[sender.tag] = true
        }
    }
    
    @objc func calendarViewButtonClicked(sender:UIButton){
        selectCalendarModalView.isHidden = false
    }
    
    @objc func timeViewButtonClicked(sender:UIButton){
        selectTimeModalView.isHidden = false
    }
    
    @objc func locationViewButtonClicked(sender:UIButton){
        
    }
    
    @objc func timeIconImageButton(sender:UIButton){
        selectTimeModalView.isHidden = false
    }
    
    @objc func changeButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    func layoutSetting(){
        self.view.addSubview(backButton)
        self.view.addSubview(mainTitleLabel)
        self.view.addSubview(notificationTitleLabel)
        self.view.addSubview(notificationBackgroundView)
        self.view.addSubview(titleBackgroundView)
        titleBackgroundView.addSubview(titleLabel)
        titleBackgroundView.addSubview(titleTextField)
        self.view.addSubview(calendarLabelButton)
        self.view.addSubview(timeLabelButton)
        self.view.addSubview(locationLabelButton)
        self.view.addSubview(tagLabel)
        self.view.addSubview(tagStudyButton)
        self.view.addSubview(tagWalkButton)
        self.view.addSubview(tagMajorBandButton)
        self.view.addSubview(tagFreedomBandButton)
        self.view.addSubview(tagAddButton)
        self.view.addSubview(explanationBackgroundView)
        
        explanationBackgroundView.addSubview(explanationTitleLabel)
        explanationBackgroundView.addSubview(explanationTextView)
        self.view.addSubview(changeButton)
        
        changeButton.addTarget(self, action: #selector(changeButtonClicked(sender:)), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        
        tagStudyButton.tag = 0
        tagWalkButton.tag = 1
        tagMajorBandButton.tag = 2
        tagFreedomBandButton.tag = 3
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/50)
        }
        
        calendarLabelButton.addTarget(self,action:#selector(calendarViewButtonClicked(sender:)),
                                 for:.touchUpInside)
        timeLabelButton.addTarget(self,action:#selector(timeViewButtonClicked(sender:)),
                                 for:.touchUpInside)
        locationLabelButton.addTarget(self,action:#selector(locationViewButtonClicked(sender:)),
                                 for:.touchUpInside)
        
        tagStudyButton.addTarget(self,action:#selector(tagbuttonClicked),
                                 for:.touchUpInside)
        tagWalkButton.addTarget(self,action:#selector(tagbuttonClicked),
                                 for:.touchUpInside)
        tagMajorBandButton.addTarget(self,action:#selector(tagbuttonClicked),
                                 for:.touchUpInside)
        tagFreedomBandButton.addTarget(self,action:#selector(tagbuttonClicked),
                                 for:.touchUpInside)
        
        tagAddButton.addTarget(self,action:#selector(tagAddButtonClicked(sender:)),
                                 for:.touchUpInside)
        
        titleBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/13.3)
            make.height.equalToSuperview().dividedBy(12)
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(self.view.frame.height/30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/17.8)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(titleLabel.snp.right).offset(self.view.frame.width/17.8)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview()
        }
        
        explanationTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/17.8)
        }
        
        explanationTextView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(explanationTitleLabel.snp.right).offset(self.view.frame.width/17.8)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(1.3)
        }

    }

    func calendarViewSetting(){
        self.view.addSubview(calendarViewButton)
        calendarViewButton.addSubview(calendarViewButton.backgroundView)
        calendarViewButton.backgroundView.addSubview(calendarViewButton.iconImageButton)
        
        calendarViewButton.dataSetting(iconImage: UIImage(named: "EZY_Calendar.svg")!)
        
        calendarViewButton.addTarget(self, action: #selector(calendarViewButtonClicked(sender:)), for: .touchUpInside)
        calendarViewButton.iconImageButton.addTarget(self, action: #selector(calendarViewButtonClicked(sender:)), for: .touchUpInside)
        
        calendarViewButton.snp.makeConstraints { make in
            make.top.equalTo(titleBackgroundView.snp.bottom).offset(self.view.frame.height/50)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(calendarViewButton.snp.height)
            make.left.equalTo(titleBackgroundView)
        }
        
        calendarViewButton.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        calendarViewButton.iconImageButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.4)
        }
    }
    
    func timeViewSetting(){
        self.view.addSubview(timeViewButton)
        timeViewButton.addSubview(timeViewButton.backgroundView)
        timeViewButton.backgroundView.addSubview(timeViewButton.iconImageButton)
        
        timeViewButton.addTarget(self, action: #selector(timeViewButtonClicked(sender:)), for: .touchUpInside)
        
        timeViewButton.dataSetting(iconImage: UIImage(named: "EZY_TimeSquare.svg")!)
        
        timeViewButton.snp.makeConstraints { make in
            make.top.equalTo(calendarViewButton.snp.bottom).offset(self.view.frame.height/47.7)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(timeViewButton.snp.height)
            make.left.equalTo(calendarViewButton)
        }
        
        timeViewButton.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        timeViewButton.iconImageButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.4)
        }
        
        timeViewButton.iconImageButton.addTarget(self, action: #selector(timeIconImageButton(sender:)), for: .touchUpInside)
    }
    
    func locationViewSetting(){
        self.view.addSubview(locationViewButton)
        locationViewButton.addSubview(locationViewButton.backgroundView)
        locationViewButton.backgroundView.addSubview(locationViewButton.iconImageButton)
        
        locationViewButton.addTarget(self, action: #selector(locationViewButtonClicked(sender:)), for: .touchUpInside)
        
        locationViewButton.dataSetting(iconImage: UIImage(named: "EZY_Location.svg")!)
        
        locationViewButton.snp.makeConstraints { make in
            make.top.equalTo(timeViewButton.snp.bottom).offset(self.view.frame.height/47.7)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(timeViewButton.snp.height)
            make.left.equalTo(timeViewButton)
        }
        
        locationViewButton.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        locationViewButton.iconImageButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2)
        }
        
        explanationBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(titleBackgroundView)
            make.height.equalToSuperview().dividedBy(12)
            make.top.equalTo(locationViewButton.snp.bottom).offset(self.view.frame.height/50)
        }
        
        tagLabel.snp.makeConstraints { make in
            make.left.equalTo(titleBackgroundView)
            make.top.equalTo(explanationBackgroundView.snp.bottom).offset(self.view.frame.height/38.6)
        }
        
    }
    
    func labelSetting(){
        calendarLabelButton.snp.makeConstraints { make in
            make.centerY.equalTo(calendarViewButton)
            make.left.equalTo(calendarViewButton.snp.right).offset(self.view.frame.width/13.8)
        }
        
        timeLabelButton.snp.makeConstraints { make in
            make.centerY.equalTo(timeViewButton)
            make.left.equalTo(timeViewButton.snp.right).offset(self.view.frame.width/13.8)
        }
        
        locationLabelButton.snp.makeConstraints { make in
            make.centerY.equalTo(locationViewButton)
            make.left.equalTo(locationViewButton.snp.right).offset(self.view.frame.width/13.8)
        }
    }
    
}

extension PersonalPlanChangeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tagColorCollectionView{
            return TagColorModels.count
        }else if collectionView == calendarCollectionView{
            return dayArray.count
        }else if collectionView == repeatCollectionView{
            return 7
        }else if collectionView == tagCollectionView{
            return TagModels.count
        }

        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagColorCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagColorCollectionViewCell.reuseId, for: indexPath) as! TagColorCollectionViewCell
            
            cell.backgroundColor = .white
            
            cell.setModel(TagColorModels[indexPath.row])
        
            return cell
        }else if collectionView == calendarCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.reuseId, for: indexPath) as! CalendarCollectionViewCell
            
            cell.backgroundColor = .white
            cell.dateLabel.text = dayArray[indexPath.row]
            cell.dayOfTheWeekLabel.text = dayOfTheWeekArray[indexPath.row]

            return cell
        }else if collectionView == repeatCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonalPlanAddRepeatDayCollectionViewCell.reuseId, for: indexPath) as! PersonalPlanAddRepeatDayCollectionViewCell
            
            cell.label.text = RepeatDayOfTheWeekArray[indexPath.row]
            cell.backgroundColor = .white
            
            cell.setModel(RepeatModels[indexPath.row])
            return cell
        }else if collectionView == tagCollectionView{
         
            if indexPath == [0,0]{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.reuseId, for: indexPath) as! TagCollectionViewCell
                
                cell.tagNameLabel.text = "+ 추가"
                cell.tagNameLabel.textColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1)
                cell.tagBackgroundView.backgroundColor = .white
                cell.tagBackgroundView.layer.borderWidth = 1.3
                cell.tagBackgroundView.layer.borderColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1).cgColor
                
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.reuseId, for: indexPath) as! TagCollectionViewCell
                
                cell.setModel(TagModels[indexPath.row])
                
                cell.tagNameLabel.text = tagNameTextArray[indexPath.row]
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if collectionView == tagColorCollectionView{
            if TagColorModels[indexPath.row].isSelected {
                
                TagColorModels[tagColorPreciousSelectedIndex].isSelected.toggle()
                
                if TagColorModels.filter({ $0.isSelected }).count >= 1 {
                    TagColorModels[indexPath.row].isSelected.toggle()
                    
                    tagColorPreciousSelectedIndex = indexPath.row
                }
            }
            
            collectionView.reloadData()
        }else if collectionView == repeatCollectionView{
            RepeatModels[indexPath.row].isSelected.toggle()
                
            collectionView.reloadData()
        }else if collectionView == tagCollectionView{
            print("click\(indexPath)")
            print("preciousSelectedIndex\(tagPreciousSelectedIndex)")
            if indexPath.row != 0 {
                if TagModels[indexPath.row].isSelected {
                    
                    TagModels[tagPreciousSelectedIndex].isSelected.toggle()
                    
                    if TagModels.filter({ $0.isSelected }).count >= 1 {
                        TagModels[indexPath.row].isSelected.toggle()
                        
                        tagPreciousSelectedIndex = indexPath.row
                    }
                    
                }
                collectionView.reloadData()
            }else{
                tagAddModalView.isHidden = false
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == calendarCollectionView{
            return CGSize(width: collectionView.frame.width/10, height: self.view.frame.height/14)
        }else if collectionView == tagColorCollectionView{
            return CGSize(width: 30, height: 30)
        }else if collectionView == repeatCollectionView{
            return CGSize(width: 30, height: 30)
        }else if collectionView == tagCollectionView{
            return CGSize(width: self.view.frame.width/4.4, height: self.view.frame.height/23)
        }

        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == tagColorCollectionView{
            return UIEdgeInsets(top: 0, left: self.view.frame.height/33.8, bottom: 0, right: self.view.frame.height/33.8)
        }else if collectionView == repeatCollectionView{
            return UIEdgeInsets(top: 0, left: self.view.frame.height/33.8, bottom: 0, right: self.view.frame.height/33.8)
        }else if collectionView == tagCollectionView{
            
        }
        
        return UIEdgeInsets()
    }
}

extension PersonalPlanChangeViewController: HSCycleGalleryViewDelegate {
    
    func numberOfItemInCycleGalleryView(_ cycleGalleryView: CalendarView) -> Int {
        return 20
    }
    
    func cycleGalleryView(_ cycleGalleryView: CalendarView, cellForItemAtIndex index: Int) -> UICollectionViewCell {
        let cell = cycleGalleryView.dequeueReusableCell(withIdentifier: CalendarCollectionViewCell.reuseId, for: IndexPath(item: index, section: 0)) as! CalendarCollectionViewCell
        return cell
    }
    
}

extension PersonalPlanChangeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(20)
    }
}

extension PersonalPlanChangeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == startTimeTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: StartTimeTableViewCell.reuseId, for: indexPath) as! StartTimeTableViewCell
            
            cell.selectionStyle = .none

            return cell
        }else if tableView == endTimeTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: EndTimeTableViewCell.reuseId, for: indexPath) as! EndTimeTableViewCell

            cell.selectionStyle = .none

            return cell
        }
        
        return UITableViewCell()
    }
    
    
}

