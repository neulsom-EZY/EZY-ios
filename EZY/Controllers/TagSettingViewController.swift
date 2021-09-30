//
//  TagSettingViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/22.
//

import UIKit
import Combine

class TagSettingViewController: UIViewController {
    
    var passButton = PassthroughSubject<UIButton, Never>()
    
    lazy var backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_TagManagementBackButtonImage"), for: .normal)
    }
    
    lazy var tagNameText = ""
    
    var tagColor = UIColor()
    
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
    
    var tagColorPreciousSelectedIndex = 0
    
    var tagNameTextCount = 0
    
    var tagDeleteModalView = TagDeleteModalView()
    
    var selectedTagIndex = 0
    
    var selectedTagColorIndex = 0
    
    var TagColorModels: [TagColorCollectionViewModel] = [
                                                TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[0], isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[1], isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[2], isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[3], isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[4], isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[5], isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[6], isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[7], isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[8], isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[9], isSelected: true),
                                                 TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[10], isSelected: true),
                                                TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[11], isSelected: true),
                                                TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[12], isSelected: true)]
    
    var tagName: String?
    var selectedColorIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSetting()
        
        tagColorCollectionViewSetting()
        
        tagDeleteModalViewSetting()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        TagColorModels[selectedTagColorIndex].isSelected = false
        print("선택된 color index입니다~ : \(selectedTagColorIndex)")
        tagColorCollectionView.reloadData()
    }
    
    func tagColorCollectionViewSetting(){
        
        tagColorCollectionView.backgroundColor = .white
        
        tagColorCollectionView.delegate = self
        tagColorCollectionView.dataSource = self
        
        tagColorCollectionView.register(TagColorCollectionViewCell.self, forCellWithReuseIdentifier: TagColorCollectionViewCell.reuseId)
        
        tagColorCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tagColorTitleLabel.snp.bottom)
            make.height.equalToSuperview().dividedBy(13)
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func layoutSetting(){
        TagManagementViewController.delegate = self
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(tagColorCollectionView)
        self.view.addSubview(writeTagNameView)
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
        completeButton.addTarget(self, action: #selector(completeButtonClicked(sender:)), for: .touchUpInside)
        
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
        
        writeTagNameView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.49)
            make.height.equalToSuperview().dividedBy(15.6)
        }
        
        writeTagNameView.isHidden = true
    }
    
    func tagDeleteModalViewSetting(){
        self.view.addSubview(tagDeleteModalView)
        
        tagDeleteModalView.deleteButton.addTarget(self, action: #selector(modalDeleteButtonClicked(sender:)), for: .touchUpInside)
        tagDeleteModalView.cancleButton.addTarget(self, action: #selector(cancleButtonClicked(sender:)), for: .touchUpInside)
        
        tagDeleteModalView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        tagDeleteModalView.shadowBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        tagDeleteModalView.modalBackgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.1)
            make.height.equalToSuperview().dividedBy(5.7)
            make.centerX.centerY.equalToSuperview()
        }

        if tagNameTextCount >= 15{ // tagName이 길 때
            tagDeleteModalView.labelView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalToSuperview().dividedBy(1.7)
                make.height.equalToSuperview().dividedBy(3.7)
                make.top.equalToSuperview().offset(self.view.frame.height/22.5)
            }

            tagDeleteModalView.tagTitleNameLabel.snp.makeConstraints { make in
                make.centerX.top.equalToSuperview()
            }

            tagDeleteModalView.deleteQuestionsLabel.snp.makeConstraints { make in
                make.bottom.centerX.equalToSuperview()
            }
        }else{ // tagName이 짧을 때
            tagDeleteModalView.labelView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalTo((tagDeleteModalView.tagTitleNameLabel.text! as NSString).size(withAttributes: [NSAttributedString.Key.font : tagDeleteModalView.tagTitleNameLabel.font as Any]).width + (tagDeleteModalView.deleteQuestionsLabel.text! as NSString).size(withAttributes: [NSAttributedString.Key.font : tagDeleteModalView.deleteQuestionsLabel.font as Any]).width + 10)
                make.height.equalToSuperview().dividedBy(5)
                make.top.equalToSuperview().offset(self.view.frame.height/22.5)
            }

            tagDeleteModalView.tagTitleNameLabel.snp.makeConstraints { make in
                make.centerY.left.equalToSuperview()
            }

            tagDeleteModalView.deleteQuestionsLabel.snp.makeConstraints { make in
                make.right.centerY.equalToSuperview()
            }
        }

        tagDeleteModalView.cancleButton.snp.makeConstraints { make in
            make.bottom.equalTo(tagDeleteModalView.deleteButton)
            make.right.equalTo(tagDeleteModalView.deleteButton.snp.left).offset(-self.view.frame.width/35)
            make.height.width.equalTo(tagDeleteModalView.deleteButton)
        }

        tagDeleteModalView.deleteButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/45.1)
            make.right.equalToSuperview().offset(-self.view.frame.width/15)
            make.height.equalToSuperview().dividedBy(4.27)
            make.width.equalToSuperview().dividedBy(4.44)
        }
        
        tagDeleteModalView.isHidden = true
    }
    
    @objc func modalDeleteButtonClicked(sender:UIButton){
        passButton.send(sender)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tagDeleteButtonClicked(sender:UIButton){
        tagDeleteModalView.isHidden = false
    }
    
    @objc func cancleButtonClicked(sender:UIButton){
        tagDeleteModalView.isHidden = true
    }
    
    @objc func completeButtonClicked(sender:UIButton){
        
        if tagNameTextField.text?.isEmpty == true{
            writeTagNameView.alpha = 13
            
            UIView.animate(withDuration: 0.4, animations: {

                self.writeTagNameView.isHidden = false

                  }, completion: {
                  _ in
                
                    Timer.scheduledTimer(timeInterval: TimeInterval(0.8), target: self, selector: #selector(self.hideView), userInfo: nil, repeats: false)
            })
        
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc private func hideView() {
            UIView.animate(withDuration: 0.4, animations: {
                self.writeTagNameView.alpha = 0
            }, completion: {
                _ in
                self.writeTagNameView.isHidden = true
            })
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

extension TagSettingViewController: SendTagNameSelectedCellIndexDelegate{
    func didTabTagSettingButton(with tagName: String, index: Int) {
        tagNameText = tagName
        tagNameTextField.text = tagNameText

        print("tagName \(tagName)")
    }
}

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
