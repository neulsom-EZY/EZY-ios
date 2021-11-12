//
//  RescheduleViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/19.
//

import UIKit


class AddOrChangeMyTodoViewController: UIViewController{
    //MARK: - Properties
    private var TagModels: [TagCollectionViewModel] = [
        TagCollectionViewModel(backgroundColor: UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: true, iconImgae: UIImage(named: "EZY_UnSelectedTagAddButtonImage")!),
        TagCollectionViewModel(backgroundColor: UIColor(red: 221/255, green: 220/255, blue: 220/255, alpha: 1), isSelected: false, iconImgae: UIImage(named: "EZY_SelectedNoSelectTagButtonImage")!)]
    
    private var bounds = UIScreen.main.bounds
    
    private var selectedRepeatDayTextArray = [String]()
    
    private var rotationAngle: CGFloat!
    
    private var selectedTimeIndex: [Int] = [0,0,0,0]
    
    private var selectedRepeatIndex: [Int]  = []
        
    private var dayPickerViewSelectedValueIndex = 0

    private var selectedTimeStartHourIndex = 0
    
    private var selectedTimeEndHourIndex = 0
    
    private var tagNameTextArray = ["x", "+", "TOEIC", "CODING", "COOKING"]
    
    private var selectedAfterOrMorn = ["오후","오후"]
    
    private var selectedStartTime = ["01","00"]
    
    private var selectedEndTime = ["01","00"]
    
    private var receiveStartTime = "01 : 00"
    
    private var receiveEndTime = "01 : 00"
    
    private var leftOrRight = ["L","L"]
    
    private var selectedDayOfWeekText = ""
    
    private var selectedDayText = ""
    
    let bgView = UIView().then {
        $0.backgroundColor = .black
        $0.alpha = 0
    }
    
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
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let tagLabel = UILabel().then {
        $0.text = "태그"
        $0.textColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let addOrChangeButton = UIButton().then {
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
    
    private lazy var notificationAddButton = UIButton().then{
        $0.imageEdgeInsets = UIEdgeInsets(top: view.frame.width/27, left: view.frame.width/27, bottom: view.frame.width/27, right: view.frame.width/27)
        $0.backgroundColor = UIColor.rgb(red: 253, green: 253, blue: 253)
        $0.setImage(UIImage(named: "EZY_UnSelectedTagAddButtonImage"), for: .normal)
        $0.setTitleColor(UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1), alpha: 1, x: 0, y: 3, blur: 15, spread: 0)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(notificationAddButtonClicked(sender:)), for: .touchUpInside)
    }

    private lazy var notificationNoSelectButton = UIButton().then{
        $0.imageEdgeInsets = UIEdgeInsets(top: view.frame.width/26, left: view.frame.width/26, bottom: view.frame.width/26, right: view.frame.width/26)
        $0.setImage(UIImage(named: "EZY_SelectedNoSelectTagButtonImage"), for: .normal)
        $0.backgroundColor = UIColor(red: 221/255, green: 220/255, blue: 220/255, alpha: 1)
        $0.isHighlighted = false
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1), alpha: 1, x: 0, y: 3, blur: 15, spread: 0)
        $0.addTarget(self, action: #selector(notificationNoSelectButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_LocationBackButton"), for: .normal)
        $0.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let calendarBtn : CalendarBtn = {
        let viewModel = CalendarModel(icon: UIImage(named: "EZY_Calendar")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 255, green: 181, blue: 181), message: "날짜를 선택해주세요!", repeatText: "반복 없음")
        let button = CalendarBtn(with: viewModel)
        button.addTarget(self, action: #selector(calendarAlert), for: .touchUpInside)
        return button
    }()
    
    private let clockBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_clock")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 255, green: 203, blue: 181), message: "시간을 선택해주세요!")
        let button = AlertButton(with: viewModel)
        button.addTarget(self, action: #selector(clockAlert), for: .touchUpInside)
        return button
    }()
    
    private let locationBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_location")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 199, green: 224, blue: 212), message: "위치를 선택해주세요!")
        let button = AlertButton(with: viewModel)
        button.addTarget(self, action: #selector(locationAlert), for: .touchUpInside)
        return button
    }()
    
    private lazy var btnStackView = UIStackView(arrangedSubviews: [clockBtn,locationBtn]).then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = bounds.height/47.7647
    }
    
    private let explanationContainerView = ExplanationContainerTextView(tvTitle: "설명")
    
    let sizeCheckLabel = UILabel().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.sizeToFit()
    }
    
    //MARK: - lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureUI()
    }
    
    //MARK: - helpers
    func configureUI(){
        self.view.backgroundColor = .white
        
        addView()
                
        location()
        
        dataSourceAndDelegate()
    }
    
    //MARK: - dataSourceAndDelegate
    func dataSourceAndDelegate(){
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        explanationContainerView.tv.delegate = self
    }
    
    //MARK: - addLayout
    func location(){
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
        
        titleBackgroundView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(self.view.frame.width/13.3)
            $0.height.equalToSuperview().dividedBy(12)
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(self.view.frame.height/50)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(self.view.frame.width/17.8)
        }
        
        titleTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(titleLabel.snp.right).offset(self.view.frame.width/17.8)
            $0.width.equalToSuperview().dividedBy(1.45)
            $0.height.equalToSuperview()
        }
        
        btnStackView.snp.makeConstraints {
            $0.top.equalTo(calendarBtn.snp.bottom).offset(bounds.height/47.76)
            $0.left.equalTo(calendarBtn)
            $0.right.equalToSuperview().inset(bounds.height/9.23)
            $0.height.equalTo(bounds.height/7.58)
        }
        explanationContainerView.snp.makeConstraints {
            $0.height.equalTo(self.view.frame.height/10.8)
            $0.top.equalTo(btnStackView.snp.bottom).offset(self.view.frame.height/30.0)
            $0.left.equalTo(self.btnStackView.snp.left)
            $0.centerX.equalToSuperview()
        }
        tagLabel.snp.makeConstraints { (make) in
            make.left.equalTo(backButton.snp.left)
            make.top.equalTo(btnStackView.snp.bottom).offset(self.view.frame.height/6.44)
        }
        tagCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tagLabel.snp.bottom).offset(self.view.frame.height/162.4)
            make.left.equalToSuperview()
            make.height.equalToSuperview().dividedBy(13.09)
            make.right.equalToSuperview()
        }
        notificationTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(tagLabel)
            make.top.equalTo(tagCollectionView.snp.bottom).offset(self.view.frame.height/38.6)
        }
        notificationAddButton.snp.makeConstraints { make in
            make.left.equalTo(tagLabel)
            make.top.equalTo(notificationTitleLabel.snp.bottom).offset(self.view.frame.height/73.11)
            make.width.equalTo(notificationAddButton.snp.height)
            make.height.equalTo(self.view.frame.height/20)
        }
        
        notificationNoSelectButton.snp.makeConstraints { make in
            make.height.equalTo(self.view.frame.height/20)
            make.centerY.equalTo(notificationAddButton)
            make.width.equalTo(notificationNoSelectButton.snp.height)
            make.left.equalTo(notificationAddButton.snp.right).offset(self.view.frame.width/37)
        }
        
        addOrChangeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(notificationAddButton)
            make.height.equalToSuperview().dividedBy(20)
            make.top.equalTo(notificationAddButton.snp.bottom).offset(self.view.frame.height/38.6)
        }
        
        calendarBtn.snp.makeConstraints { make in
            make.left.equalTo(titleBackgroundView)
            make.height.equalToSuperview().dividedBy(18.04)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleBackgroundView.snp.bottom).offset(self.view.frame.height/30.07)
        }
    }
    
    //MARK: - addView
    func addView(){
        [backButton, mainTitleLabel, titleBackgroundView].forEach { view.addSubview($0)}
        [titleLabel,titleTextField].forEach { titleBackgroundView.addSubview($0)}
        [calendarBtn,btnStackView, explanationContainerView, tagLabel,tagCollectionView,notificationTitleLabel,notificationAddButton,notificationNoSelectButton,addOrChangeButton].forEach { view.addSubview($0) }
    }

    // MARK: - selectors
    @objc func notificationAddButtonClicked(sender:UIButton){
        let MoreCalendarModalsVC = MoreAlarmModelViewController.instance()
        MoreCalendarModalsVC.delegate = self
        MoreCalendarModalsVC.baseDelegate = self
        addDim()
        present(MoreCalendarModalsVC, animated: true, completion: nil)
        AlarmSettingCell().isSelected = false
    }
    
    @objc func notificationNoSelectButtonClicked(sender:UIButton){
        notificationNoSelectButton.backgroundColor = UIColor(red: 221/255, green: 220/255, blue: 220/255, alpha: 1)
        notificationNoSelectButton.setImage(UIImage(named: "EZY_SelectedNoSelectTagButtonImage"), for: .normal)
    }
    
    @objc func calendarAlert(){
        let CalendarAddModalVC = CalendarAddModelViewController.instance()
        CalendarAddModalVC.delegate = self
        CalendarAddModalVC.baseDelegate = self
        addDim()
        present(CalendarAddModalVC, animated: true, completion: nil)
        CalendarAddModalVC.calendarModalDataSetting(dayIndex: dayPickerViewSelectedValueIndex, repeatIndex: selectedRepeatIndex)
    }
    
    @objc func clockAlert(){
        let TimeAddModalVC = TimeAddModalViewController.instance()
        TimeAddModalVC.baseDelegate = self
        TimeAddModalVC.delegate = self
        addDim()
        present(TimeAddModalVC, animated: true, completion: nil)
        TimeAddModalVC.timeValueSetting(receiveStartTime: receiveStartTime, receiveEndTime: receiveEndTime, leftOrRight: leftOrRight, selectedValuesIndex: selectedTimeIndex)
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
    
    //MARK: 화면터치하여 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.explanationContainerView.tv.endEditing(true)
        
        if locationBtn.alpha == 0{
            UIView.animate(withDuration: 0.3) {
                self.explanationContainerView.snp.remakeConstraints { make in
                    make.height.equalTo(self.view.frame.height/10.8)
                    make.top.equalTo(self.btnStackView.snp.bottom).offset(self.view.frame.height/30.0)
                    make.left.equalTo(self.btnStackView.snp.left)
                    make.centerX.equalToSuperview()
                }
                
                self.locationBtn.alpha = 1
                
                self.view.layoutIfNeeded()
            }
        }
    }
    
    //MARK: - Alarm Setting Function
    func alarmReloadSetting(_ ampm: String,_ time: Int,_ minute: Int){
        notificationAddButton.setTitle("\(ampm) \(time):\(String(format: "%02d", minute))", for: .normal)
        notificationAddButton.setImage(nil, for: .normal)
        notificationNoSelectButton.backgroundColor = .white
        notificationNoSelectButton.setImage(UIImage(named: "EZY_UnSelectedNoSelectTagButtonImage"), for: .normal)
        
        notificationAddButton.snp.remakeConstraints { make in
            make.left.equalTo(tagLabel)
            make.top.equalTo(notificationTitleLabel.snp.bottom).offset(self.view.frame.height/73.11)
            make.width.equalToSuperview().dividedBy(4.07)
            make.height.equalToSuperview().dividedBy(18.88)
        }
    }
    
    //MARK: - calendar Setting Function
    func calendarReloadSetting(_ selectedDay: String, _ selectedRepeatDay: [String], _ selectedDayOfWeek: String, _ yearAndMonthText: String, _ selectedValuesIndex: Int, _ selectedRepeatIndex: [Int]){
        
        // 반복라벨에 적용
        if selectedRepeatDay.count == 0{
            calendarBtn.repeatLabel.text = "반복 없음"
        }else{
            calendarBtn.repeatLabel.text = "\(selectedRepeatDay.joined(separator: ",")) 반복"
        }
        
        // 선택한 내용 dayLabel에 적용
        if selectedDayOfWeek != "" { calendarBtn.dayLabel.text = "\(yearAndMonthText).\(selectedDay) \(selectedDayOfWeek)요일" }
        
        self.selectedRepeatIndex = selectedRepeatIndex
        dayPickerViewSelectedValueIndex = selectedValuesIndex
    }
    
    //MARK: - time Setting Function
    func timeReloadSetting(_ leftOrRight: [String], _ startTime: String, _ endTime: String, _ afterOrMorn: [String], _ selectedTimeIndex: [Int]){
        self.leftOrRight = leftOrRight
        self.selectedTimeIndex = selectedTimeIndex
        self.receiveStartTime = startTime
        self.receiveEndTime = endTime

        clockBtn.alertButtonTitleLabel.text = "\(LeftOrRightChangeKorean(leftOrRight: leftOrRight[0])) \(startTime) ~ \(LeftOrRightChangeKorean(leftOrRight: leftOrRight[1])) \(endTime)"
    }
    
    func tagReloadSetting(_ tagName: String, _ tagColorIndex: Int){
        for i in 0...TagModels.count-1{
            if TagModels[i].isSelected == false{
                TagModels[i].isSelected.toggle()
            }
        }
        
        TagModels[1].iconImgae = UIImage(named: "EZY_UnSelectedNoSelectTagButtonImage")!
        TagModels.insert(TagCollectionViewModel(backgroundColor: UIColor.EZY_TagColor2, isSelected: false, iconImgae: UIImage()), at: 2)
        tagNameTextArray.insert(tagName, at: 2)
        tagCollectionView.reloadData()
    }
    
    func mainTitleLabelSetting(mainTitleText: String, buttonText: String){
        mainTitleLabel.text = mainTitleText
        addOrChangeButton.setTitle(buttonText, for: .normal)
    }
    
    private func LeftOrRightChangeKorean(leftOrRight: String) -> String{
        if leftOrRight == "L" { return "오전" }else{ return "오후" }
    }
    
    // MARK: - shakeView
    private func shakeView(_ view: UIView?) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.08
        shake.repeatCount = 2
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! - 2, y: view?.center.y ?? 0.0))
        shake.toValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! + 2, y: view?.center.y ?? 0.0))
        view?.layer.add(shake, forKey: "position")
    }
    
    private func addDim() {
        view.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.bgView.alpha = 0.2
        }
    }

    func removeDim() {
        DispatchQueue.main.async { [weak self] in
            self?.bgView.removeFromSuperview()
        }
    }
}

//MARK: - collectionView extension
extension AddOrChangeMyTodoViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tagCollectionView{
            return TagModels.count
        }
        
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagCollectionView{
            if indexPath == [0,0]{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.reuseId, for: indexPath) as! TagCollectionViewCell
                
                cell.tagNameLabel.isHidden = true
                cell.iconButton.isHidden = false
                cell.iconButton.imageEdgeInsets = UIEdgeInsets(top: view.frame.width/30, left: view.frame.width/30, bottom: view.frame.width/30, right: view.frame.width/30)

                cell.setModel(TagModels[indexPath.row])
                
                return cell
            }else if indexPath == [0,1]{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.reuseId, for: indexPath) as! TagCollectionViewCell
                
                cell.tagNameLabel.isHidden = true
                cell.iconButton.isHidden = false

                cell.setModel(TagModels[indexPath.row])
                
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.reuseId, for: indexPath) as! TagCollectionViewCell
                    
                cell.iconButton.isHidden = true
                cell.tagNameLabel.isHidden = false

                cell.setModel(TagModels[indexPath.row])
                    
                cell.tagNameLabel.text = tagNameTextArray[indexPath.row]
                    
                return cell
            }
        }

        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        if collectionView == tagCollectionView{
            return UIEdgeInsets(top: 0, left: self.view.frame.width/12, bottom: 0, right: self.view.frame.width/12)
        }
        
        return UIEdgeInsets()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tagCollectionView{
            if indexPath == [0,0] || indexPath == [0,1]{
                return CGSize(width: self.view.frame.height/20, height: self.view.frame.height/20)
            }else{
                return CGSize(width: tagNameTextArray[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 25, height: self.view.frame.height/20)
            }
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tagCollectionView{
            if indexPath == [0,0]{
                // tagAddModalView 생성!
                let TagAddModalVC = TagAddModalViewController.instance()
                TagAddModalVC.delegate = self
                TagAddModalVC.baseDelegate = self
                addDim()
                present(TagAddModalVC, animated: true, completion: nil)
            }else if indexPath == [0,1]{
                TagModels[indexPath.row].iconImgae = UIImage(named: "EZY_SelectedNoSelectTagButtonImage")!

                for i in 0...TagModels.count-1{
                    if TagModels[i].isSelected == false{
                        TagModels[i].isSelected.toggle()
                    }
                }
                    
                TagModels[indexPath.row].isSelected.toggle()
            }else{
                TagModels[1].iconImgae = UIImage(named: "EZY_UnSelectedNoSelectTagButtonImage")!

                for i in 0...TagModels.count-1{
                    if TagModels[i].isSelected == false{
                        TagModels[i].isSelected.toggle()
                    }
                }
                    
                TagModels[indexPath.row].isSelected.toggle()
            }
        }
        
        collectionView.reloadData()
    }
}

// MARK: - UITextViewDelegate extension
extension AddOrChangeMyTodoViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        // textView클릭 시 explanationContainerView 올리기
        UIView.animate(withDuration: 0.3) {
            self.explanationContainerView.snp.remakeConstraints { make in
                make.height.equalTo(self.view.frame.height/10.8)
                make.top.equalTo(self.locationBtn).offset(self.view.frame.height/55)
                make.left.equalTo(self.btnStackView.snp.left)
                make.centerX.equalToSuperview()
            }
            
            self.locationBtn.alpha = 0
            self.view.layoutIfNeeded()
        }
        
        // textView입력 중에는 btnStackView, calendarBtn를 비활성화한다.
        btnStackView.isUserInteractionEnabled = false
        calendarBtn.isUserInteractionEnabled = false
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        // textView입력이 끝났을 시에는 btnStackView, calendarBtn를 활성화한다.
        btnStackView.isUserInteractionEnabled = true
        calendarBtn.isUserInteractionEnabled = true
    }
}
//MARK: - AlarmModal Delegate
extension AddOrChangeMyTodoViewController: AlarmModelDelegate{
    func updateData(ampm: String, time: Int, minute: Int) {
        self.alarmReloadSetting(ampm, time + 1, minute)
    }
    
}
//MARK: - CalendarModal Delegate
extension AddOrChangeMyTodoViewController: CalendarAddDelegate{
    func updateData(selectedDay: String, selectedRepeatDay: [String], selectedDayOfWeek: String, yearAndMonthText: String, selectedValuesIndex: Int, selectedRepeatIndex: [Int]) {
        self.calendarReloadSetting(selectedDay, selectedRepeatDay, selectedDayOfWeek, yearAndMonthText, selectedValuesIndex, selectedRepeatIndex)
    }
}
//MARK: - TimeModal Delegate
extension AddOrChangeMyTodoViewController: TimeAddDelegate{
    func updateData(leftOrRight: [String], startTime: String, endTime: String, afterOrMorn: [String], selectedTimeIndex: [Int]) {
        self.timeReloadSetting(leftOrRight, startTime, endTime, afterOrMorn, selectedTimeIndex)
    }
}

//MARK: - TagModal Delegate
extension AddOrChangeMyTodoViewController: TagAddDelegate{
    func updateData(tagName: String, tagColorIndex: Int) {
        self.tagReloadSetting(tagName, tagColorIndex)
    }
}

//MARK: - BaseModal Delegate
extension AddOrChangeMyTodoViewController : BaseModalDelegate{
    func onTapClose() {
        self.removeDim()
    }
}
