//
//  CalendarAddModelViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/10/15.
//

import UIKit

protocol CalendarAddDelegate: AnyObject {
    func onTapCalendarModalClose()
    func updateData(selectedDay : String , selectedRepeatDay : [String], selectedDayOfWeek: String, yearAndMonthText: String)
}

class CalendarAddModelViewController: UIViewController {
    // MARK: - Properties
    weak var delegate: CalendarAddDelegate?
    
    let bgView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "날짜 선택"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
    }
    
    private lazy var monthLabel = UILabel().then {
        $0.text = "3"
        $0.dynamicFont(fontSize: 30, currentFontName: "AppleSDGothicNeo-Thin")
        $0.updateGradientTextColor_vertical(gradientColors: labelColor)
    }
    
    private let monthYearLabel = UILabel().then {
        $0.text = "MARCH 2021"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor.black
    }
    
    private let divideLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
    }
    
    let calendarAddButton = UIButton().then{
        $0.backgroundColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
        $0.setTitle("완 료", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(MakeTodo), for: .touchUpInside)
    }
    
    lazy var dayPickerView = UIPickerView().then{
        $0.tintColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    let repeatCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then{
        let layout = UICollectionViewFlowLayout()
        $0.collectionViewLayout = layout
        $0.register(DayCollectionViewCell.self, forCellWithReuseIdentifier: DayCollectionViewCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        $0.isScrollEnabled = false
    }
    
    private let repeatLabel = UILabel().then {
        $0.text = "반복 설정"
        $0.textColor = UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let calendarTriangleImageView = UIImageView().then{
        $0.image = UIImage(named:"EZY_CalendarTriangleViewBlue.svg")
    }
    
    private let labelColor: [UIColor] = [UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1), UIColor.white]
    
    private var selectedDay = ""
    
    private var selectedRepeatDay: [String] = []
    
    private var selectedDayOfWeek = ""
    
    private var dayPickerViewselectedIndex = 0
    
    private var repeatCollectionViewselectedIndex = 0
    
    private var yearAndMonthText = ""
    
    private var monthText = ""
    
    private var dayOfWeekPickerViewData:[String] = []
    
    private var dayPickerViewData:[String] = []
    
    private let dayEnglishTextArray = ["Mon","Tue","Wed","Thr","Fri","Sat","Sun"]
    
    private let dayKoreanTextArray = ["월","화","수","목","금","토","일"]
    
    private lazy var dayPickerViewAllData = [dayOfWeekPickerViewData,dayPickerViewData]
    
    fileprivate lazy var repeatModels: [RepeatCollectionViewModal] = [RepeatCollectionViewModal(isSelected: false),RepeatCollectionViewModal(isSelected: false),RepeatCollectionViewModal(isSelected: false),RepeatCollectionViewModal(isSelected: false),RepeatCollectionViewModal(isSelected: false),RepeatCollectionViewModal(isSelected: false),RepeatCollectionViewModal(isSelected: false)]
    
    
    static func instance() -> CalendarAddModelViewController {
        return CalendarAddModelViewController(nibName: nil, bundle: nil).then {
            $0.modalPresentationStyle = .overFullScreen
        }
    }

    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - pickerViewDataSetting
    func pickerViewDataSetting(){
        getCurrentDate()

        for i in 0...13{
            let addDay = DateComponents(day: i)
            let day = Calendar.current.date(byAdding: addDay, to: Date())
            let currentDayOfWeek = DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: day!) - 1]
            let endIdx: String.Index = currentDayOfWeek.index(currentDayOfWeek.startIndex, offsetBy: 2)
            
            dayOfWeekPickerViewData.append(String(currentDayOfWeek[...endIdx]))
        }
    }
    
    //MARK: - helpers
    func configureUI(){
        currentDateSetting()
        
        pickerViewDataSetting()
        
        addView()

        addLayout()
        
        delegateAndDataSource()
    }
    
    // MARK: - currentDate Setting
    func currentDateSetting(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM"
        yearAndMonthText = formatter.string(from: Date())
    }
    
    // MARK: - Selectors
    @objc func onTapClose() {
        delegate?.onTapCalendarModalClose()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func MakeTodo(){
        for i in 0...dayArray.count-1{
            if dayOfWeekPickerViewData[dayPickerViewselectedIndex] == "\(dayArray[i])"{
                selectedDayOfWeek = dayArray[i].rawValue
            }
        }
        
        selectedDay = dayPickerViewData[dayPickerViewselectedIndex]
        
        for i in 0...repeatModels.count-1{
            if repeatModels[i].isSelected == true{
                selectedRepeatDay.append(dayKoreanTextArray[i])
            }
        }
        
        delegate?.onTapCalendarModalClose()
        dismiss(animated: true, completion: nil)
        delegate?.updateData(selectedDay: self.selectedDay, selectedRepeatDay: self.selectedRepeatDay, selectedDayOfWeek: self.selectedDayOfWeek, yearAndMonthText: self.yearAndMonthText)
    }
    
    //MARK: - addView
    func addView(){
        self.view.addSubview(bgView)
        bgView.addSubview(titleLabel)
        bgView.addSubview(monthLabel)
        bgView.addSubview(monthYearLabel)
        bgView.addSubview(calendarTriangleImageView)
        bgView.addSubview(dayPickerView)
        bgView.addSubview(divideLineView)
        bgView.addSubview(repeatLabel)
        bgView.addSubview(repeatCollectionView)
        bgView.addSubview(calendarAddButton)
    }
    
    // MARK: - addLayout
    func addLayout(){
        bgView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.13)
            make.height.equalToSuperview().dividedBy(2.3)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        monthLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel).offset(self.view.frame.height/61.2)
            make.top.equalTo(titleLabel.snp.bottom).offset(self.view.frame.height/40)
        }
        
        monthYearLabel.snp.makeConstraints { make in
            make.bottom.equalTo(monthLabel).offset(-self.view.frame.height/131.2)
            make.left.equalTo(monthLabel.snp.right).offset(self.view.frame.height/161.2)
        }
        
        calendarTriangleImageView.snp.makeConstraints { make in
            make.top.equalTo(monthLabel.snp.bottom).offset(self.view.frame.height/300)
            make.height.width.equalTo(10)
            make.centerX.equalToSuperview()
        }
        
        dayPickerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/3)
            make.height.equalToSuperview().dividedBy(1.1)
            make.centerY.equalToSuperview().offset(-self.view.frame.height/25)
        }
        
        divideLineView.snp.makeConstraints { make in
            make.top.equalTo(dayPickerView.snp.bottom).offset(-self.view.frame.height/7.5)
            make.right.equalToSuperview().offset(-self.view.frame.width/13)
            make.left.equalToSuperview().offset(self.view.frame.width/13)
            make.height.equalTo(0.5)
        }
        
        repeatLabel.snp.makeConstraints { make in
            make.top.equalTo(divideLineView.snp.bottom).offset(self.view.frame.height/33.8)
            make.left.equalTo(divideLineView)
        }
        
        repeatCollectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(repeatLabel.snp.bottom).offset(self.view.frame.height/73.81)
            make.height.equalToSuperview().dividedBy(8.6)
        }
        
        calendarAddButton.snp.makeConstraints { make in
            make.right.equalTo(divideLineView)
            make.top.equalTo(repeatCollectionView.snp.bottom).offset(self.view.frame.height/52)
            make.width.equalToSuperview().dividedBy(4.71)
            make.height.equalToSuperview().dividedBy(10.42)
        }
    }
    
    // MARK: - delegateAndDataSource
    func delegateAndDataSource(){
        repeatCollectionView.delegate = self
        repeatCollectionView.dataSource = self
        
        dayPickerView.delegate = self
        dayPickerView.dataSource = self
        
        dayPickerView.selectRow(dayPickerViewData.count/2, inComponent: 0, animated: true)
        dayPickerView.transform = CGAffineTransform(rotationAngle: (-90 * (.pi / 180*3)))
    }
    
    // MARK: - getCurrentDate
    func getCurrentDate() -> [String]{
        let now = Date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        
        dayPickerViewData = []
        
        dateFormatter.dateFormat = "dd"
        for i in 0...13{
            let day = DateComponents(day: i)
            if let d100 = calendar.date(byAdding: day, to: now)
            {
                dayPickerViewData.append(dateFormatter.string(from: d100))
            }
        }

        return dayPickerViewData
    }
}

extension CalendarAddModelViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: self.view.frame.width/100, left: self.view.frame.width/15.62, bottom: 0, right: self.view.frame.width/15.62)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/12.18, height: self.view.frame.height/23.88)
    }
}

extension CalendarAddModelViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        repeatModels[indexPath.row].isSelected.toggle()
        
        repeatCollectionViewselectedIndex = indexPath.row
        
        collectionView.reloadData()
    }
}

extension CalendarAddModelViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dayKoreanTextArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCollectionViewCell.identifier, for: indexPath) as! DayCollectionViewCell
            
            cell.dayKoreanLabel.text = dayKoreanTextArray[indexPath.row]
            cell.dayEnglishLabel.text = dayEnglishTextArray[indexPath.row]
        
            cell.setModel(repeatModels[indexPath.row])
        return cell
    }
}

extension CalendarAddModelViewController: UIPickerViewDelegate{
    
}

extension CalendarAddModelViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dayPickerViewAllData[0].count
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dayPickerViewAllData[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dayPickerViewselectedIndex = dayPickerViewAllData[0].count-row-1
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let dayOfWeekLabel = UILabel().then{
            $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 13)
            $0.textAlignment = .center
            $0.text = dayOfWeekPickerViewData.reversed()[row]
        }
        
        let dayLabel = UILabel().then{
            $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
            $0.textAlignment = .center
            $0.text = dayPickerViewData.reversed()[row]
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width:0, height:0)).then{
            $0.addSubview(dayOfWeekLabel)
            $0.addSubview(dayLabel)
            $0.transform = CGAffineTransform(rotationAngle: (-90 * (.pi / 180)))
        }
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/23)
            make.centerX.equalToSuperview()
        }
        
        dayOfWeekLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-self.view.frame.height/23)
        }

        pickerView.subviews[1].backgroundColor = UIColor(red: 170/255, green: 187/255, blue: 255/255, alpha:0.1)
        
        return view
    }
}

