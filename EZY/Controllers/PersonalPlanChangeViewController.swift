//
//  RescheduleViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/19.
//

import UIKit

class PersonalPlanChangeViewController: UIViewController, UIGestureRecognizerDelegate{

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
        
    private lazy var selectCalendarModalView = SelectCalendarModalView().then{
        rotationAngle = 90 * ( .pi/180 )
        $0.dayPickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        $0.isHidden = true
    }
    
    private let selectTimeModalView = SelectTimeModalView().then{
        $0.isHidden = true
    }
    
    private let tagAddModalView = TagAddModalView().then{
        $0.isHidden = true
    }
    
    fileprivate var selectedTimeStartHourIndex = 0
    
    fileprivate var selectedTimeEndHourIndex = 0

    
    private var bounds = UIScreen.main.bounds
    
    var rotationAngle: CGFloat!
    
    lazy var dayPickerViewText1 = ["Sun","Mon","Tue","Wed","Thr","Fri","Sat","Mon","Tue","Wed","Thr","Fri","Mon","Tue","Wed","Thr","Fri"]
    
    lazy var dayPickerViewText2 = ["12","3","4","5","6","7","2","3","4","5","6","7","2","3","4","5","6","7"]
    
    lazy var startPickerViewText = [["1","2","3","4","5","6","7","8","9","10","11","12"],["00","05","10","15","20","25","30","35","40","45","50","55"]]
    
    
    private var tagNameTextArray = ["공부", "산책", "토익", "코딩", "요리", "운동", "정리", "청소","공부", "산책", "토익", "코딩", "요리", "운동", "정리", "청소","공부", "산책", "토익", "코딩", "요리", "운동", "정리", "청소","공부", "산책", "토익", "코딩", "요리", "운동", "정리", "청소"]
    
    private let tagCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.reuseId)
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
        $0.addTarget(self, action: #selector(changeButtonClicked(sender:)), for: .touchUpInside)
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
    
    private let notificationButton = UIButton().then{
        $0.setTitle("선택 안 함", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.backgroundColor = UIColor.rgb(red: 253, green: 253, blue: 253)
        $0.setTitleColor(UIColor.rgb(red: 182, green: 182, blue: 182), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 207, green: 207, blue: 207).cgColor
        $0.layer.cornerRadius = 10
    }
    
    private let notificationAddButton = UIButton().then{
        $0.setTitle("+ 추가", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.backgroundColor = UIColor.rgb(red: 253, green: 253, blue: 253)
        $0.setTitleColor(UIColor.rgb(red: 182, green: 182, blue: 182), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.rgb(red: 207, green: 207, blue: 207).cgColor
        $0.layer.cornerRadius = 10
    }
    
    private let backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_LocationBackButton"), for: .normal)
        $0.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
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
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_location")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 199, green: 224, blue: 212), message: "광주소프트웨어마이스터고등학교")
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
                
        location()
        
        dataSourceAndDelegate()
    }
    
    //MARK: - dataSourceAndDelegate
    func dataSourceAndDelegate(){
        selectCalendarModalView.dayPickerView.delegate = self
        selectCalendarModalView.dayPickerView.dataSource = self
        
        selectCalendarModalView.repeatCollectionView.delegate = self
        selectCalendarModalView.repeatCollectionView.dataSource = self
        
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
        selectCalendarModalView.dayPickerView.selectRow(dayPickerViewText2.count/2, inComponent: 0, animated: true)
    }
    
    //MARK: - addLayout
    func location(){
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
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(self.view.frame.height/50)
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
        
        notificationButton.snp.makeConstraints { make in
            make.left.equalTo(notificationTitleLabel)
            make.top.equalTo(notificationTitleLabel.snp.bottom).offset(self.view.frame.height/73.11)
            make.width.equalToSuperview().dividedBy(4.15)
            make.height.equalToSuperview().dividedBy(23.88)
        }
        
        notificationAddButton.snp.makeConstraints { make in
            make.centerY.equalTo(notificationButton)
            make.width.height.equalTo(notificationButton)
            make.left.equalTo(notificationButton.snp.right).offset(self.view.frame.width/20.29)
        }
        
        changeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(notificationButton)
            make.height.equalToSuperview().dividedBy(20)
            make.top.equalTo(notificationButton.snp.bottom).offset(self.view.frame.height/38.6)
        }
        
        selectCalendarModalView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        selectTimeModalView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        tagAddModalView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    //MARK: - addView
    func addView(){
        self.view.addSubview(backButton)
        self.view.addSubview(mainTitleLabel)
        self.view.addSubview(titleBackgroundView)
        titleBackgroundView.addSubview(titleLabel)
        titleBackgroundView.addSubview(titleTextField)
        self.view.addSubview(btnStackView)
        self.view.addSubview(explanationContainerView)
        self.view.addSubview(tagLabel)
        self.view.addSubview(tagCollectionView)
        self.view.addSubview(notificationTitleLabel)
        self.view.addSubview(notificationButton)
        self.view.addSubview(notificationAddButton)
        self.view.addSubview(changeButton)
        self.view.addSubview(selectCalendarModalView)
        self.view.addSubview(selectTimeModalView)
        self.view.addSubview(tagAddModalView)
    }

    //MARK: - selectors
    @objc func calendarAlert(){
        selectCalendarModalView.isHidden = false
    }
    
    @objc func clockAlert(){
        selectTimeModalView.isHidden = false
    }
    
    @objc func locationAlert(){
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
            tagAddModalView.isHidden = false
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

// MARK: - pickerview extension
extension PersonalPlanChangeViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    // 피커뷰의 구성요소(컬럼) 수
      func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == selectTimeModalView.startPickerView || pickerView == selectTimeModalView.endPickerView{
            return 2    // 구성요소(컬럼)로 지역만 있으므로 1을 리턴
        }else if pickerView == selectCalendarModalView.dayPickerView{
            return 1
        }
    
        return Int()
      }
      
      // 구성요소(컬럼)의 행수
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == selectTimeModalView.startPickerView || pickerView == selectTimeModalView.endPickerView{
            return startPickerViewText[component].count
        }else if pickerView == selectCalendarModalView.dayPickerView{
            return dayPickerViewText1.count
        }

        
        return Int()
      }
   
      // 피커뷰에 보여줄 값 전달
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == selectTimeModalView.startPickerView || pickerView == selectTimeModalView.endPickerView{
            return startPickerViewText[component][row]
        }else if pickerView == selectCalendarModalView.dayPickerView{
            return startPickerViewText[component][row]
        }

        
        return String()
      }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if pickerView == selectTimeModalView.startPickerView || pickerView == selectTimeModalView.endPickerView{
            var pickerLabel = view as? UILabel;
            
            if (pickerLabel == nil)
            {
                pickerLabel = UILabel()
                
                pickerLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
                pickerLabel?.textColor = UIColor(red: 120/255, green: 108/255, blue: 255/255, alpha: 1)
                pickerLabel?.textAlignment = .center
            }
            
            pickerLabel?.text = startPickerViewText[component][row]
            
            pickerView.subviews[1].backgroundColor = .clear // 회색 뷰 지우기
            
            return pickerLabel!
        }else if pickerView == selectCalendarModalView.dayPickerView{
            let pickerLabel1 = UILabel()
            let pickerLabel2 = UILabel()
            let view = UIView(frame: CGRect(x: 0, y: 0, width:0, height:0))
            
            if dayPickerViewText1[row] == "S"{
                pickerLabel1.textColor = UIColor(red: 170/255, green: 187/255, blue: 255/255, alpha: 1)
                pickerLabel2.textColor = UIColor(red: 170/255, green: 187/255, blue: 255/255, alpha: 1)
            }else{
                pickerLabel1.textColor = UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)
                pickerLabel2.textColor = UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)
            }
            
            pickerLabel1.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
            pickerLabel1.textAlignment = .center
            pickerLabel2.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
            pickerLabel2.textAlignment = .center
            
            view.addSubview(pickerLabel1)
            view.addSubview(pickerLabel2)
            
            pickerLabel1.text = dayPickerViewText1[row]
            pickerLabel2.text = dayPickerViewText2[row]
            
            pickerLabel2.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(self.view.frame.height/23)
                make.centerX.equalToSuperview()
            }
            pickerLabel1.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-self.view.frame.height/23)
            }
            
            pickerView.subviews[1].backgroundColor = UIColor(red: 170/255, green: 187/255, blue: 255/255, alpha: 0.1)

            
            view.transform = CGAffineTransform(rotationAngle: (90 * (.pi / 180*3)))
            
            
            return view
        }

        
        return UIView()
    }
    
}

