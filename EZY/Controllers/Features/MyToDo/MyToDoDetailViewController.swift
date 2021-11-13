//
//  ScheduleDetailViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/08.
//

import UIKit

class MyToDoDetailViewController: UIViewController {
        
    private let calendarBtn : CalendarBtn = {
        let viewModel = CalendarModel(icon: UIImage(named: "EZY_Calendar")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 255, green: 181, blue: 181), message: "날짜를 선택해주세요!", repeatText: "반복 없음")
        let button = CalendarBtn(with: viewModel)
        return button
    }()
    
    private let clockBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_clock")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 255, green: 203, blue: 181), message: "시간을 선택해주세요!")
        let button = AlertButton(with: viewModel)
        return button
    }()
    
    private let locationBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_location")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 199, green: 224, blue: 212), message: "위치를 선택해주세요!")
        let button = AlertButton(with: viewModel)
        return button
    }()
    
    private lazy var btnStackView = UIStackView(arrangedSubviews: [clockBtn,locationBtn]).then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = UIScreen.main.bounds.height/47.7647
    }
    
    private let backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_DetailBackButton"), for: .normal)
    }
    
    private let planNameLabel = UILabel().then {
        $0.text = "아름이 산책시키기"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "Poppins-SemiBold")
    }
    
    private let planTypeLabel = UILabel().then {
        $0.text = "나의 할 일"
        $0.textColor = UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let explanationBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 246/255, green: 243/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    
    private let explanationTitleLabel = UILabel().then {
        $0.text = "설명"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let explanationContentTextView = UITextView().then {
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
        $0.backgroundColor = .clear
    }
    
    private let tagLabel = UILabel().then {
        $0.text = "태그"
        $0.textColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let selectedTagButton = WhiteBasicButton().then {
        $0.buttonTitleLabelSetting(titleText: "PROGRAMMING", titleColor: UIColor(red: 164/255, green: 137/255, blue: 255/255, alpha: 1))
        $0.isEnabled = false
    }
    
    private let repeatTitleLabel = UILabel().then {
        $0.text = "반복 설정"
        $0.textColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let noRepeatButton = WhiteBasicButton().then{
        $0.buttonTitleLabelSetting(titleText: "반복이 없습니다.", titleColor: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1))
        $0.isEnabled = false
    }
    
    private let repeatDayCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then{
        $0.backgroundColor = .white
        $0.register(PersonalPlanDetailRepeatDayCollectionViewCell.self, forCellWithReuseIdentifier: PersonalPlanDetailRepeatDayCollectionViewCell.reuseId)
        $0.isHidden = true
    }
    
    private let planDeleteButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_DeleteButton"), for: .normal)
    }
    
    private let planModifyButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_PlanModify"), for: .normal)
    }
    
    private let dayLabelText = ["월","수","토","일"]
    
    private let notificationTitleLabel = UILabel().then {
        $0.text = "알림 설정"
        $0.textColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let notificationButton = WhiteBasicButton().then {
        $0.buttonTitleLabelSetting(titleText: "오전 12:12", titleColor: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1))
        $0.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI(){
        self.view.backgroundColor = .white
        
        addView()
        
        location()
        
        delegateAndDataSource()
    }
    
    private func delegateAndDataSource(){
        repeatDayCollectionView.delegate = self
        repeatDayCollectionView.dataSource = self
    }
    
    private func addView(){
        [planNameLabel, backButton, planTypeLabel, explanationBackgroundView, tagLabel, selectedTagButton, planDeleteButton, planModifyButton, notificationTitleLabel, repeatTitleLabel, notificationButton, noRepeatButton, repeatDayCollectionView, calendarBtn, btnStackView, selectedTagButton].forEach { view.addSubview($0) }
        [explanationTitleLabel, explanationContentTextView].forEach { explanationBackgroundView.addSubview($0) }
    }
    
    private func location(){
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        planModifyButton.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.right.equalTo(planDeleteButton.snp.left).offset(-self.view.frame.width/34)
            make.width.height.equalTo(planDeleteButton)
        }
        planDeleteButton.snp.makeConstraints { make in
            make.centerY.equalTo(planModifyButton)
            make.right.equalToSuperview().offset(-self.view.frame.width/13.3)
            make.width.equalToSuperview().dividedBy(18.75)
        }
        planNameLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/30)
        }
        planTypeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(planNameLabel).offset(-self.view.frame.width/90)
            make.left.equalTo(planNameLabel.snp.right).offset(self.view.frame.width/30)
        }
        calendarBtn.snp.makeConstraints { make in
            make.left.equalTo(planNameLabel)
            make.height.equalToSuperview().dividedBy(18.04)
            make.centerX.equalToSuperview()
            make.top.equalTo(planNameLabel.snp.bottom).offset(self.view.frame.height/30.07)
        }
        btnStackView.snp.makeConstraints {
            $0.top.equalTo(calendarBtn.snp.bottom).offset(view.frame.height/47.76)
            $0.left.equalTo(calendarBtn)
            $0.right.equalToSuperview().inset(view.frame.height/9.23)
            $0.height.equalTo(view.frame.height/7.58)
        }
        explanationBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(btnStackView)
            make.height.equalToSuperview().dividedBy(12)
            make.top.equalTo(btnStackView.snp.bottom).offset(self.view.frame.height/30)
        }
        explanationTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.width/20)
            make.left.equalToSuperview().offset(self.view.frame.width/17.8)
        }
        explanationContentTextView.snp.makeConstraints { make in
            make.left.equalTo(explanationTitleLabel.snp.right).offset(self.view.frame.width/40)
            make.top.equalToSuperview().offset(self.view.frame.width/40)
            make.right.equalToSuperview().offset(-self.view.frame.width/17.8)
            make.bottom.equalToSuperview().offset(-self.view.frame.width/20)
        }
        tagLabel.snp.makeConstraints { make in
            make.left.equalTo(explanationBackgroundView)
            make.top.equalTo(explanationBackgroundView.snp.bottom).offset(self.view.frame.height/40.6)
        }
        selectedTagButton.snp.makeConstraints{ make in
            make.top.equalTo(tagLabel.snp.bottom).offset(self.view.frame.height/80)
            make.left.equalTo(tagLabel)
            make.height.equalToSuperview().dividedBy(18.88)
            make.width.equalToSuperview().dividedBy(2.95) //dynamic width
        }
        repeatTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(selectedTagButton)
            make.top.equalTo(selectedTagButton.snp.bottom).offset(self.view.frame.height/40.6)
        }
        noRepeatButton.snp.makeConstraints { make in
            make.top.equalTo(repeatTitleLabel.snp.bottom).offset(self.view.frame.height/80)
            make.left.equalTo(repeatTitleLabel)
            make.height.equalToSuperview().dividedBy(18.88)
            make.width.equalToSuperview().dividedBy(2.95)
        }
        repeatDayCollectionView.snp.makeConstraints { make in
            make.top.equalTo(repeatTitleLabel.snp.bottom).offset(self.view.frame.height/80)
            make.left.equalTo(repeatTitleLabel)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(25.3)
        }
        notificationTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(noRepeatButton)
            make.top.equalTo(noRepeatButton.snp.bottom).offset(self.view.frame.height/40.6)
        }
        notificationButton.snp.makeConstraints { make in
            make.top.equalTo(notificationTitleLabel.snp.bottom).offset(self.view.frame.height/80)
            make.left.equalTo(notificationTitleLabel)
            make.height.equalToSuperview().dividedBy(18.88)
            make.width.equalToSuperview().dividedBy(4.07)
        }
    }
}

extension MyToDoDetailViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.height / 25.375, height: self.view.frame.height / 25.375)
    }
}

extension MyToDoDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dayLabelText.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonalPlanDetailRepeatDayCollectionViewCell.reuseId, for: indexPath) as! PersonalPlanDetailRepeatDayCollectionViewCell
        
        cell.dayLabel.text = dayLabelText[indexPath.row]
        
        return cell
    }
}
