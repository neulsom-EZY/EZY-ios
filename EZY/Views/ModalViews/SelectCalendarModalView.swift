//
//  CalendarView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/23.
//

import UIKit

class SelectCalendarModalView: UIView {
    
    //MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let shadowBackgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    private let modalBackgroundView = UIView().then {
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
    
    private let calendarAddButton = UIButton().then{
        $0.backgroundColor = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
        $0.setTitle("완 료", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(calendarAddButtonClicked(sender:)), for: .touchUpInside)
    }
    
    var dayPickerView = UIPickerView().then{
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
    
    private let pinkColor: UIColor! = UIColor(red: 170/255, green: 187/255, blue: 254/255, alpha: 1)
    
    private let whiteColor: UIColor! = UIColor.white
    
    private lazy var labelColor: [UIColor] = [pinkColor, whiteColor]
    
    private let calendarTriangleImageView = UIImageView().then{
        $0.image = UIImage(named:"EZY_CalendarTriangleViewBlue.svg")
    }
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - helpers
    func configureUI(){
        addView()

        addLayout()
    }
    
    //MARK: - Selectors
    @objc func calendarAddButtonClicked(sender:UIButton){
        self.isHidden = true
        self.dayPickerView.selectRow(5, inComponent: 0, animated: true)

    }
    
    //MARK: - addView
    func addView(){
        self.addSubview(shadowBackgroundView)
        shadowBackgroundView.addSubview(modalBackgroundView)
        modalBackgroundView.addSubview(titleLabel)
        modalBackgroundView.addSubview(monthLabel)
        modalBackgroundView.addSubview(monthYearLabel)
        modalBackgroundView.addSubview(calendarTriangleImageView)
        modalBackgroundView.addSubview(dayPickerView)
        modalBackgroundView.addSubview(divideLineView)
        modalBackgroundView.addSubview(repeatLabel)
        modalBackgroundView.addSubview(repeatCollectionView)
        modalBackgroundView.addSubview(calendarAddButton)
    }
    
    //MARK: - addLayout
    func addLayout(){
        shadowBackgroundView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        modalBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.13)
            make.height.equalToSuperview().dividedBy(2.3)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(viewBounds.height/33.8)
            make.left.equalToSuperview().offset(viewBounds.height/33.8)
        }
        
        monthLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel).offset(viewBounds.height/61.2)
            make.top.equalTo(titleLabel.snp.bottom).offset(viewBounds.height/40)
        }
        
        monthYearLabel.snp.makeConstraints { make in
            make.bottom.equalTo(monthLabel).offset(-viewBounds.height/131.2)
            make.left.equalTo(monthLabel.snp.right).offset(viewBounds.height/161.2)
        }
        
        calendarTriangleImageView.snp.makeConstraints { make in
            make.top.equalTo(monthLabel.snp.bottom).offset(viewBounds.height/300)
            make.height.width.equalTo(10)
            make.centerX.equalToSuperview()
        }
        
        dayPickerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(viewBounds.width/3)
            make.height.equalToSuperview().dividedBy(1.1)
            make.centerY.equalToSuperview().offset(-viewBounds.height/25)
        }
        
        divideLineView.snp.makeConstraints { make in
            make.top.equalTo(dayPickerView.snp.bottom).offset(-viewBounds.height/7.5)
            make.right.equalToSuperview().offset(-viewBounds.width/18)
            make.left.equalToSuperview().offset(viewBounds.width/18)
            make.height.equalTo(0.5)
        }
        
        repeatLabel.snp.makeConstraints { make in
            make.top.equalTo(divideLineView.snp.bottom).offset(viewBounds.height/33.8)
            make.left.equalTo(divideLineView)
        }
        
        repeatCollectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(repeatLabel.snp.bottom).offset(viewBounds.height/73.81)
            make.height.equalToSuperview().dividedBy(8.6)
        }
        
        calendarAddButton.snp.makeConstraints { make in
            make.right.equalTo(divideLineView)
            make.top.equalTo(repeatCollectionView.snp.bottom).offset(viewBounds.height/52)
            make.width.equalToSuperview().dividedBy(4.71)
            make.height.equalToSuperview().dividedBy(10.42)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureUI()
    }
    
}
