//
//  AddToDoViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/05/31.
//

import UIKit
import SnapKit
import Then
import Alamofire

class AddMyToDoViewController: UIViewController{
     let tagData : [CollectionViewModel] = [CollectionViewModel(backgroundColor: .EZY_968DFF,
                                                                       iconImage: UIImage(named: "EZY_GroupAddButton")?.withRenderingMode(.alwaysTemplate),
                                                                       textData: nil),
                                                   CollectionViewModel(backgroundColor: UIColor.rgb(red: 144, green: 144, blue: 144),
                                                                       iconImage: UIImage(named: "EZY_GroupModalViewHideButton")?.withRenderingMode(.alwaysTemplate),
                                                                       textData: nil),
                                                   CollectionViewModel(backgroundColor: UIColor.rgb(red: 135, green: 159, blue: 255),  iconImage: nil, textData: "STUDY"),
                                                   CollectionViewModel(backgroundColor: UIColor.rgb(red: 135, green: 159, blue: 255), iconImage: nil, textData: "PROGRAMMING"),
                                                   CollectionViewModel(backgroundColor: .EZY_968DFF, iconImage: nil, textData: "STUDY"),
                                                   CollectionViewModel(backgroundColor: UIColor.rgb(red: 135, green: 159, blue: 255),  iconImage: nil, textData: "PROGRAMMING"),
                                                   CollectionViewModel(backgroundColor: UIColor.rgb(red: 135, green: 159, blue: 255), iconImage: nil, textData: "MEETING")]
    
    
    var alarmData : [CollectionViewModel] = [CollectionViewModel(backgroundColor: .EZY_968DFF,
                                                                  iconImage: UIImage(named: "EZY_GroupAddButton")?.withRenderingMode(.alwaysTemplate),
                                                                         textData: nil),
                                              CollectionViewModel(backgroundColor: UIColor.rgb(red: 144, green: 144, blue: 144), iconImage: UIImage(named: "EZY_GroupModalViewHideButton")?.withRenderingMode(.alwaysTemplate), textData: nil)]
    //MARK: - Properties
    
    let bounds = UIScreen.main.bounds
    
    //MARK: - 모달 background 설정
    private let bgView = UIView().then {
        $0.backgroundColor = .black
        $0.alpha = 0
    }
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_BAC8FF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(todobackbtn), for: .touchUpInside)
    }
    private let TitleLabel = UILabel().then{
        $0.textColor = .EZY_BAC8FF
        $0.text = "나의 할 일 추가"
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
    }

    private let titleContainerView = TitleContainerTextFieldView(tfTitle: "제목")
    
    private let calendarBtn = CalendarAlertBtn(icon: (UIImage(named: "EZY_Calendar")?.withRenderingMode(.alwaysTemplate))!, iconColor: .rgb(red: 255, green: 181, blue: 181), titleText: "2021.6.6 일요일", repeatText: "반복 없음").then {
        $0.addTarget(self, action: #selector(calendarAlert), for: .touchUpInside)
    }
    private let clockBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_clock")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 255, green: 203, blue: 181), message: "11:00AM - 1:00PM")
        let button = AlertButton(with: viewModel)
        button.addTarget(self, action: #selector(clockAlert), for: .touchUpInside)
        return button
    }()
    
    private let locationBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_location")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 199, green: 224, blue: 212), message: "광주소프트웨어마이스터고등학교")
        let button = AlertButton(with: viewModel)
        button.addTarget(self, action: #selector(locationAlert), for: .touchUpInside)
        return button
    }()
    
    //MARK: - StackView
    private lazy var btnStackView = UIStackView(arrangedSubviews: [calendarBtn,clockBtn,locationBtn]).then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = bounds.height/47.7647
    }

    private let explanationContainerView : ExplanationContainerTextView = {
        let view = ExplanationContainerTextView(tvTitle: "설명")
        return view
    }()
    
    
    private let tagLabel = UILabel().then{
        $0.text = "태그"
        $0.textColor = .rgb(red: 182, green: 182, blue: 182)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let repeatSettings  = UILabel().then{
        $0.text = "반복 설정"
        $0.textColor = .rgb(red: 182, green: 182, blue: 182)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    private let alarmSettings = UILabel().then{
        $0.text = "알림 설정"
        $0.textColor = .rgb(red: 182, green: 182, blue: 182)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let addButton : AdditionalButton = {
        let button = AdditionalButton(type: .system)
        button.title = "추가"
        button.color = .rgb(red: 150, green: 141, blue: 255)
        button.addTarget(self, action: #selector(Addmytodobtn), for: .touchUpInside)
        return button
    }()

    private let tagCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero,collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TagCell.self, forCellWithReuseIdentifier: TagCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()

    private let alarmSettingcollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(AlarmSettingCell.self, forCellWithReuseIdentifier: AlarmSettingCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    
    //MARK: - Selectors
    
    @objc private func todobackbtn(){
        //전페이지로 되돌아가는 버튼
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc private func calendarAlert(){
        // 날짜 Alert를 실행시킬 부분
        
    }
    @objc private func clockAlert(){
        //시간 Alert를 실행시킬 부분
    }
    @objc private func locationAlert(){
        //위치 Alert 실행시킬 부분
    }
    
    @objc private func Addmytodobtn(){
        print("DEBUG:AddButton")
        //추가페이지 작성후 실행시키는 코드
    }
    
    //MARK: - Helpers
    //모달 위치
    static func instance() -> AddMyToDoViewController {
        return AddMyToDoViewController(nibName: nil, bundle: nil)
    }
    //모달 실행시 Action
    private func addDim() {
        view.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        DispatchQueue.main.async { [weak self] in
            self?.bgView.alpha = 0.2
        }
    }
    //모달 취소시 Action
    private func removeDim() {
        DispatchQueue.main.async { [weak self] in
            self?.bgView.removeFromSuperview()
        }
    }
    //MARK: - Helper
    private func configureUI(){
        view.backgroundColor = .white
        tagCollectionView.contentInset = UIEdgeInsets(top: 0, left: view.frame.height/29, bottom: 0, right: view.frame.height/29)
        alarmSettingcollectionView.contentInset = UIEdgeInsets(top: 0, left: view.frame.height/29, bottom: 0, right: 0)
        addView()
        cornerRadius()
        collectionViewDataSourceAndDelegate()
        location()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    //MARK: - CollectionView DataSource & Delegate
    private func collectionViewDataSourceAndDelegate(){
        [tagCollectionView,alarmSettingcollectionView].forEach { $0.delegate = self; $0.dataSource = self}
    }
    
    //MARK: - AddView
    private func addView(){
        [backbutton,TitleLabel,btnStackView,tagLabel,tagCollectionView,addButton,alarmSettings,alarmSettingcollectionView,titleContainerView,explanationContainerView].forEach {view.addSubview($0)}
    }
    //MARK: - CornerRadius
    private func cornerRadius(){
        titleContainerView.layer.cornerRadius = view.frame.height/40.6
        addButton.layer.cornerRadius = view.frame.height/81.2
        explanationContainerView.layer.cornerRadius = view.frame.height/40.6
    }
    //MARK: - Alarm Setting Function
    func alarmReloadSetting(_ ampm: String,_ time: Int,_ minute: Int){
        alarmData[0].textData = "\(ampm) \(time):\(String(format: "%02d", minute))"
        alarmSettingcollectionView.reloadData()
        alarmData[0].iconImage = nil
    }
    //MARK: - Location
    private func location(){
        backbutton.snp.makeConstraints {
            $0.height.width.equalTo(bounds.height/33.8)
            $0.left.equalTo(bounds.height/29)
            $0.top.equalToSuperview().offset(bounds.height/13.3)
        }
        TitleLabel.snp.makeConstraints {
            $0.top.equalTo(backbutton.snp.bottom).offset(bounds.height/30.07)
            $0.left.equalTo(backbutton.snp.left)
        }
        titleContainerView.snp.makeConstraints {
            $0.height.equalTo(bounds.height/14.7)
            $0.top.equalTo(TitleLabel.snp.bottom).offset(bounds.height/30.07)
            $0.left.equalTo(backbutton.snp.left)
            $0.right.equalTo(view.snp.right).offset(bounds.height/19.8 * -1)
        }
        btnStackView.snp.makeConstraints {
            $0.top.equalTo(titleContainerView.snp.bottom).offset(bounds.self.height/42.74)
            $0.left.equalTo(backbutton.snp.left)
            $0.right.equalToSuperview().inset(bounds.height/9.23)
            $0.height.equalTo(bounds.height/4.805)
        }
        explanationContainerView.snp.makeConstraints {
            $0.height.equalTo(bounds.height/10.8)
            $0.top.equalTo(locationBtn.snp.bottom).offset(bounds.height/45.11)
            $0.left.equalTo(backbutton.snp.left)
            $0.right.equalTo(titleContainerView.snp.right)
        }
        tagLabel.snp.makeConstraints {
            $0.left.equalTo(backbutton.snp.left)
            $0.top.equalTo(explanationContainerView.snp.bottom).offset(bounds.height/42.74)
        }
        tagCollectionView.snp.makeConstraints {
            $0.top.equalTo(tagLabel.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(bounds.height/11)
        }
       
        alarmSettings.snp.makeConstraints {
            $0.left.equalTo(backbutton.snp.left)
            $0.top.equalTo(tagCollectionView.snp.bottom)
        }
        alarmSettingcollectionView.snp.makeConstraints {
            $0.top.equalTo(alarmSettings.snp.bottom)
            $0.height.equalTo(bounds.height/11.76)
            $0.left.right.equalToSuperview()
        }
        
        addButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(bounds.height/33.8333)
            $0.height.equalTo(bounds.height/18.0)
            $0.left.right.equalToSuperview().inset(bounds.width/13.636363)
        }
    }

}

//MARK: - extension
extension AddMyToDoViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tagCollectionView{
            return tagData.count
        }else{
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagCollectionView{
            guard let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.identifier, for: indexPath ) as? TagCell else{ return UICollectionViewCell()}
            tagCell.iv.image = tagData[indexPath.row].iconImage
            tagCell.backgroundColor = tagData[indexPath.row].backgroundColor
            tagCell.iv.tintColor = tagData[indexPath.row].backgroundColor
            tagCell.bglabel.text = tagData[indexPath.row].textData
            tagCell.bglabel.textColor = tagData[indexPath.row].backgroundColor
            return tagCell
        }else{
            guard let alarmCell = collectionView.dequeueReusableCell(withReuseIdentifier: AlarmSettingCell.identifier, for: indexPath) as? AlarmSettingCell else {return UICollectionViewCell()}
            alarmCell.iv.image = alarmData[indexPath.row].iconImage
            alarmCell.backgroundColor = alarmData[indexPath.row].backgroundColor
            alarmCell.bglabel.text = alarmData[indexPath.row].textData
            alarmCell.iv.tintColor = alarmData[indexPath.row].backgroundColor
            return alarmCell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return bounds.width/34.1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //MARK: - Cell Dynamic width
        let label = UILabel().then{
            $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        }
        if collectionView == tagCollectionView{
            label.text = tagData[indexPath.row].textData
            label.sizeToFit()
            return CGSize(width: label.frame.width + bounds.height/18.88, height: bounds.height/18.88)
        }
        else{
            label.text = alarmData[indexPath.row].textData
            label.sizeToFit()
            return CGSize(width: label.frame.width + bounds.height/18.88, height: bounds.height/18.88)
        }

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == alarmSettingcollectionView{
            if indexPath.item == indexPath.first{
                let MoreCalendarModalsVC = MoreAlarmModelViewController.instance()
                MoreCalendarModalsVC.delegate = self
                addDim()
                present(MoreCalendarModalsVC, animated: true, completion: nil)
                AlarmSettingCell().isSelected = false
                collectionView.deselectItem(at: indexPath, animated: true)
            }
        }
    }
}

extension AddMyToDoViewController : AlarmModelDelegate{
    func updateData(ampm: String, time: Int, minute: Int) {
        self.alarmReloadSetting(ampm, time + 1, minute)
    }
    func onTapClose() {
        self.removeDim()
    }
}

