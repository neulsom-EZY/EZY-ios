//
//  TagSettingViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/22.
//

import UIKit
import Combine

protocol SendChangedTagSetting{
    func didTagCompleteButton(changedTagName: String, changedColorIndex: Int, tagColorPreciousSelectedIndex: Int)
}

class TagSettingViewController: UIViewController {
    // MARK: - Properties
    var delegate: SendChangedTagSetting?
    
    private var tagNameText = ""
    
    private let tagColor = UIColor()
    
    private let tagName: String = ""
    
    private var selectedColorIndex: Int = 0
    
    private var tagColorPreciousSelectedIndex = 0
    
    private var tagNameTextCount = 0
    
    private var selectedTagIndex = 0
    
    private var selectedTagColorIndex = 0
    
    var passDeleteEventButton = PassthroughSubject<UIButton, Never>()
    
    private let backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_TagManagementBackButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let mainTitleLabel = UILabel().then {
        $0.text = "태그 설정"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "Poppins-SemiBold")
    }
    
    private let tagDeleteButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_DeleteButton"), for: .normal)
    }
    
    private let tagNameTitleLabel = UILabel().then {
        $0.text = "태그 이름"
        $0.textColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private let tagNameTextField = UITextField().then {
        $0.placeholder = "태그 이름을 입력해주세요"
        $0.text = "APP PROGRAMMING"
        $0.textColor = UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let tagNameTextFieldUnderLineView = UIView().then{
        $0.backgroundColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1)
    }
    
    private let tagColorTitleLabel = UILabel().then {
        $0.text = "태그 색"
        $0.textColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private let completeButton = UIButton().then{
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.setTitle("완 료", for: .normal)
        $0.addTarget(self, action: #selector(completeButtonClicked(sender:)), for: .touchUpInside)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private let tagColorCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .white
        $0.register(TagColorCollectionViewCell.self, forCellWithReuseIdentifier: TagColorCollectionViewCell.reuseId)
    }
    
    private var TagColorModels: [TagColorCollectionViewModel] = [
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[0], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[1], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[2], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[3], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[4], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[5], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[6], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[7], isSelected: true)]

    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI(){
        addView()
        location()
        dataSourceAndDelegate()
    }
    
    // MARK: - dataSourceAndDelegate
    private func dataSourceAndDelegate(){
        tagColorCollectionView.delegate = self
        tagColorCollectionView.dataSource = self
        TagManagementViewController.delegate = self
        tagNameTextField.delegate = self
    }
    
    // MARK: - addView
    private func addView(){
        self.view.backgroundColor = .white
        [tagColorCollectionView, backButton, mainTitleLabel, tagDeleteButton, tagNameTitleLabel, tagNameTextField, tagNameTextFieldUnderLineView, tagColorTitleLabel, completeButton].forEach { view.addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
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
            make.left.equalTo(tagNameTitleLabel).offset(self.view.frame.width/70)
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

        tagColorCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tagColorTitleLabel.snp.bottom)
            make.height.equalToSuperview().dividedBy(13)
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Selectors
    @objc private func modalDeleteButtonClicked(sender:UIButton){
        passDeleteEventButton.send(sender)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func completeButtonClicked(sender:UIButton){
        if tagNameTextField.text?.isEmpty == true{
            shakeView(tagNameTitleLabel)
        }else{
            for i in 0...TagColorModels.count-1{
                if TagColorModels[i].isSelected == false{
                    selectedTagColorIndex = i
                }
            }
            
            delegate?.didTagCompleteButton(changedTagName: tagNameTextField.text!, changedColorIndex: selectedTagColorIndex, tagColorPreciousSelectedIndex: tagColorPreciousSelectedIndex)
            print("changedColorIndex : \(selectedTagColorIndex)")
            navigationController?.popViewController(animated: true)
        }
    }
    
    func dataSetting(selectedTagColorIndex: Int, tagName: String, tagColorPreciousSelectedIndex: Int){
        tagNameTextField.text = tagName
        TagColorModels[selectedTagColorIndex].isSelected = false
        TagColorModels[tagColorPreciousSelectedIndex].isSelected = true
        tagColorCollectionView.reloadData()
        tagNameTextCount = tagName.count
        self.selectedTagColorIndex = selectedTagColorIndex
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
}

// MARK: - CollectionView Extension
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
        if collectionView == tagColorCollectionView{
            if TagColorModels[indexPath.row].isSelected == true{
                TagColorModels[selectedTagColorIndex].isSelected = true
                
                TagColorModels[indexPath.row].isSelected = false
                
                selectedTagColorIndex = indexPath.row
                
                tagColorCollectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/12.5, height: self.view.frame.width/12.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: self.view.frame.width/24, left: self.view.frame.width/12, bottom: self.view.frame.width/24, right: self.view.frame.width/12)
    }
}

// MARK: - SendTagNameSelectedCellIndexDelegate Extension
extension TagSettingViewController: SendTagNameSelectedCellIndexDelegate{
    func didTabTagSettingButton(with tagName: String, index: Int) {
        tagNameText = tagName
        tagNameTextField.text = tagNameText
    }
}

// MARK: - UITextFieldDelegate Extension
extension TagSettingViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = tagNameTextField.text else { return true }

        let newLength = text.count + string.count - range.length

        if newLength > 27 {
            for _ in 0 ..< newLength - 27 {
                textField.deleteBackward()
            }
        }
        return true
    }
}
