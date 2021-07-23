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
    let tagData : [String] = ["전공동아리","산책","자율동아리","공부","자율동아리","전공동아리","전공동아리","산책","자율동아리","공부","자율동아리","전공동아리","산책"]
    let repeatData : [String] = ["+","S","M","T","W","T","F","S"]
    let alarmData : [String] = ["선택안함", "추가"]
    //MARK: - Properties
    let scrollView = UIScrollView().then  {
        $0.backgroundColor = .white
        
    }
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_BAC8FF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(todobackbtn), for: .touchUpInside)

    }
    private let TitleLabel = UILabel().then{
        $0.textColor = .EZY_BAC8FF
        $0.text = "나의 할 일 추가"
        $0.dynamicFont(fontSize: 22, weight: .semibold)
    }
    
    private lazy var titleContainerView : UIView = {
        let title = "제목"
        let view = Utilities().inputContainerView(withMessage: title, textField: titleTextField, color: .EZY_F4F6FF,viewSize: Double(view.frame.height))
        return view
    }()
    
    private let titleTextField : UITextField = {
        let tf = Utilities().textField(textColor: .EZY_656565, textSize: 14,font: .medium)
        return tf
    }()
    
    
    private let calendarBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_calendar")?.withRenderingMode(.alwaysTemplate), iconTintColor: .EZY_FFB5B5, message: "2021.6.6 일요일")
        let button = AlertButton(with: viewModel)
        button.addTarget(self, action: #selector(calendarAlert), for: .touchUpInside)
        return button
    }()
    private let clockBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_clock")?.withRenderingMode(.alwaysTemplate), iconTintColor: .EZY_FFCBB5, message: "11:00AM - 1:00PM")
        let button = AlertButton(with: viewModel)
        button.addTarget(self, action: #selector(clockAlert), for: .touchUpInside)
        return button
    }()
    
    private let locationBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_location")?.withRenderingMode(.alwaysTemplate), iconTintColor: .EZY_C7E0D4, message: "광주소프트웨어마이스터고등학교")
        let button = AlertButton(with: viewModel)
        button.addTarget(self, action: #selector(locationAlert), for: .touchUpInside)
        return button
    }()
    
    private lazy var explanationContainerView : UIView = {
        let title = "설명"
        let view = Utilities().inputContainerTextView(withMessage: title, textView: explanationTextView, Color: .EZY_F6F3FF, viewSize: Double(view.frame.height))

        return view
    }()
    
    private let explanationTextView : UITextView = {
        let tf = Utilities().textView(TextColor: .EZY_929292, TextSize: 14,font: .medium)
        return tf
    }()
    
    
    
    private let tagLabel = UILabel().then{
        $0.text = "태그"
        $0.textColor = .EZY_B6B6B6
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }
    
    private let repeatSettings  = UILabel().then{
        $0.text = "반복 설정"
        $0.textColor = .EZY_B6B6B6
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }
    private let alarmSettings = UILabel().then{
        $0.text = "알림 설정"
        $0.textColor = .EZY_B6B6B6
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }
    
    private let addButton : AdditionalButton = {
        let button = AdditionalButton(type: .system)
        button.title = "추가"
        button.addTarget(self, action: #selector(Addmytodobtn), for: .touchUpInside)
        return button
    }()
    fileprivate let tagcollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    fileprivate let repeatSettingcollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    fileprivate let alarmSettingcollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tagcollectionView.dataSource = self
        tagcollectionView.delegate = self
        tagcollectionView.allowsMultipleSelection = true
        repeatSettingcollectionView.dataSource = self
        repeatSettingcollectionView.delegate = self
        alarmSettingcollectionView.delegate = self
        alarmSettingcollectionView.dataSource = self
    }

    
    //MARK: - Selectors
    
    @objc func todobackbtn(){
        //전페이지로 되돌아가는 버튼
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    
    
    @objc func calendarAlert(){
        // 날짜 Alert를 실행시킬 부분
        
    }
    @objc func clockAlert(){
        //시간 Alert를 실행시킬 부분
    }
    @objc func locationAlert(){
        //위치 Alert 실행시킬 부분
    }
    
    @objc func Addmytodobtn(){
        print("DEBUG:AddButton")
        //추가페이지 작성후 실행시키는 코드
        
    }
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        tagcollectionView.contentInset = UIEdgeInsets(top: 0, left: view.frame.height/29, bottom: 0, right: 0)
        repeatSettingcollectionView.contentInset = UIEdgeInsets(top: 0, left: view.frame.height/29, bottom: 0, right: 0)
        alarmSettingcollectionView.contentInset = UIEdgeInsets(top: 0, left: view.frame.height/29, bottom: 0, right: 0)

        addView()
        cornerRadius()
        location()

    }
    
   
    
    func addView(){
        view.addSubview(scrollView)
        scrollView.addSubview(backbutton)
        scrollView.addSubview(TitleLabel)
        scrollView.addSubview(titleContainerView)
        scrollView.addSubview(calendarBtn)
        scrollView.addSubview(clockBtn)
        scrollView.addSubview(locationBtn)
        scrollView.addSubview(explanationContainerView)
        scrollView.addSubview(tagLabel)
        scrollView.addSubview(tagcollectionView)
        scrollView.addSubview(addButton)
        scrollView.addSubview(repeatSettings)
        scrollView.addSubview(repeatSettingcollectionView)
        scrollView.addSubview(alarmSettings)
        scrollView.addSubview(alarmSettingcollectionView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.height/0.9165)
    }
    
    func cornerRadius(){
        titleContainerView.layer.cornerRadius = view.frame.height/40.6
        addButton.layer.cornerRadius = view.frame.height/81.2
        explanationContainerView.layer.cornerRadius = view.frame.height/40.6
    }
    
    func location(){
        scrollView.snp.makeConstraints { (make) in
            make.top.bottom.right.left.equalToSuperview()
        }
        backbutton.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/33.8)
            make.left.equalTo(self.view.frame.height/29)
            make.top.equalTo(self.scrollView.snp.top ).offset(self.view.frame.height/36.9)
        }
        TitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backbutton.snp.bottom).offset(self.view.frame.height/39.5)
            make.left.equalTo(backbutton.snp.left)
        }
        titleContainerView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/14.7)
            make.top.equalTo(TitleLabel.snp.bottom).offset(self.view.frame.height/19.8)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(view.snp.right).offset(self.view.frame.height/19.8 * -1)
        }
        calendarBtn.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/18.0)
            make.width.equalTo(view.frame.height/3.14)
            make.right.equalTo(view.snp.right).offset(view.frame.height/9.23 * -1)
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(titleContainerView.snp.bottom).offset(view.frame.height/30.1)
        }
        clockBtn.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/18.0)
            make.right.equalTo(view.snp.right).offset(view.frame.height/9.23 * -1)
            make.width.equalTo(view.frame.height/3.14)
            make.left.equalTo(calendarBtn.snp.left)
            make.top.equalTo(calendarBtn.snp.bottom).offset(view.frame.height/47.7)
        }
        locationBtn.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/18.0)
            make.right.equalTo(view.snp.right).offset(view.frame.height/9.23 * -1)
            make.width.equalTo(view.frame.height/3.14)
            make.left.equalTo(calendarBtn.snp.left)
            make.top.equalTo(clockBtn.snp.bottom).offset(view.frame.height/47.7)
        }
        explanationContainerView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/10.8)
            make.top.equalTo(locationBtn.snp.bottom).offset(self.view.frame.height/19.8)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(titleContainerView.snp.right)
        }
        tagLabel.snp.makeConstraints { (make) in
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(explanationContainerView.snp.bottom).offset(view.frame.height/38.6)
        }
        tagcollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(tagLabel.snp.bottom).offset(view.frame.height/47.76)
            make.height.equalTo(view.frame.height/10.55)
            make.width.equalToSuperview()
        }
        repeatSettings.snp.makeConstraints { (make) in
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(tagcollectionView.snp.bottom).offset(view.frame.height/33.83)
        }
        repeatSettingcollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(repeatSettings.snp.bottom).offset(view.frame.height/45.11)
            make.height.equalTo(view.frame.height/28)
            make.width.equalToSuperview()
        }
        alarmSettings.snp.makeConstraints { (make) in
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(repeatSettingcollectionView.snp.bottom).offset(view.frame.height/36.91)
        }
        alarmSettingcollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(alarmSettings.snp.bottom).offset(view.frame.height/58)
            make.height.equalTo(view.frame.height/23.88)
            make.width.equalToSuperview()
        }
        
        addButton.snp.makeConstraints { (make) in
            make.top.equalTo(alarmSettingcollectionView.snp.bottom).offset(view.frame.height/30.074)
            make.height.equalTo(self.view.frame.height/18.0)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(titleContainerView.snp.right)
        }
    }
}
extension AddMyToDoViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.tagcollectionView{
            return tagData.count
        }
        else if collectionView == self.repeatSettingcollectionView{
            return repeatData.count
        }
        else if collectionView == self.alarmSettingcollectionView{
            return alarmData.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else {return UICollectionViewCell()}
        cell.backgroundColor = .blue
    return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.tagcollectionView{
            return CGSize(width:view.frame.height/9.66, height: view.frame.height/25.375)
        }
        else if collectionView == self.repeatSettingcollectionView{
            return CGSize(width: view.frame.height/28.96, height: view.frame.height/28)
        }
        else{
            return CGSize(width: view.frame.height/9.78, height: view.frame.height/23.88)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.tagcollectionView{
            return view.frame.height/50.81
        }
        else if collectionView == self.repeatSettingcollectionView{
            return view.frame.height/64.60
        }
        else{
            return view.frame.height/47.76
        }
    }
}


