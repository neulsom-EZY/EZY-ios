//
//  TagAddModalViewViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/11/05.
//

import UIKit

protocol TagAddDelegate: AnyObject {
    func updateData(tagName: String, tagColorIndex: Int)
}

class TagAddModalViewController: BaseModal {

    // MARK: - Properties
    weak var delegate: TagAddDelegate?
    
    private var tagColorPreciousSelectedIndex = 0
    
    private var selectedTagColorIndex = 0
    
    private var selectedTagColor = UIColor()

    private let bgView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "태그 추가"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 154/255, green: 174/255, blue: 253/255, alpha: 1)
    }
    
    private let tagNameLabel = UILabel().then {
        $0.text = "태그 이름"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    }
    
    private let tagNameBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    private let tagNameTextField = UITextField().then {
        $0.placeholder = "태그 이름을 입력하세요."
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
    }
    
    private let tagColorLabel = UILabel().then {
        $0.text = "태그 색"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    }
    
    private let tagAddButton = UIButton().then {
        $0.setTitle("완 료", for: .normal)
        $0.backgroundColor = UIColor(red: 154/255, green: 174/255, blue: 253/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.addTarget(self, action: #selector(MakeTodo), for: .touchUpInside)
    }
    
    private let writeTagNameView = UIButton().then{
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
    
    private let tagColorCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CalendarViewLayout()).then{
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 30, height: 30)
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.register(TagColorCollectionViewCell.self, forCellWithReuseIdentifier: TagColorCollectionViewCell.reuseId)
    }
    
    private var TagColorModels: [TagColorCollectionViewModel] = [
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[0], isSelected: false),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[1], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[2], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[3], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[4], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[5], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[6], isSelected: true),
        TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[7], isSelected: true)]

    // MARK: - configureUI
    override func configure() {
        super.configure()
        
        addView()
        location()
        delegateAndDataSource()
        addKeyboardNotifications()
    }
    
    // MARK: - addKeyboardNotifications
    private func addKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - addView
    private func addView(){
        self.view.addSubview(bgView)
        [titleLabel,tagNameLabel,tagNameBackgroundView].forEach {bgView.addSubview($0)}
        tagNameBackgroundView.addSubview(tagNameTextField)
        [tagColorLabel,tagAddButton,writeTagNameView,tagColorCollectionView].forEach {bgView.addSubview($0)}
    }
    
    // MARK: - location
    private func location(){
        bgView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.13)
            make.height.equalToSuperview().dividedBy(3.38)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/15.62)
            make.top.equalToSuperview().offset(self.view.frame.height/33.83)
        }
        
        tagNameLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel).offset(self.view.frame.height/200)
            make.top.equalTo(titleLabel.snp.bottom).offset(self.view.frame.height/81.2)
        }
        
        tagNameBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(tagNameLabel.snp.bottom).offset(self.view.frame.height/135.3)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(6.31)
        }
        
        tagNameTextField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/28)
            make.height.equalToSuperview().dividedBy(1.2)
        }
        
        tagColorLabel.snp.makeConstraints { make in
            make.left.equalTo(tagNameLabel)
            make.top.equalTo(tagNameBackgroundView.snp.bottom).offset(self.view.frame.height/50.75)
        }
        
        tagColorCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tagColorLabel.snp.bottom)
            make.left.equalToSuperview()
            make.height.equalTo(bgView).dividedBy(5)
            make.right.equalTo(bgView)
        }
        
        tagAddButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/13.2)
            make.top.equalTo(tagColorCollectionView.snp.bottom).offset(self.view.frame.height/100)
            make.width.equalToSuperview().dividedBy(4.71)
            make.height.equalToSuperview().dividedBy(7.27)
        }
    }
    
    // MARK: - delegateAndDataSource
    private func delegateAndDataSource(){
        tagColorCollectionView.delegate = self
        tagColorCollectionView.dataSource = self
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
    
    // MARK: - selectors
    @objc private func MakeTodo(){
        if tagNameTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty || tagNameTextField.text == ""{
            shakeView(tagNameLabel)
        }else{
            baseDelegate?.onTapClose()
            dismiss(animated: true, completion: nil)
            delegate?.updateData(tagName: tagNameTextField.text!, tagColorIndex: selectedTagColorIndex)
        }
    }
    
    @objc private func keyboardWillShow(_ noti: NSNotification){
        self.view.frame.origin.y -= 100
    }
    
    @objc private func keyboardWillHide(_ noti: NSNotification){
        self.view.frame.origin.y += 100
    }
    
    // MARK: - instance
    static func instance() -> TagAddModalViewController {
        return TagAddModalViewController(nibName: nil, bundle: nil).then {
            $0.modalPresentationStyle = .overFullScreen
        }
    }
}

// MARK: - Extension
extension TagAddModalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TagColorModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagColorCollectionViewCell.reuseId, for: indexPath) as! TagColorCollectionViewCell
        
        cell.setModel(TagColorModels[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if TagColorModels[indexPath.row].isSelected == true{
            
            TagColorModels[tagColorPreciousSelectedIndex].isSelected = true
            TagColorModels[indexPath.row].isSelected = false
            selectedTagColorIndex = indexPath.row
            tagColorPreciousSelectedIndex = indexPath.row
        }

        selectedTagColor = TagColorModels[indexPath.row].backgroundColor
        
        tagColorCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: self.view.frame.height/33.8, bottom: 0, right: self.view.frame.height/33.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.height/27, height: self.view.frame.height/27)
    }
}
