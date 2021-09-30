//
//  TagManagementViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/22.
//

import UIKit

protocol SendTagNameSelectedCellIndexDelegate: AnyObject {
    func didTabTagSettingButton(with tagName: String, index: Int)
}

class TagManagementViewController: UIViewController {
    // MARK: - Properties
    var tagNameText = [String]()
    
    var tagColor = [UIColor]()
    
    static weak var delegate: SendTagNameSelectedCellIndexDelegate?
    
    lazy var selectedRecommendedTagIndex: Int = 0
    
    lazy var selectedTagColor: UIColor = TagColorModels[0].backgroundColor
    
    lazy var selectedTagIndex: Int = 0
    
    lazy var selectedTagColorIndex = 0
    
    var tagColorPreciousSelectedIndex = 0
    
    lazy var recommendedTagNameText = ["STUDY","EXCERISE","ENGLISH","EAT"]
    
    lazy var tagAddModalView = TagAddModalView().then{
        $0.tagAddButton.addTarget(self,action:#selector(tagAddCompletionbuttonClicked(sender:)), for:.touchUpInside)
        $0.tagNameTextField.delegate = self
        $0.writeTagNameView.isHidden = true
        $0.isHidden = true
    }
    
    lazy var noTagImageView = UIImageView().then{
        $0.image = UIImage(named: "EZY_NoTagImage")
    }
    
    lazy var tagGoodLabel = UILabel().then{
        $0.text = "태그를 사용하시면 더 쉽게 일정을 정리할 수 있어요!"
        $0.textColor = UIColor(red: 82/255, green: 82/255, blue: 82/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var tagAddLabel = UILabel().then{
        $0.text = "추가 버튼을 눌러 태그를 추가해보세요!"
        $0.textColor = .black
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_TagManagementBackButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
    }
    
    lazy var mainTitleLabel = UILabel().then {
        $0.text = "태그 관리"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "Poppins-SemiBold")
    }
    
    lazy var tagAddButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_PlanAddButton"), for: .normal)
        $0.addTarget(self, action: #selector(tagAddButtonClicked(sender:)), for: .touchUpInside)
    }
    
    lazy var tagTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.register(TagTableViewCell.self, forCellReuseIdentifier: TagTableViewCell.reuseId)
    }
    
    lazy var lineView = UIView().then{
        $0.backgroundColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
    }
        
    private let tagColorCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CalendarViewLayout()).then{
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 30, height: 30)
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .white
        $0.register(TagColorCollectionViewCell.self, forCellWithReuseIdentifier: TagColorCollectionViewCell.reuseId)
    }
    
    let recommendedTagCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then{
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.register(RecommendedTagCollectionViewCell.self, forCellWithReuseIdentifier: RecommendedTagCollectionViewCell.reuseId)
        $0.backgroundColor = .white
    }

    var TagColorModels: [TagColorCollectionViewModel] = [
                                                TagColorCollectionViewModel(backgroundColor: UIColor.EZY_TagColorArray[0], isSelected: false),
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
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if tagNameText.count == 0{
            tagTableView.isHidden = true
        }
    }
    
    // MARK: - configureUI
    func configureUI(){
        addView()
        
        location()
        
        collectionViewDataSourceAndDelegate()
        
        tableViewDataSourceAndDelegate()
        
        keyboardStatus()
    }
    
    // MARK: - keyboardStatus
    func keyboardStatus(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - collectionViewDataSourceAndDelegate
    func collectionViewDataSourceAndDelegate(){
        recommendedTagCollectionView.dataSource = self
        recommendedTagCollectionView.delegate = self
        tagColorCollectionView.dataSource = self
        tagColorCollectionView.delegate = self
    }
    
    // MARK: - tableViewDataSourceAndDelegate
    func tableViewDataSourceAndDelegate(){
        tagTableView.delegate = self
        tagTableView.dataSource = self
    }
    
    // MARK: - addView
    func addView(){
        self.view.backgroundColor = .white
        self.view.addSubview(backButton)
        self.view.addSubview(mainTitleLabel)
        self.view.addSubview(tagAddButton)
        self.view.addSubview(noTagImageView)
        self.view.addSubview(lineView)
        self.view.addSubview(tagGoodLabel)
        self.view.addSubview(tagAddLabel)
        self.view.addSubview(recommendedTagCollectionView)
        self.view.addSubview(tagTableView)
        self.view.addSubview(tagAddModalView)
        tagAddModalView.addSubview(tagAddModalView.shadowBackgroundView)
        tagAddModalView.modalBackgroundView.addSubview(tagColorCollectionView)
        tagAddModalView.shadowBackgroundView.addSubview(tagAddModalView.modalBackgroundView)
        tagAddModalView.modalBackgroundView.addSubview(tagAddModalView.titleLabel)
        tagAddModalView.modalBackgroundView.addSubview(tagAddModalView.tagNameLabel)
        tagAddModalView.modalBackgroundView.addSubview(tagAddModalView.tagNameBackgroundView)
        tagAddModalView.tagNameBackgroundView.addSubview(tagAddModalView.tagNameTextField)
        tagAddModalView.modalBackgroundView.addSubview(tagAddModalView.tagColorLabel)
        tagAddModalView.modalBackgroundView.addSubview(tagAddModalView.tagAddButton)
        tagAddModalView.modalBackgroundView.addSubview(tagAddModalView.writeTagNameView)
    }
    
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
        
        tagAddButton.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.right.equalToSuperview().offset(-self.view.frame.width/12)
            make.height.width.equalTo(backButton)
        }
        
        noTagImageView.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(self.view.frame.height/8.45)
            make.height.equalToSuperview().dividedBy(4)
            make.width.equalTo(noTagImageView.snp.height)
            make.centerX.equalToSuperview()
        }
    
        tagGoodLabel.snp.makeConstraints { make in
            make.centerX.equalTo(noTagImageView)
            make.top.equalTo(noTagImageView.snp.bottom).offset(self.view.frame.height/30)
        }
        
        tagAddLabel.snp.makeConstraints { make in
            make.centerX.equalTo(tagGoodLabel)
            make.top.equalTo(tagGoodLabel.snp.bottom).offset(self.view.frame.height/135.3)
        }
        
        recommendedTagCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tagAddLabel.snp.bottom).offset(self.view.frame.height/120.6)
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(6.6)
        }
        
        tagTableView.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(self.view.frame.height/26.1)
            make.height.equalToSuperview().dividedBy(2)
            make.left.equalTo(backButton)
            make.centerX.equalToSuperview()
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(0.5)
            make.left.equalTo(mainTitleLabel)
            make.centerX.equalToSuperview()
            make.top.equalTo(tagTableView.snp.bottom).offset(self.view.frame.height/40)
        }
        
        tagAddModalView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        tagAddModalView.shadowBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        tagAddModalView.modalBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.2)
            make.height.equalToSuperview().dividedBy(3.3)
        }
        
        tagAddModalView.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        tagAddModalView.tagNameLabel.snp.makeConstraints { make in
            make.top.equalTo(tagAddModalView.titleLabel.snp.bottom).offset(self.view.frame.height/62.4)
            make.left.equalTo(tagAddModalView.titleLabel)
        }
        
        tagAddModalView.tagNameBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(tagAddModalView.tagNameLabel)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(6.3)
            make.top.equalTo(tagAddModalView.tagNameLabel.snp.bottom).offset(self.view.frame.height/135.3)
        }
        
        tagAddModalView.tagNameTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/28.8)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        tagAddModalView.tagColorLabel.snp.makeConstraints { make in
            make.top.equalTo(tagAddModalView.tagNameBackgroundView.snp.bottom).offset(self.view.frame.height/50.7)
            make.left.equalTo(tagAddModalView.tagNameBackgroundView)
        }
        
        tagAddModalView.tagAddButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/40.6)
            make.right.equalToSuperview().offset(-self.view.frame.width/15)
            make.height.equalToSuperview().dividedBy(7.2)
            make.width.equalToSuperview().dividedBy(4.7)
        }
        
        tagAddModalView.writeTagNameView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.3)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        tagColorCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tagAddModalView.tagColorLabel.snp.bottom)
            make.left.equalToSuperview()
            make.height.equalTo(tagAddModalView.modalBackgroundView).dividedBy(5)
            make.right.equalTo(tagAddModalView.modalBackgroundView)
        }
    }
    
    // MARK: - selectors
    @objc func recommendedTagAddButtonClicked(sender:UIButton){
       
        recommendedTagViewDown()

        tagNameText.append(recommendedTagNameText[selectedRecommendedTagIndex])
        tagColor.append(UIColor.EZY_TagColorArray[5])
        
        recommendedTagCollectionView.deleteItems(at: [IndexPath.init(row: selectedRecommendedTagIndex, section: 0)])
        recommendedTagNameText.remove(at: selectedRecommendedTagIndex)
        
        if recommendedTagNameText.count == 0{

            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.lineView.snp.remakeConstraints { make in
                    make.height.equalTo(0.5)
                    make.left.equalTo(self.mainTitleLabel)
                    make.centerX.equalToSuperview()
                    make.top.equalTo(self.view.snp.bottom)
                }
                
                self.tagGoodLabel.snp.remakeConstraints { make in
                    make.centerX.equalTo(self.tagAddLabel)
                    make.top.equalTo(self.lineView.snp.bottom)
                }
                
                self.tagAddLabel.snp.remakeConstraints { make in
                    make.centerX.equalTo(self.recommendedTagCollectionView)
                    make.top.equalTo(self.tagGoodLabel.snp.bottom)
                }
                
                self.recommendedTagCollectionView.snp.remakeConstraints { make in
                    make.top.equalTo(self.tagAddLabel.snp.bottom)
                    make.left.right.equalToSuperview()
                    make.height.equalToSuperview().dividedBy(6.6)
                }
                
                self.tagTableView.snp.remakeConstraints { make in
                    make.top.equalTo(self.mainTitleLabel.snp.bottom).offset(self.view.frame.height/26.1)
                    make.bottom.equalToSuperview()
                    make.left.equalTo(self.backButton)
                    make.centerX.equalToSuperview()
                }
                
                self.recommendedTagCollectionView.superview?.layoutIfNeeded()
            })
            
        }
        
        tagTableView.backgroundColor = .clear
        tagTableView.reloadData()
    }
    
    @objc func tagAddButtonClicked(sender:UIButton){
        tagAddModalView.isHidden = false
        tagAddModalView.tagNameTextField.text = ""
    }
    
    @objc func tagAddCompletionbuttonClicked(sender:UIButton){
        
        if tagAddModalView.tagNameTextField.text?.isEmpty == true{
            tagAddModalView.writeTagNameView.alpha = 1
            
            UIView.animate(withDuration: 0.4, animations: {

                self.tagAddModalView.writeTagNameView.isHidden = false

                  }, completion: {
                  _ in
                    Timer.scheduledTimer(timeInterval: TimeInterval(0.8), target: self, selector: #selector(self.hideSnackbarView), userInfo: nil, repeats: false)
            })
        }else{
            
            self.view.endEditing(true)

            tagAddModalView.isHidden = true
                        
            recommendedTagViewDown()
            
            tagNameText.append(tagAddModalView.tagNameTextField.text!)
            tagColor.append(UIColor.EZY_TagColorArray[selectedTagIndex])
            
            
            tagTableView.reloadData()
        }
    }
    
    @objc func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tagSettingButtonClicked(sender:UIButton){
        let nextViewController = TagSettingViewController()
        
        nextViewController.tagColor = UIColor.EZY_TagColorArray[selectedTagIndex]
        
        nextViewController.tagNameTextField.text = "\(tagNameText[selectedTagIndex])"
        nextViewController.tagDeleteModalView.tagTitleNameLabel.text = "\(tagNameText[selectedTagIndex])"
        nextViewController.tagNameTextCount = tagNameText[selectedTagIndex].map{ $0 }.count
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // MARK: - Notification
    @objc func keyboardWillShow(_ sender: Notification) {
        tagAddModalView.modalBackgroundView.frame.origin.y = self.view.frame.height/5
    }

    @objc func keyboardWillHide(_ sender: Notification) {
        tagAddModalView.modalBackgroundView.frame.origin.y = (self.view.frame.height/2) - (tagAddModalView.modalBackgroundView.frame.height/2)
    }
    
    // MARK: - TouchEvent
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
        tagAddModalView.isHidden = true
    }
    
    // MARK: - recommendedTagViewDown
    func recommendedTagViewDown(){
        tagTableView.isHidden = false
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            
            self.tagGoodLabel.snp.remakeConstraints { make in
                make.centerX.equalTo(self.tagAddLabel)
                make.bottom.equalTo(self.tagAddLabel.snp.top).offset(-self.view.frame.height/100)
            }
            
            self.tagAddLabel.snp.remakeConstraints { make in
                make.centerX.equalTo(self.recommendedTagCollectionView)
                make.bottom.equalTo(self.recommendedTagCollectionView.snp.top).offset(-self.view.frame.height/135.3)
            }
            
            self.recommendedTagCollectionView.snp.remakeConstraints { make in
                make.bottom.equalToSuperview().offset(-self.view.frame.height/30)
                make.left.right.equalToSuperview()
                make.height.equalToSuperview().dividedBy(6.6)
            }
            
            self.noTagImageView.isHidden = true
            
            self.recommendedTagCollectionView.superview?.layoutIfNeeded()
        })
        
        self.tagGoodLabel.text = "이런 태그는 어때요?"
    }
    
    // MARK: - hideSnackbarView
    @objc private func hideSnackbarView() {
            UIView.animate(withDuration: 0.4, animations: {
                self.tagAddModalView.writeTagNameView.alpha = 0
            }, completion: {
                _ in
                self.tagAddModalView.writeTagNameView.isHidden = true
            })
    }

}

// MARK: - Extension
extension TagManagementViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tagTableView{
            return tagNameText.count
        }
        
        return Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tagTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: TagTableViewCell.reuseId, for: indexPath) as! TagTableViewCell
            cell.tagSettingButton.addTarget(self, action: #selector(tagSettingButtonClicked(sender:)), for: .touchUpInside)
                    
            cell.tagNameLabel.text = tagNameText[indexPath.row]
            cell.tagNameLabel.textColor = tagColor[indexPath.row]
            cell.tagLabelBackgroundView.layer.borderColor = tagColor[indexPath.row].cgColor
            
            cell.delegate = self
            cell.configure(with: "\(indexPath.row)")
            
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/15
    }
    

}

extension TagManagementViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tagColorCollectionView{
            return TagColorModels.count
        }else if collectionView == recommendedTagCollectionView{
            return recommendedTagNameText.count
        }
        
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagColorCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagColorCollectionViewCell.reuseId, for: indexPath) as! TagColorCollectionViewCell
            
            let firstCell = tagColorCollectionView.cellForItem(at: [0, 0]) as? TagColorCollectionViewCell
            firstCell?.checkImage.isHidden = false
            
            cell.backgroundColor = .white
            
            cell.setModel(TagColorModels[indexPath.row])
            
            return cell
        }else if collectionView == recommendedTagCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedTagCollectionViewCell.reuseId, for: indexPath) as! RecommendedTagCollectionViewCell
            
            cell.addButton.addTarget(self, action: #selector(recommendedTagAddButtonClicked(sender:)), for: .touchUpInside)
            
            cell.tagButton.setTitle(recommendedTagNameText[indexPath.row], for: .normal)
            
            cell.delegate = self
            cell.configure(with: "\(indexPath.row)")
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tagColorCollectionView{
            if TagColorModels[indexPath.row].isSelected {
                
                TagColorModels[tagColorPreciousSelectedIndex].isSelected.toggle()
                
                if TagColorModels.filter({ $0.isSelected }).count >= 1 {
                    TagColorModels[indexPath.row].isSelected.toggle()
                    
                    tagColorPreciousSelectedIndex = indexPath.row
                }
            }

            selectedTagColor = TagColorModels[indexPath.row].backgroundColor
            
            collectionView.reloadData()
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tagColorCollectionView{
            return CGSize(width: self.view.frame.height/27, height: self.view.frame.height/27)
        }else if collectionView == recommendedTagCollectionView{
            return CGSize(width: self.view.frame.height/8, height: self.view.frame.height/8)
        }
        
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == tagColorCollectionView{
            return UIEdgeInsets(top: 0, left: self.view.frame.height/33.8, bottom: 0, right: self.view.frame.height/33.8)
        }else if collectionView == recommendedTagCollectionView{
            return UIEdgeInsets(top: 0, left: self.view.frame.width/13.3, bottom: 0, right: self.view.frame.width/13.3)
        }
        
        return UIEdgeInsets()
    }
}

extension TagManagementViewController: CustomCollectionViewCellDelegate{
    func didTabButton(with string: String) {
        selectedRecommendedTagIndex = Int(string)!
    }
}

extension TagManagementViewController: TagTableViewCellDelegate{
    func didTabAddButton(with string: String) {
        selectedTagIndex = Int(string)!
    }
}

extension TagManagementViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = tagAddModalView.tagNameTextField.text else { return true }

        let newLength = text.count + string.count - range.length

        if newLength > 30 {
            for _ in 0 ..< newLength - 30 {
                textField.deleteBackward()
            }

        }
        return true
    }
}
