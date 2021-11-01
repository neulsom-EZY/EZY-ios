//
//  TagAddModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/20.
//

import UIKit

class TagAddModalView: UIView {
    //MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    lazy var shadowBackgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    lazy var modalBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "태그 추가"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 154/255, green: 174/255, blue: 253/255, alpha: 1)
    }
    
    lazy var tagNameLabel = UILabel().then {
        $0.text = "태그 이름"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    }
    
    lazy var tagNameBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    lazy var tagNameTextField = UITextField().then {
        $0.placeholder = "태그 이름을 입력하세요."
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
    }
    
    lazy var tagColorLabel = UILabel().then {
        $0.text = "태그 색"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    }
    
    lazy var tagAddButton = UIButton().then {
        $0.setTitle("완 료", for: .normal)
        $0.backgroundColor = UIColor(red: 154/255, green: 174/255, blue: 253/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    
    lazy var writeTagNameView = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitle("태그 이름을 입력해주세요!", for: .normal)
        $0.layer.cornerRadius = 10
        $0.setTitleColor(UIColor(red: 147/255, green: 147/255, blue: 147/255, alpha: 1), for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 6
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowColor = UIColor.darkGray.cgColor
    }
    
    let tagColorCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CalendarViewLayout()).then{
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 30, height: 30)
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .white
        $0.register(TagColorCollectionViewCell.self, forCellWithReuseIdentifier: TagColorCollectionViewCell.reuseId)
    }
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contigureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - helpers
    func contigureUI(){
        addView()

        addLayout()
    }
    
    //MARK: - addLayout
    func addLayout(){
        shadowBackgroundView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        modalBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.13)
            make.height.equalToSuperview().dividedBy(3.38)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(viewBounds.width/15.62)
            make.top.equalToSuperview().offset(viewBounds.height/33.83)
        }
        
        tagNameLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel).offset(viewBounds.height/200)
            make.top.equalTo(titleLabel.snp.bottom).offset(viewBounds.height/81.2)
        }
        
        tagNameBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(tagNameLabel.snp.bottom).offset(viewBounds.height/135.3)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(6.31)
        }
        
        tagNameTextField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(viewBounds.width/28)
            make.height.equalToSuperview().dividedBy(1.2)
        }
        
        tagColorLabel.snp.makeConstraints { make in
            make.left.equalTo(tagNameLabel)
            make.top.equalTo(tagNameBackgroundView.snp.bottom).offset(viewBounds.height/50.75)
        }
        
        tagColorCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tagColorLabel.snp.bottom)
            make.left.equalToSuperview()
            make.height.equalTo(modalBackgroundView).dividedBy(5)
            make.right.equalTo(modalBackgroundView)
        }
        
        tagAddButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-viewBounds.width/13.2)
            make.top.equalTo(tagColorCollectionView.snp.bottom).offset(viewBounds.height/100)
            make.width.equalToSuperview().dividedBy(4.71)
            make.height.equalToSuperview().dividedBy(7.27)
        }
    }
    
    //MARK: - addView
    func addView(){
        self.addSubview(shadowBackgroundView)
        shadowBackgroundView.addSubview(modalBackgroundView)
        modalBackgroundView.addSubview(titleLabel)
        modalBackgroundView.addSubview(tagNameLabel)
        modalBackgroundView.addSubview(tagNameBackgroundView)
        tagNameBackgroundView.addSubview(tagNameTextField)
        modalBackgroundView.addSubview(tagColorLabel)
        modalBackgroundView.addSubview(tagAddButton)
        modalBackgroundView.addSubview(writeTagNameView)
        modalBackgroundView.addSubview(tagColorCollectionView)
    }
}
