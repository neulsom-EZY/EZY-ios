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

class AddMyToDoViewController:UIViewController{
    private let tagData : [String] = ["전공동아리","산책","자율동아리","공부","자율동아리","전공동아리","전공동아리","산책","자율동아리","공부","자율동아리","전공동아리","산책"]
    private var alarmData  = "추가"
    private let tagColor : [UIColor] = [.rgb(red: 135, green: 159, blue: 255),.rgb(red: 150, green: 141, blue: 255),.rgb(red: 158, green: 177, blue: 252)]
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
    
    private let calendarBtn = CalendarAlertBtn(icon: (UIImage(named: "EZY_Calendar")?.withRenderingMode(.alwaysTemplate))!, iconColor: .rgb(red: 255, green: 181, blue: 181), titleText: "2021.6.6 일요일", repeatText: "월, 화, 수").then {
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
        button.color = .EZY_BAC8FF
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
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        alarmSettingcollectionView.delegate = self
        alarmSettingcollectionView.dataSource = self
    }
    //MARK: - AddView
    private func addView(){
        view.addSubview(backbutton)
        view.addSubview(TitleLabel)
        view.addSubview(btnStackView)
        view.addSubview(tagLabel)
        view.addSubview(tagCollectionView)
        view.addSubview(addButton)
        view.addSubview(alarmSettings)
        view.addSubview(alarmSettingcollectionView)
        view.addSubview(titleContainerView)
        view.addSubview(explanationContainerView)
    }
    //MARK: - CornerRadius
    private func cornerRadius(){
        titleContainerView.layer.cornerRadius = view.frame.height/40.6
        addButton.layer.cornerRadius = view.frame.height/81.2
        explanationContainerView.layer.cornerRadius = view.frame.height/40.6
    }
    //MARK: - Alarm Setting Function
    func alarmReloadSetting(_ ampm: String,_ time: Int,_ minute: Int){
        alarmData = "\(ampm) \(time):\(minute)"
        alarmSettingcollectionView.reloadData()
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
            $0.top.equalTo(tagLabel.snp.bottom).offset(bounds.height/58)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(bounds.height/10.54)
        }
       
        alarmSettings.snp.makeConstraints {
            $0.left.equalTo(backbutton.snp.left)
            $0.top.equalTo(tagCollectionView.snp.bottom).offset(bounds.height/36.91)
        }
        alarmSettingcollectionView.snp.makeConstraints {
            $0.top.equalTo(alarmSettings.snp.bottom).offset(bounds.height/58)
            $0.height.equalTo(bounds.height/23.7)
            $0.left.right.equalToSuperview()
        }
        
        addButton.snp.makeConstraints {
            $0.top.equalTo(alarmSettingcollectionView.snp.bottom).offset(bounds.height/38.67)
            $0.height.equalTo(bounds.height/18.0)
            $0.left.right.equalToSuperview().inset(bounds.width/13.636363)
        }
    }

}
//MARK: - extension
extension AddMyToDoViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.tagCollectionView{
            return tagData.count
        }else if collectionView == self.alarmSettingcollectionView{
            return 2
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.tagCollectionView{
            let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.identifier, for: indexPath) as! TagCell
            tagCell.isSelected = false
            tagCell.layer.borderWidth = 1
            tagCell.bglabel.text = tagData[indexPath.row]
            tagCell.bglabel.textColor = tagColor.randomElement()
            tagCell.layer.borderColor = tagCell.bglabel.textColor.cgColor
            tagCell.layer.cornerRadius = tagCell.frame.height/2
            if indexPath.item == 0 {
                tagCell.bglabel.text = "선택해제"
                tagCell.bglabel.textColor = .rgb(red: 183, green: 180, blue: 180)
                tagCell.layer.borderColor = UIColor.rgb(red: 201, green: 201, blue: 201).cgColor
            }
            if indexPath.item == 2{
                tagCell.bglabel.text = "+ 추가"
                tagCell.bglabel.textColor = .EZY_BAC8FF
                tagCell.layer.borderColor = UIColor.EZY_BAC8FF.cgColor
            }
            return tagCell
        }else{
            let alarmCell = collectionView.dequeueReusableCell(withReuseIdentifier: AlarmSettingCell.identifier, for: indexPath) as! AlarmSettingCell
            alarmCell.layer.borderWidth = 1
            alarmCell.layer.borderColor = UIColor.rgb(red: 207, green: 207, blue: 207).cgColor
            alarmCell.layer.cornerRadius = view.frame.height/81.2
            alarmCell.bglabel.text = alarmData
            alarmCell.bglabel.textColor = .rgb(red: 183, green: 180, blue: 180)
            if indexPath.item == 0{
                alarmCell.bglabel.text = "선택안함"
            }
            return alarmCell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.tagCollectionView{
            return CGSize(width: view.frame.height/9.66, height: view.frame.height/25.375)
        }else{
            return CGSize(width: view.frame.height/9.78, height: view.frame.height/23.88)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.tagCollectionView{
            return view.frame.height/50.973
        }else if collectionView == self.alarmSettingcollectionView{
            return view.frame.height/47.76
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let item = collectionView.cellForItem(at: indexPath)
            if item?.isSelected ?? false {
                collectionView.deselectItem(at: indexPath, animated: true)
            } else {
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
                return true
            }
            return false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.tagCollectionView {

        }else {
            if indexPath.item == 0{ }
            else if indexPath.item == indexPath.last{
                let MoreCalendarModalsVC = MoreAlarmModelViewController.instance()
                MoreCalendarModalsVC.delegate = self
                addDim()
                present(MoreCalendarModalsVC, animated: true, completion: nil)
                collectionView.deselectItem(at: indexPath, animated: true)
                AlarmSettingCell().isSelected = false
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
