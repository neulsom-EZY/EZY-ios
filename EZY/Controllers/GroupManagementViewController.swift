//
//  ViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/08.
//

import UIKit

extension GroupManagementViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
            let cellWidth: CGFloat = (view.bounds.width - 4) / 2 // 셀 가로 크기
            
            if indexPath.row == 0{
                return 140
            }else{ return CGFloat(heightForView(text: userNameGroup[indexPath.row], font: UIFont.systemFont(ofSize: 15), width:  200)/76) * cellWidth }
    }
}

class GroupManagementViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    let topView = TopView()
    
    let groupAddModalView = GroupAddModalView()
    
    let searchResultsView = SearchResultsView()

    private(set) var groupCollectionView: UICollectionView
    
    private(set) var selectedMemberCollectionView: UICollectionView
    
    let titleLabelText = ["minjiii","minjiii","minjiii","minjiii","minjiii","minjiii","minjiii","minjiii","minjiii","minjiii","minjiii","minjiii","minjiii","minjiii","minjiii","minjiii"]
    
    private var labelHeightConstraint: NSLayoutConstraint!
    
    let recommendedUser = ["유진","경준","지환","예원","태현","상현","연주"]
    
    let userNameGroup = [
        "1youjin\nyoujin\nyoujin\nyoujin\nyin\n",
        "2youjin\nyoujin\nyoujin\n",
        "3\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n",
        "4youjin\nyoujin\nyoujin\nyoujin\n",
        "5youjyoujin\nyoujin\nyoujin\nyoujin\nyoujinin\n",
        "6youjin\nyoujin\nyoujin\nyoujin\nyoujin\n",
        "y7oujin\nyoujin\nyoujin\n",
        "youjin\nyoujin\nyoujin\nyo\nyoujin\nyoujin\n",
        "youjin\nyoujin\nyoujin\nyoujin\n",
        "youjyoujin\nyoujin\nyoujin\nyoujin\n",
        "youjin\nyoujin\nyoujin\nyoujin\nyoujyoujin\n",
        "youjin\nyoujin\nyoujin\n",
        "youjin\nyoujin\nyoujinin\nyoujin\nyoujin\nyoujin\n",
        "youjin\nyoujin\nyoujin\nyoujin\n",
        "youjiyoujin\nyoujin\nyoujin\nyoujin\nyoujinyoujinn\n"
    ]
    
    var groupTitle = ["영어스터디 그룹", "NEULSOM", "영어스터디 그룹", "NEULSOM", "영어스터디 그룹", "NEULSOM", "영어스터디 그룹", "NEULSOM", "영어스터디 그룹", "NEULSOM", "영어스터디 그룹", "NEULSOM", "영어스터디 그룹", "NEULSOM", "영어스터디 그룹", "NEULSOM", "영어스터디 그룹", "NEULSOM", "영어스터디 그룹", "NEULSOM", "영어스터디 그룹", "NEULSOM", "영어스터디 그룹", "NEULSOM" ]
    
    var greenColor: UIColor! = UIColor(red: 207/255, green: 227/255, blue: 206/255, alpha: 1)
    var orangeColor: UIColor! = UIColor(red: 255/255, green: 205/255, blue: 184/255, alpha: 1)
    var pinkColor: UIColor! = UIColor(red: 255/255, green: 191/255, blue: 191/255, alpha: 1)
    var blueColor: UIColor! = UIColor(red: 197/255, green: 208/255, blue: 255/255, alpha: 1)
    var purpleColor: UIColor! = UIColor(red: 196/255, green: 191/255, blue: 251/255, alpha: 1)
    var yellowColor: UIColor! = UIColor(red: 197/255, green: 226/255, blue: 181/255, alpha: 1)
    
    lazy var EZYPlanBackgroundColor: [UIColor] = [greenColor, orangeColor, pinkColor, blueColor, purpleColor, yellowColor,greenColor, orangeColor, pinkColor, blueColor, purpleColor, yellowColor,greenColor, orangeColor, pinkColor, blueColor, purpleColor, yellowColor,greenColor, orangeColor, pinkColor, blueColor, purpleColor, yellowColor,greenColor, orangeColor, pinkColor, blueColor, purpleColor, yellowColor,greenColor, orangeColor, pinkColor, blueColor, purpleColor, yellowColor]
    
    let titleLabel = ["영어 스터디", "EZY", "NELSOM", "영어 스터디", "EZY", "NELSOM", "영어 스터디", "EZY", "NELSOM", "영어 스터디", "EZY", "NELSOM"]
    
    //MARK: Initializers
    init() {
        groupCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        selectedMemberCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Create new `UICollectionView` and set `UICollectionViewFlowLayout` as its layout
        groupCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        selectedMemberCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(coder: aDecoder)
    }
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        topViewSetting()
        
        setupCollectionView()
        
        // selectedMemberCollectionView 설정
        selectedMemberCollectionViewSetting()
        
        // selectedMemberCollectionView 설정
        groupModalViewSetting()
        
    }
    
    //MARK: SettingGroupModalView
    func groupModalViewSetting(){
        self.view.addSubview(groupAddModalView)
        
        groupAddModalView.nickNameTextField.delegate = self
        
        groupAddModalView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        groupAddModalView.modalTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        groupAddModalView.groupMemberTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(groupAddModalView.modalTitleLabel)
            make.top.equalTo(groupAddModalView.modalTitleLabel.snp.bottom).offset(self.view.frame.height/45.1)
        }
        
        groupAddModalView.nicknameTextFieldBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(groupAddModalView.groupMemberTitleLabel)
            make.centerX.equalToSuperview()
            make.height.equalTo(groupAddModalView).dividedBy(21.3)
            make.top.equalTo(groupAddModalView.groupMemberTitleLabel.snp.bottom).offset(self.view.frame.height/135.3)
        }
        
        groupAddModalView.nickNameTextField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.height.equalToSuperview()
        }

        groupAddModalView.groupNameTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(selectedMemberCollectionView.snp.bottom).offset(self.view.frame.height/45.1)
            make.left.equalTo(selectedMemberCollectionView)
        }
        
        groupAddModalView.groupNameTextFieldBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(groupAddModalView.groupNameTitleLabel)
            make.centerX.equalToSuperview()
            make.height.equalTo(groupAddModalView.nicknameTextFieldBackgroundView)
            make.top.equalTo(groupAddModalView.groupNameTitleLabel.snp.bottom).offset(self.view.frame.height/135.3)
        }
        
        groupAddModalView.groupNameTextField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.height.equalToSuperview()
        }
        
        groupAddModalView.modalButton.snp.makeConstraints { make in
            make.top.equalTo(groupAddModalView.groupNameTextFieldBackgroundView.snp.bottom).offset(self.view.frame.height/42.7)
            make.width.equalToSuperview().dividedBy(4.7)
            make.height.equalToSuperview().dividedBy(10.3)
            make.right.equalTo(groupAddModalView.groupNameTextFieldBackgroundView)
        }
    }
    
    //MARK: topView Setting
    func topViewSetting(){
        self.view.addSubview(topView)
        topView.addSubview(topView.backButton)
        topView.addSubview(topView.titleLabel)
        
        topView.topViewDataSetting(backButtonImage: UIImage(named: "EZY_SettingBackButton")!, titleLabelText: "그룹 관리",
                                   textColor: UIColor(red: 175/255, green: 173/255, blue: 255/255, alpha: 1))
        
        topView.topViewLayoutSetting(screenHeight: Double(self.view.bounds.height), screenWeight: Double(self.view.bounds.width))
        
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
    }
    
    //MARK: selectedMemberCollectionView Setting
    func selectedMemberCollectionViewSetting(){
        selectedMemberCollectionView.delegate = self
        selectedMemberCollectionView.dataSource = self
        
        selectedMemberCollectionView.register(selectedMemberCollectionViewCell.self, forCellWithReuseIdentifier: selectedMemberCollectionViewCell.reuseId)
        
        groupAddModalView.modalView.addSubview(selectedMemberCollectionView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        selectedMemberCollectionView.collectionViewLayout = layout
        selectedMemberCollectionView.showsHorizontalScrollIndicator = false
        selectedMemberCollectionView.backgroundColor = .white
        
        selectedMemberCollectionView.snp.makeConstraints { make in
            make.left.equalTo(groupAddModalView.nicknameTextFieldBackgroundView)
            make.right.equalTo(groupAddModalView.modalView)
            make.height.equalToSuperview().dividedBy(4.5)
            make.top.equalTo(groupAddModalView.nicknameTextFieldBackgroundView.snp.bottom).offset(self.view.frame.height/81.2)
        }
    }
    
    //MARK: groupCollectionView Setting
    func setupCollectionView(){
        let pinterestLayout = PinterestLayout()
        pinterestLayout.delegate = self
        groupCollectionView.collectionViewLayout = pinterestLayout
        
        groupCollectionView.dataSource = self
        groupCollectionView.delegate = self
        
        groupCollectionView.register(GroupAddCollectionViewCell.self, forCellWithReuseIdentifier: GroupAddCollectionViewCell.reuseId)
        groupCollectionView.register(GroupCollectionViewCell.self, forCellWithReuseIdentifier: GroupCollectionViewCell.reuseId)

        self.view.addSubview(groupCollectionView)
        
        groupCollectionView.backgroundColor = .white
        
        groupCollectionView.contentInsetAdjustmentBehavior = .always
        groupCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        groupCollectionView.snp.makeConstraints { make in
            groupCollectionView.backgroundColor = .white
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
        }
        
        (groupCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        (groupCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).sectionInsetReference = .fromLayoutMargins

    }
    
    //MARK: 화면터치하여 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)

   }
    
    //MARK: textfield의 값이 변경될 때 호출되는 함수
    func textFieldDidBeginEditing(_ textField: UITextField){
        groupAddModalView.modalView.addSubview(searchResultsView.searchResultsBackgroundView)
        searchResultsView.searchResultLayoutSetting(screenHeight: Double(self.view.frame.height), screenWeight: Double(self.view.frame.width), textfieldBackground: groupAddModalView.nicknameTextFieldBackgroundView)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.isEmpty ?? true {
                print("textField is empty")
                searchResultsView.searchResultsBackgroundView.removeFromSuperview()
            } else {
                print("textField has some text")
            }
        
        return true
    }
    
    //MARK: label의 높이를 반환하는 함수
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
           let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
           label.numberOfLines = 0
           label.lineBreakMode = NSLineBreakMode.byWordWrapping
           label.font = font
           label.text = text
           label.sizeToFit()
           
           return label.frame.height
    }
}

extension GroupManagementViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    //MARK: cell 내용 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == groupCollectionView{  //MARK: cell 내용 설정 - GroupAddCollectionViewCell
            if indexPath.row == 0{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupAddCollectionViewCell.reuseId, for: indexPath) as! GroupAddCollectionViewCell
                
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCollectionViewCell.reuseId, for: indexPath) as! GroupCollectionViewCell
                
                cell.configure(text: userNameGroup[indexPath.row])
                cell.titleBackgroundView.backgroundColor = EZYPlanBackgroundColor[indexPath.row]
                cell.userNameGroup.text = userNameGroup[indexPath.row]
                
                return cell
            }
        }else{ //MARK: cell 내용 설정 - groupAddUserCollectionViewCell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: selectedMemberCollectionViewCell.reuseId, for: indexPath) as! selectedMemberCollectionViewCell
            
            cell.titleLabel.text = titleLabelText[indexPath.row]

            return cell
        }
        
        return UICollectionViewCell()
    }
    
    //MARK: cell이 선택되었을 때
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == groupCollectionView{
            if indexPath.row == 0{

            }
        }else{ //MARK: GroupAddCollectionView
            
        }
        
    }
    
}

extension GroupManagementViewController: UICollectionViewDataSource{
    
    //MARK: collectionView UIEdgeInsets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == groupCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }else if collectionView == selectedMemberCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        return UIEdgeInsets()
    }
    
    //MARK: cell 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == groupCollectionView{
            return userNameGroup.count
        }else if collectionView == selectedMemberCollectionView{
            return titleLabelText.count
        }
        
        return Int()
    }
    
    //MARK: CGSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == groupCollectionView{
            let sectionInset = (collectionViewLayout as! UICollectionViewFlowLayout).sectionInset
            let referenceHeight: CGFloat = 100 // Approximate height of your cell
            let referenceWidth = collectionView.safeAreaLayoutGuide.layoutFrame.width
                - sectionInset.left
                - sectionInset.right
                - collectionView.contentInset.left
                - collectionView.contentInset.right
            return CGSize(width: referenceWidth/2.2, height: referenceHeight)
            
        }else if collectionView == selectedMemberCollectionView{
            return CGSize(width: self.view.frame.width/5.3, height: self.view.frame.height/27)
        }
        
        return CGSize()
    }
}

