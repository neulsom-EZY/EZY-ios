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
    
    var tagColorCollectionView:UICollectionView?
    
    var isChecked: [Bool] = [true, false, false, false]
    
    lazy var tagButton: [UIButton] = [tagStudyButton, tagWalkButton, tagMajorBandButton, tagFreedomBandButton]
    
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
    
    
    var tagColorArray: [UIColor] = [UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 196/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 206/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 216/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 226/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 236/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 246/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 255/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 196/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 206/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 216/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 226/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 236/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 246/255, green: 200/255, blue: 255/255, alpha: 1),UIColor(red: 255/255, green: 200/255, blue: 255/255, alpha: 1)]
    
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
        
        tagColorCollectionView?.dataSource = self
        tagColorCollectionView?.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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

extension RescheduleViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagColorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: TagColorCollectionViewCell.reuseId, for: indexPath) as! TagColorCollectionViewCell
        
        
        
        print(indexPath)
        myCell.colorBackgroundView.backgroundColor = tagColorArray[indexPath.row]
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        let myCell = collectionView.cellForItem(at: indexPath) as! TagColorCollectionViewCell
        
        if myCell.checkImage.isHidden == false{ // 체크 표시가 있을 때 클릭했을 때
            for index in 0...tagColorArray.count-1{
                let removeCell = collectionView.cellForItem(at: [0, index]) as? TagColorCollectionViewCell
                
                if removeCell?.checkImage.isHidden == false && [0, index] != indexPath{ // 체크이미지를 지울 때 다른 색에 체크가 없으면 체크가 헤제안대게
                    
                    myCell.checkImage.isHidden = true
                    
                    myCell.colorBackgroundView.layer.masksToBounds = true
                    myCell.colorBackgroundView.layer.shadowOpacity = 0
                    myCell.colorBackgroundView.layer.shadowRadius = 0
                    myCell.colorBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
                    myCell.colorBackgroundView.layer.shadowColor = .none
                }
            }
            

        }else{ // 체크 표시가 없을 때 클릭했을 때
            
            for index in 0...tagColorArray.count-1{
                let removeCell = collectionView.cellForItem(at: [0, index]) as? TagColorCollectionViewCell
                
                removeCell?.checkImage.isHidden = true
                
                removeCell?.colorBackgroundView.layer.shadowOpacity = 0
                removeCell?.colorBackgroundView.layer.shadowRadius = 0
                removeCell?.colorBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
                removeCell?.colorBackgroundView.layer.shadowColor = .none
            }
            
            myCell.checkImage.isHidden = false
            
            myCell.colorBackgroundView.layer.masksToBounds = false
            myCell.colorBackgroundView.layer.shadowOpacity = 2
            myCell.colorBackgroundView.layer.shadowRadius = 3
            myCell.colorBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
            myCell.colorBackgroundView.layer.shadowColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1).cgColor
        }
    }
}
