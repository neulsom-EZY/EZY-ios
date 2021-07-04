//
//  RescheduleViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/19.
//

import UIKit

class RescheduleViewController: UIViewController {
    
    lazy var topView = TopView()
    
    lazy var calendarView = WhiteBackgroundView()
    
    lazy var timeView = WhiteBackgroundView()
    
    lazy var locationView = WhiteBackgroundView()
    
    lazy var tagAddModalView = TagAddModalView()
    
    lazy var calendarModalView = CalendarModalView()
    
    var tagColorCollectionView: UICollectionView?
    
    var isChecked: [Bool] = [true, false, false, false]
    
    var models: [TagColorCollectionViewModel] = [TagColorCollectionViewModel(backgroundColor: UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: false),
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
    
    lazy var tagButton: [UIButton] = [tagStudyButton, tagWalkButton, tagMajorBandButton, tagFreedomBandButton]
    
    var preciousSelectedIndex = 0
    
    var dayArray = ["24","25","26","27","28","29","30","1","2","3"]
    
    var dayOfTheWeekArray = ["S","M","T","W","T","F","S","S","M","T"]
    

    
    let calendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
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
    
    var tagStudyButton = UIButton().then {
        $0.setTitle("공부", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    var tagWalkButton = UIButton().then {
        $0.setTitle("산책", for: .normal)
        $0.setTitleColor(UIColor(red: 186/255, green: 222/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 186/255, green: 222/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    var tagMajorBandButton = UIButton().then {
        $0.setTitle("전공동아리", for: .normal)
        $0.setTitleColor(UIColor(red: 207/255, green: 227/255, blue: 206/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 207/255, green: 227/255, blue: 206/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    var tagFreedomBandButton = UIButton().then {
        $0.setTitle("자율동아리", for: .normal)
        $0.setTitleColor(UIColor(red: 228/255, green: 201/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 228/255, green: 201/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    var tagAddButton = UIButton().then {
        $0.setTitle("+ 추가", for: .normal)
        $0.setTitleColor(UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
            
        topViewSetting()
        
        layoutSetting()
        
        calendarViewSetting()
        
        timeViewSetting()
        
        locationViewSetting()

        labelSetting()
        
        tagAddModalViewSetting()
        
        calendarModalViewSetting()
        
        tagColorCollectionViewSetting()
        
        calendarCollectionViewSetting()
    }

    
    func calendarCollectionViewSetting(){
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.bounces = false
        calendarCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.reuseId)
        
        calendarCollectionView.decelerationRate = UIScrollView.DecelerationRate.normal
        
    }
    
    func calendarModalViewSetting(){
        self.view.addSubview(calendarModalView)
        calendarModalView.addSubview(calendarModalView.shadowBackgroundView)
        calendarModalView.addSubview(calendarModalView.modalBackgroundView)
        calendarModalView.modalBackgroundView.addSubview(calendarCollectionView)
        calendarModalView.modalBackgroundView.addSubview(calendarModalView.titleLabel)
        calendarModalView.modalBackgroundView.addSubview(calendarModalView.monthLabel)
        calendarModalView.modalBackgroundView.addSubview(calendarModalView.monthYearLabel)
        calendarModalView.modalBackgroundView.addSubview(calendarModalView.calendarTriangleImageView)
        
        calendarModalView.snp.makeConstraints { make in
            make.bottom.top.right.left.equalToSuperview()
        }
        
        calendarModalView.shadowBackgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        
        calendarModalView.modalBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.2)
            make.height.equalToSuperview().dividedBy(3.3)
        }
        
        calendarModalView.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        calendarModalView.monthLabel.snp.makeConstraints { make in
            make.left.equalTo(calendarModalView.titleLabel).offset(self.view.frame.height/61.2)
            make.top.equalTo(calendarModalView.titleLabel.snp.bottom).offset(self.view.frame.height/51.2)
        }
        
        calendarModalView.monthYearLabel.snp.makeConstraints { make in
            make.bottom.equalTo(calendarModalView.monthLabel).offset(-self.view.frame.height/131.2)
            make.left.equalTo(calendarModalView.monthLabel.snp.right).offset(self.view.frame.height/161.2)
        }
        
        calendarCollectionView.snp.makeConstraints { (make) in
            make.left.equalTo(calendarModalView.modalBackgroundView).offset(self.view.frame.width/10.4)
            make.centerX.equalToSuperview()
            make.top.equalTo(calendarModalView.monthLabel.snp.bottom).offset(self.view.frame.height/31.2)
            make.height.equalToSuperview().dividedBy(4.7)
        }
        
        calendarModalView.calendarTriangleImageView.snp.makeConstraints { make in
            make.bottom.equalTo(calendarCollectionView.snp.top).offset(-self.view.frame.height/61.2)
            make.height.width.equalTo(10)
            make.centerX.equalToSuperview()
        }
        
        calendarModalView.isHidden = false
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
        
        tagColorCollectionView?.dataSource = self
        tagColorCollectionView?.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 30, height: 30)
        layout.sectionInset = UIEdgeInsets(top: 0, left: self.view.frame.height/33.8, bottom: 0, right: self.view.frame.height/33.8)
        layout.scrollDirection = .horizontal
        
        let myCollectionView: UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(TagColorCollectionViewCell.self, forCellWithReuseIdentifier: TagColorCollectionViewCell.reuseId)
        myCollectionView.backgroundColor = UIColor.white
        tagAddModalView.modalBackgroundView.addSubview(myCollectionView)
        
        myCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tagAddModalView.tagColorLabel.snp.bottom)
            make.left.equalToSuperview()
            make.height.equalTo(tagAddModalView.modalBackgroundView).dividedBy(5)
            make.right.equalTo(tagAddModalView.modalBackgroundView)
        }
        
        let firstCell = tagColorCollectionView?.cellForItem(at: [0, 0]) as? TagColorCollectionViewCell
        
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
        tagColorCollectionView?.isHidden = false
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
    
    @objc func calendarLabelButtonClicked(sender:UIButton){
        
    }
    
    @objc func timeLabelButtonClicked(sender:UIButton){
        
    }
    
    @objc func locationLabelButtonClicked(sender:UIButton){
        
    }
    
    func layoutSetting(){
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
        
        tagStudyButton.tag = 0
        tagWalkButton.tag = 1
        tagMajorBandButton.tag = 2
        tagFreedomBandButton.tag = 3
        
        calendarLabelButton.addTarget(self,action:#selector(calendarLabelButtonClicked(sender:)),
                                 for:.touchUpInside)
        timeLabelButton.addTarget(self,action:#selector(timeLabelButtonClicked(sender:)),
                                 for:.touchUpInside)
        locationLabelButton.addTarget(self,action:#selector(locationLabelButtonClicked(sender:)),
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
        
        self.view.addSubview(explanationBackgroundView)
        explanationBackgroundView.addSubview(explanationTitleLabel)
        explanationBackgroundView.addSubview(explanationTextView)
        
        titleBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/13.3)
            make.height.equalToSuperview().dividedBy(12)
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/19.8)
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
        self.view.addSubview(calendarView)
        calendarView.addSubview(calendarView.backgroundView)
        calendarView.backgroundView.addSubview(calendarView.iconImageView)
        
        calendarView.dataSetting(iconImage: UIImage(named: "EZY_Calendar.svg")!)
        
        calendarView.snp.makeConstraints { make in
            make.top.equalTo(titleBackgroundView.snp.bottom).offset(self.view.frame.height/30)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(calendarView.snp.height)
            make.left.equalTo(titleBackgroundView)
        }
        
        calendarView.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        calendarView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.4)
        }
    }
    
    
    func timeViewSetting(){
        self.view.addSubview(timeView)
        timeView.addSubview(timeView.backgroundView)
        timeView.backgroundView.addSubview(timeView.iconImageView)
        
        timeView.dataSetting(iconImage: UIImage(named: "EZY_TimeSquare.svg")!)
        
        timeView.snp.makeConstraints { make in
            make.top.equalTo(calendarView.snp.bottom).offset(self.view.frame.height/47.7)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(timeView.snp.height)
            make.left.equalTo(calendarView)
        }
        
        timeView.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        timeView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.4)
        }
    }
    
    func locationViewSetting(){
        self.view.addSubview(locationView)
        locationView.addSubview(locationView.backgroundView)
        locationView.backgroundView.addSubview(locationView.iconImageView)
        
        locationView.dataSetting(iconImage: UIImage(named: "EZY_Location.svg")!)
        
        locationView.snp.makeConstraints { make in
            make.top.equalTo(timeView.snp.bottom).offset(self.view.frame.height/47.7)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(timeView.snp.height)
            make.left.equalTo(timeView)
        }
        
        locationView.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        locationView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2)
        }
        
        explanationBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(titleBackgroundView)
            make.height.equalToSuperview().dividedBy(12)
            make.top.equalTo(locationView.snp.bottom).offset(self.view.frame.height/30)
        }
        
        tagLabel.snp.makeConstraints { make in
            make.left.equalTo(titleBackgroundView)
            make.top.equalTo(explanationBackgroundView.snp.bottom).offset(self.view.frame.height/38.6)
        }
        
        tagStudyButton.snp.makeConstraints{ make in
            make.top.equalTo(tagLabel.snp.bottom).offset(self.view.frame.height/47.7)
            make.left.equalTo(tagLabel)
            make.height.equalToSuperview().dividedBy(25.3)
            make.width.equalToSuperview().dividedBy(4.4)
            
            tagStudyButton.layer.cornerRadius = (self.view.frame.height/25.3)/2
        }
        
        tagWalkButton.snp.makeConstraints { make in
            make.top.equalTo(tagStudyButton)
            make.left.equalTo(tagStudyButton.snp.right).offset(self.view.frame.width/25)
            make.height.width.equalTo(tagStudyButton)
            
            tagWalkButton.layer.cornerRadius = (self.view.frame.height/25.3)/2
        }
        
        tagMajorBandButton.snp.makeConstraints { make in
            make.top.equalTo(tagWalkButton)
            make.left.equalTo(tagWalkButton.snp.right).offset(self.view.frame.width/25)
            make.height.width.equalTo(tagStudyButton)
            
            tagMajorBandButton.layer.cornerRadius = (self.view.frame.height/25.3)/2
        }
        
        tagFreedomBandButton.snp.makeConstraints { make in
            make.top.equalTo(tagStudyButton.snp.bottom).offset(self.view.frame.height/60)
            make.left.equalTo(tagStudyButton.snp.left)
            make.height.width.equalTo(tagStudyButton)
            
            tagFreedomBandButton.layer.cornerRadius = (self.view.frame.height/25.3)/2
        }
        
        tagAddButton.snp.makeConstraints { make in
            make.top.equalTo(tagFreedomBandButton)
            make.left.equalTo(tagFreedomBandButton.snp.right).offset(self.view.frame.width/25)
            make.height.width.equalTo(tagStudyButton)
            
            tagAddButton.layer.cornerRadius = (self.view.frame.height/25.3)/2
        }
        
    }
    
    
    func topViewSetting() {
        self.view.addSubview(topView)
        topView.addSubview(topView.backButton)
        topView.addSubview(topView.titleLabel)
        
        topView.topViewDataSetting(backButtonImage: UIImage(named: "EZY_SettingBackButton")!, titleLabelText: "나의 할 일 변경",
                                   textColor: UIColor(red: 154/255, green: 174/255, blue: 253/255, alpha: 1))

        topView.topViewLayoutSetting(screenHeight: Double(self.view.bounds.height), screenWeight: Double(self.view.bounds.width))
        
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
    }
    
    func labelSetting(){
        calendarLabelButton.snp.makeConstraints { make in
            make.centerY.equalTo(calendarView)
            make.left.equalTo(calendarView.snp.right).offset(self.view.frame.width/13.8)
        }
        
        timeLabelButton.snp.makeConstraints { make in
            make.centerY.equalTo(timeView)
            make.left.equalTo(timeView.snp.right).offset(self.view.frame.width/13.8)
        }
        
        locationLabelButton.snp.makeConstraints { make in
            make.centerY.equalTo(locationView)
            make.left.equalTo(locationView.snp.right).offset(self.view.frame.width/13.8)
        }
    }
    
}

extension RescheduleViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tagColorCollectionView{
            return models.count
        }else if collectionView == calendarCollectionView{
            return dayArray.count
        }

        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagColorCollectionView{
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: TagColorCollectionViewCell.reuseId, for: indexPath) as! TagColorCollectionViewCell
            
            myCell.setModel(models[indexPath.row])
        
            return myCell
        }else if collectionView == calendarCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.reuseId, for: indexPath) as! CalendarCollectionViewCell
            
            cell.backgroundColor = .white
            cell.dateLabel.text = dayArray[indexPath.row]
            cell.dayOfTheWeekLabel.text = dayOfTheWeekArray[indexPath.row]
            print("calendarCollectionView.contentOffset : \(calendarCollectionView.contentOffset.x)")
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {

        if models[indexPath.row].isSelected {
            
            models[preciousSelectedIndex].isSelected.toggle()
            
            if models.filter({ $0.isSelected }).count >= 1 {
                models[indexPath.row].isSelected.toggle()
                
                preciousSelectedIndex = indexPath.row
            }
        }
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == calendarCollectionView{
            return CGSize(width: collectionView.frame.width/10, height: self.view.frame.height/14)
        }

        return CGSize()
    }
}

extension RescheduleViewController: HSCycleGalleryViewDelegate {
    
    func numberOfItemInCycleGalleryView(_ cycleGalleryView: CalendarView) -> Int {
        return 20
    }
    
    func cycleGalleryView(_ cycleGalleryView: CalendarView, cellForItemAtIndex index: Int) -> UICollectionViewCell {
        let cell = cycleGalleryView.dequeueReusableCell(withIdentifier: CalendarCollectionViewCell.reuseId, for: IndexPath(item: index, section: 0)) as! CalendarCollectionViewCell
        return cell
    }
    
}


