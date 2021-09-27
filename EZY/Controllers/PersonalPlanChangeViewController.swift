//
//  RescheduleViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/19.
//

import UIKit

class PersonalPlanChangeViewController: UIViewController {

    //MARK: - Properties
    private var RepeatModels: [RepeatCollectionViewModel] = [RepeatCollectionViewModel(backgroundColr: UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1),                                                          isSelected: false),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: true),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: true),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: true),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: true),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: true),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: true),
                                                     RepeatCollectionViewModel(backgroundColr: UIColor(red: 255/255, green: 188/255, blue: 188/255, alpha: 1), isSelected: true)]
    
    private var TagColorModels: [TagColorCollectionViewModel] = [TagColorCollectionViewModel(backgroundColor: UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: false),
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
    
    private var TagModels: [TagCollectionViewModel] = [TagCollectionViewModel(backgroundColor: UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true),
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
        
    private var bounds = UIScreen.main.bounds
    
    private var startPickerViewText = [["1","2","3","4","5","6","7","8","9","10","11","12"],["00","05","10","15","20","25","30","35","40","45","50","55"]]
    
    private var dayPickerViewText1 = ["Sun","Mon","Tue","Wed","Thr","Fri","Sat","Mon","Tue","Wed","Thr","Fri","Mon","Tue","Wed","Thr","Fri"]
    
    private var dayPickerViewText2 = ["12","3","4","5","6","7","2","3","4","5","6","7","2","3","4","5","6","7"]
    
    private var tagNameTextArray = ["공부", "산책", "토익", "코딩", "요리", "운동", "정리", "청소","공부", "산책", "토익", "코딩", "요리", "운동", "정리", "청소","공부", "산책", "토익", "코딩", "요리", "운동", "정리", "청소","공부", "산책", "토익", "코딩", "요리", "운동", "정리", "청소"]
    
    private var dayArray = ["24","25","26","27","28","29","30","1","2","3","24","25","26","27","28","29","30","1","2","3"]
    
    private var dayOfTheWeekArray = ["S","M","T","W","T","F","S","S","M","T","S","M","T","W","T","F","S","S","M","T"]
    
    private var RepeatDayOfTheWeekArray = ["","S","M", "T","W","T","F","S"]
    
    private var startSelectCircleButtonLocation = "Left"
    
    private var endSelectCircleButtonLocation = "Left"
    
    private var selectedTimeEndAMPM = "AM"
    
    private var selectedTimeStartAMPM = "AM"
    
    private var selectedRepeatText = ""
    
    private var selectedDayRow = 0
    
    private var selectedTimeStartHourIndex = 0
    
    private var selectedTimeStartMinIndex = 0
    
    private var selectedTimeEndHourIndex = 0
    
    private var selectedTimeEndMinIndex = 0
    
    private var selectedRepeatRow = [Int]()
    
    private var tagColorPreciousSelectedIndex = 0
    
    private var tagPreciousSelectedIndex = 2
    
    var rotationAngle: CGFloat!
    
    private let tagCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.reuseId)
    }
    
    private let startTimeTableView = UITableView().then{
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
    }
    
    private let endTimeTableView = UITableView().then{
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
    }
    
    private let titleBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 244/255, green: 246/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "제목"
        $0.textColor = UIColor(red: 128/255, green: 153/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let titleTextField = UITextField().then {
        $0.text = "강아지 산책 시키기"
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let tagLabel = UILabel().then {
        $0.text = "태그"
        $0.textColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let changeButton = UIButton().then {
        $0.setTitle("변 경", for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private let mainTitleLabel = UILabel().then{
        $0.text = "나의 할 일 변경"
        $0.textColor = UIColor(red: 154/255, green: 174/255, blue: 254/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private let notificationTitleLabel = UILabel().then {
        $0.text = "알림 설정"
        $0.textColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_LocationBackButton"), for: .normal)
    }
    
    private let calendarBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_Calendar")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 255, green: 181, blue: 181), message: "2021.6.6 일요일")
        let button = AlertButton(with: viewModel)
        button.addTarget(self, action: #selector(calendarAlert), for: .touchUpInside)
        return button
    }()
    private let clockBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_clock")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 255, green: 203, blue: 181), message: "11:00AM - 1:00PM")
        let button = AlertButton(with: viewModel)
        button.addTarget(self, action: #selector(clockAlert), for: .touchUpInside)
        return button
    }()
    
    private let locationBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_Location")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 199, green: 224, blue: 212), message: "광주소프트웨어마이스터고등학교")
        let button = AlertButton(with: viewModel)
        button.addTarget(self, action: #selector(locationAlert), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var btnStackView = UIStackView(arrangedSubviews: [calendarBtn,clockBtn,locationBtn]).then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = bounds.height/47.7647
    }
    
    private let explanationContainerView : ExplanationContainerTextView = {
        let view = ExplanationContainerTextView(tvTitle: "설명")
        return view
    }()
    
    //MARK: - lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        configureUI()
    }
    
    //MARK: - helpers
    func configureUI(){
        addView()
        
        addTarget()
        
        addLayout()
        
        addRegister()
    }
    
    //MARK: - addRegister
    func addRegister(){
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
    }
    
    //MARK: - addLayout
    func addLayout(){
        self.view.backgroundColor = .white
        
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
        
        btnStackView.snp.makeConstraints {
            $0.top.equalTo(titleBackgroundView.snp.bottom).offset(bounds.height/30.1)
            $0.left.equalTo(mainTitleLabel.snp.left)
            $0.right.equalToSuperview().inset(bounds.height/9.23)
            $0.height.equalTo(bounds.height/4.805)
        }
        
        explanationContainerView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/10.8)
            make.top.equalTo(btnStackView.snp.bottom).offset(self.view.frame.height/30.0)
            make.left.equalTo(backButton.snp.left)
            make.right.equalTo(self.view.frame.width/13.8 * -1)
        }
        
        tagLabel.snp.makeConstraints { (make) in
            make.left.equalTo(backButton.snp.left)
            make.top.equalTo(explanationContainerView.snp.bottom).offset(view.frame.height/42.74)
        }
        
        tagCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tagLabel.snp.bottom).offset(self.view.frame.height/60)
            make.left.equalTo(tagLabel)
            make.height.equalToSuperview().dividedBy(10)
            make.right.equalToSuperview()
        }
        
        notificationTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(tagCollectionView)
            make.top.equalTo(tagCollectionView.snp.bottom).offset(self.view.frame.height/38.6)
        }
    }
    
    //MARK: - addTarget
    func addTarget(){
        changeButton.addTarget(self, action: #selector(changeButtonClicked(sender:)), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
    }
    
    //MARK: - addView
    func addView(){
        self.view.addSubview(backButton)
        self.view.addSubview(mainTitleLabel)
        self.view.addSubview(notificationTitleLabel)
        self.view.addSubview(titleBackgroundView)
        self.view.addSubview(btnStackView)
        self.view.addSubview(explanationContainerView)
        titleBackgroundView.addSubview(titleLabel)
        titleBackgroundView.addSubview(titleTextField)
        self.view.addSubview(tagLabel)
        self.view.addSubview(changeButton)
        self.view.addSubview(tagCollectionView)
        

    }

    //MARK: - selectors
    @objc func calendarAlert(){
        print("calendarAlert - calendar alert appear")
    }
    
    @objc func clockAlert(){
        print("clockAlert - clock alert appear")
    }
    
    @objc func locationAlert(){
        print("locationAlert - location alert appear")
    }
    
    @objc func locationViewButtonClicked(sender:UIButton){
        let nextViewController = SelectLocationViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func changeButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
}


//MARK: - extension
extension PersonalPlanChangeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TagModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath == [0,2]{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.reuseId, for: indexPath) as! TagCollectionViewCell
            
            cell.tagNameLabel.text = "선택 안 함"
            cell.tagNameLabel.textColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
            cell.tagBackgroundView.backgroundColor = .white
            cell.tagBackgroundView.layer.borderWidth = 1.3
            cell.tagBackgroundView.layer.borderColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1).cgColor
            
            cell.setModel(TagModels[indexPath.row])
            
            return cell
        }else if indexPath == [0,0]{
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/4.4, height: self.view.frame.height/23)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath == [0,0]{
            print("tagAddModal appear")
        }else{
            // 이전에 선택되어있던 cell 선택 해제
            for i in 0...TagModels.count-1{
                if TagModels[i].isSelected == false{
                    TagModels[i].isSelected.toggle()
                }
            }

            // 클릭한 cell 선택
            TagModels[indexPath.row].isSelected.toggle()
            
            collectionView.reloadData()
        }
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
            cell.backgroundColor = .clear
            cell.selectionStyle = .none

            return cell
        }else if tableView == endTimeTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: EndTimeTableViewCell.reuseId, for: indexPath) as! EndTimeTableViewCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none

            return cell
        }
        return UITableViewCell()
    }
}
