//
//  CalendarAddModelViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/10/15.
//

import UIKit

protocol CalendarAddDelegate: AnyObject {
    func updateData(selectedDay: String , selectedRepeatDay: [String], selectedDayIndex: Int)
}

class CalendarAddModelViewController: BaseModal {
    // MARK: - Properties
    weak var delegate: CalendarAddDelegate?
    
    var selectedDayIndex = 13

    private let bgView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "날짜 선택"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
    }
    
    private let monthLabel = UILabel().then {
        $0.text = "3"
        $0.dynamicFont(fontSize: 30, currentFontName: "AppleSDGothicNeo-Thin")
        $0.updateGradientTextColor_vertical(gradientColors: [UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1), UIColor.white])
    }
    
    private let monthYearLabel = UILabel().then {
        $0.text = "MARCH 2021"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor.black
    }
    
    private let divideLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
    }
    
    private let calendarAddButton = UIButton().then{
        $0.backgroundColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
        $0.setTitle("완 료", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(MakeTodo), for: .touchUpInside)
    }
    
    private let dayPickerView = UIPickerView().then{
        $0.tintColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.transform = CGAffineTransform(rotationAngle: (-90 * (.pi / 180*3)))
    }
    
    private let repeatCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then{
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
    
    private var repeatModels: [RepeatCollectionViewModal] = [RepeatCollectionViewModal(isSelected: false),RepeatCollectionViewModal(isSelected: false),RepeatCollectionViewModal(isSelected: false),RepeatCollectionViewModal(isSelected: false),RepeatCollectionViewModal(isSelected: false),RepeatCollectionViewModal(isSelected: false),RepeatCollectionViewModal(isSelected: false)]
    
    static func instance() -> CalendarAddModelViewController {
        return CalendarAddModelViewController(nibName: nil, bundle: nil).then {
            $0.modalPresentationStyle = .overFullScreen
        }
    }

    // MARK: - LifeCycles
    override func configure() {
        super.configure()

        addView()
        location()
        delegateAndDataSource()
    }
    
    //MARK: - addView
    private func addView(){
        [bgView].forEach{ view.addSubview($0)}
        [titleLabel,monthLabel,monthYearLabel,calendarTriangleImageView,dayPickerView,divideLineView,repeatLabel,repeatCollectionView,calendarAddButton].forEach{ bgView.addSubview($0)}
    }
    
    // MARK: - location
    private func location(){
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
    private func delegateAndDataSource(){
        [repeatCollectionView].forEach{ $0.delegate = self; $0.dataSource = self}
        [dayPickerView].forEach{ $0.delegate = self; $0.dataSource = self}
    }
    
    // MARK: - Selectors
    @objc private func onTapClose() {
        baseDelegate?.onTapClose()
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - getDate (currentDate ~ After 14 days)
    private func getDate(firstAdd: Int, endAdd: Int) -> [String]{
        let now = Date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        var planDate: [String] = []
        dateFormatter.dateFormat = "dd"

        for i in firstAdd...endAdd{
            let day = DateComponents(day: i)
            if let d100 = calendar.date(byAdding: day, to: now)
            {
                planDate.append(dateFormatter.string(from: d100))
            }
        }
        
        return planDate.reversed()
    }
    
    // MARK: - getDayOfWeek
    private func getDayOfWeek() -> [String]{
        var planWeekOfDay: [String] = []
        
        for i in 0...13{
            let addDay = DateComponents(day: i)
            let day = Calendar.current.date(byAdding: addDay, to: Date())
            let currentDayOfWeek = DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: day!) - 1]
            let endIdx: String.Index = currentDayOfWeek.index(currentDayOfWeek.startIndex, offsetBy: 2)

            planWeekOfDay.append(String(currentDayOfWeek[...endIdx]))
        }

        return planWeekOfDay.reversed()
    }
    
    // MARK: - repeatDayOfWeek
    private func repeatDayOfWeek() -> [[String]]{
        var repeatDayOfWeek: [[String]] = [[],[]]
        
        for i in 0...dayArray.count-1{
            repeatDayOfWeek[0].append(dayArray[i].rawValue)
            repeatDayOfWeek[1].append("\(dayArray[i])")
        }
        
        return repeatDayOfWeek
    }
    
    private func getRepeatDay() -> [String]{
        var repeatDay: [String] = []
        
        for i in 0...dayArray.count-1{
            if repeatModels[i].isSelected == true{
                repeatDay.append(dayArray[i].rawValue)
            }
        }

        return repeatDay
    }
    
    private func getYearMonth() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM."
        return formatter.string(from: Date())
    }
    
    private func changeKorean(eng: String) -> String{
        if eng == "Mon"{ return "월요일" }
        else if eng == "Tue"{ return "화요일" }
        else if eng == "Wed"{ return "수요일" }
        else if eng == "Thu"{ return "목요일" }
        else if eng == "Fri"{ return "금요일" }
        else if eng == "Sat"{ return "토요일" }
        else if eng == "Sun"{ return "일요일" }
        
        return ""
    }
    
    // MARK: - calendarModalDataSetting
    func calendarModalDataSetting(dayIndex: Int, repeatIndex: [Int]){
        if dayIndex == 0{
            dayPickerView.selectRow(getDate(firstAdd: 0, endAdd: 13).count-1, inComponent: 0, animated: false)
        }else{
            dayPickerView.selectRow( dayIndex, inComponent: 0, animated: false)
        }
    }
    
    @objc private func MakeTodo(){
        baseDelegate?.onTapClose()
        dismiss(animated: true, completion: nil)
        
        delegate?.updateData(
            selectedDay: "\(getYearMonth()) \(getDate(firstAdd: 13-selectedDayIndex, endAdd: 13-selectedDayIndex).joined()) \(changeKorean(eng: getDayOfWeek()[selectedDayIndex]))", selectedRepeatDay: getRepeatDay(), selectedDayIndex: selectedDayIndex)
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
        
        collectionView.reloadData()
    }
}

extension CalendarAddModelViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repeatDayOfWeek()[0].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCollectionViewCell.identifier, for: indexPath) as! DayCollectionViewCell
            
        cell.dayKoreanLabel.text = repeatDayOfWeek()[0][indexPath.row]
        cell.dayEnglishLabel.text = repeatDayOfWeek()[1][indexPath.row]
        cell.setModel(repeatModels[indexPath.row])
        
        return cell
    }
}

extension CalendarAddModelViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return getDate(firstAdd: 0, endAdd: 13).count
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return getDate(firstAdd: 0, endAdd: 13)[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDayIndex = row
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let dayOfWeekLabel = UILabel().then{
            $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 13)
            $0.textAlignment = .center
            $0.text = getDayOfWeek()[row]
        }
        
        let dayLabel = UILabel().then{
            $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
            $0.textAlignment = .center
            $0.text = getDate(firstAdd: 0, endAdd: 13)[row]
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

