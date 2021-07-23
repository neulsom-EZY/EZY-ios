//
//  TagSettingViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/22.
//

import UIKit

class TagSettingViewController: UIViewController, UITextFieldDelegate {
    
    lazy var backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_TagManagementBackButtonImage"), for: .normal)
    }
    
    lazy var mainTitleLabel = UILabel().then {
        $0.text = "태그 설정"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "Poppins-SemiBold")
    }
    
    lazy var tagDeleteButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_DeleteButton"), for: .normal)
    }
    
    lazy var tagNameTitleLabel = UILabel().then {
        $0.text = "태그 이름"
        $0.textColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var tagNameTextField = UITextField().then {
        $0.placeholder = "태그 이름을 입력해주세요"
        $0.text = "APP PROGRAMMING"
        $0.textColor = UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var tagNameTextFieldUnderLineView = UIView().then{
        $0.backgroundColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1)
    }
    
    lazy var tagColorTitleLabel = UILabel().then {
        $0.text = "태그 색"
        $0.textColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var completeButton = UIButton().then{
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.setTitle("완 료", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    let tagColorCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .white
        $0.isScrollEnabled = false
    }
    
    var tagColorPreciousSelectedIndex = 0
    
    var tagDeleteModalView = TagDeleteModalView()
    
    var TagColorModels: [TagColorCollectionViewModel] = [TagColorCollectionViewModel(backgroundColor: UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1), isSelected: false),
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
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 150/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 170/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 160/255, blue: 255/255, alpha: 1), isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor(red: 255/255, green: 150/255, blue: 255/255, alpha: 1), isSelected: true)]

    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSetting()
        
        tagColorCollectionViewSetting()
        
        tagDeleteModalViewSetting()
    }
    
    func tagColorCollectionViewSetting(){
        self.view.addSubview(tagColorCollectionView)
        
        tagColorCollectionView.backgroundColor = .white
        
        tagColorCollectionView.delegate = self
        tagColorCollectionView.dataSource = self
        
        tagColorCollectionView.register(TagColorCollectionViewCell.self, forCellWithReuseIdentifier: TagColorCollectionViewCell.reuseId)
        
        tagColorCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tagColorTitleLabel.snp.bottom)
            make.height.equalToSuperview().dividedBy(8)
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func layoutSetting(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(backButton)
        self.view.addSubview(mainTitleLabel)
        self.view.addSubview(tagDeleteButton)
        self.view.addSubview(tagNameTitleLabel)
        self.view.addSubview(tagNameTextField)
        self.view.addSubview(tagNameTextFieldUnderLineView)
        self.view.addSubview(tagColorTitleLabel)
        self.view.addSubview(completeButton)
        
        tagNameTextField.delegate = self
        
        backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        tagDeleteButton.addTarget(self, action: #selector(tagDeleteButtonClicked(sender:)), for: .touchUpInside)
        
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
        
        tagDeleteButton.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.right.equalToSuperview().offset(-self.view.frame.width/12)
            make.height.width.equalTo(backButton)
        }
        
        tagNameTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(mainTitleLabel)
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(self.view.frame.height/24.6)
        }
        
        tagNameTextField.snp.makeConstraints { make in
            make.left.equalTo(tagNameTitleLabel).offset(self.view.frame.width/30)
            make.centerX.equalToSuperview()
            make.top.equalTo(tagNameTitleLabel.snp.bottom)
            make.height.equalToSuperview().dividedBy(25.3)
        }
        
        tagNameTextFieldUnderLineView.snp.makeConstraints { make in
            make.left.equalTo(tagNameTitleLabel)
            make.centerX.equalToSuperview()
            make.height.equalTo(2)
            make.top.equalTo(tagNameTextField.snp.bottom)
        }
        
        tagColorTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(tagNameTextFieldUnderLineView.snp.bottom).offset(self.view.frame.height/25.3)
            make.left.equalTo(tagNameTextFieldUnderLineView)
        }
        
        completeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.width/13.3)
            make.left.equalToSuperview().offset(self.view.frame.width/13.3)
            make.height.equalToSuperview().dividedBy(18)
            make.centerX.equalToSuperview()
        }
    }
    
    func tagDeleteModalViewSetting(){
        self.view.addSubview(tagDeleteModalView)
        
        tagDeleteModalView.deleteButton.addTarget(self, action: #selector(deleteButtonClicked(sender:)), for: .touchUpInside)
        
        tagDeleteModalView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        tagDeleteModalView.shadowBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        tagDeleteModalView.modalBackgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.13)
            make.height.equalToSuperview().dividedBy(3.59)
            make.centerX.centerY.equalToSuperview()
        }
        
        tagDeleteModalView.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        tagDeleteModalView.iconCircleBackground.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(6.3)
            make.height.equalTo(tagDeleteModalView.iconCircleBackground.snp.width)
            make.top.equalTo(tagDeleteModalView.titleLabel.snp.bottom).offset(self.view.frame.height/62)
            
            tagDeleteModalView.iconCircleBackground.layer.cornerRadius = ((self.view.frame.width/1.13)/6.3)/2
        }
        
        tagDeleteModalView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2)
        }
        
        tagDeleteModalView.labelView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.7)
            make.height.equalToSuperview().dividedBy(5.5)
            make.top.equalTo(tagDeleteModalView.iconCircleBackground.snp.bottom).offset(self.view.frame.height/63)
        }
        
        tagDeleteModalView.tagTitleNameLabel.snp.makeConstraints { make in
            make.centerX.top.equalToSuperview()
        }
        
        tagDeleteModalView.completeQuestionsLabel.snp.makeConstraints { make in
            make.bottom.centerX.equalToSuperview()
        }
        
        tagDeleteModalView.cancleButton.snp.makeConstraints { make in
            make.bottom.equalTo(tagDeleteModalView.deleteButton)
            make.right.equalTo(tagDeleteModalView.deleteButton.snp.left).offset(-self.view.frame.width/35)
            make.height.width.equalTo(tagDeleteModalView.deleteButton)
        }
        
        tagDeleteModalView.deleteButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/30.6)
            make.right.equalToSuperview().offset(-self.view.frame.width/15)
            make.height.equalToSuperview().dividedBy(7.2)
            make.width.equalToSuperview().dividedBy(4.7)
        }
        
        tagDeleteModalView.isHidden = true
    }
    
    @objc func deleteButtonClicked(sender:UIButton){
        let nextViewController = TagManagementViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tagDeleteButtonClicked(sender:UIButton){
        tagDeleteModalView.isHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tagNameTextField.resignFirstResponder()
        tagDeleteModalView.isHidden = true
    }

}

extension TagSettingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return TagColorModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagColorCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagColorCollectionViewCell.reuseId, for: indexPath) as! TagColorCollectionViewCell
            
            cell.backgroundColor = .white
            
            cell.setModel(TagColorModels[indexPath.row])
        
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if TagColorModels[indexPath.row].isSelected {
            
            TagColorModels[tagColorPreciousSelectedIndex].isSelected.toggle()
            
            if TagColorModels.filter({ $0.isSelected }).count >= 1 {
                TagColorModels[indexPath.row].isSelected.toggle()
                
                tagColorPreciousSelectedIndex = indexPath.row
            }
        }
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/12.5, height: self.view.frame.width/12.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: self.view.frame.width/24, left: self.view.frame.width/12, bottom: self.view.frame.width/24, right: self.view.frame.width/12)
    }
}
