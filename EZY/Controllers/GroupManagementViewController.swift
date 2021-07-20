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
    
    let groupModifyDeleteModalView = GroupModifyDeleteModalView()
    
    var modifyViewButtonSelected = true
    
    var deleteViewButtonSelected = false
    
    let deleteModalView = DeleteModalView()

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
                
        topViewSetting()
        
        layoutSetting()
        
        setupCollectionView()
        
        selectedMemberCollectionViewSetting()
        
        groupModalViewSetting()
        
        groupModifyDeleteModalViewSetting()
        
        deleteModalViewSetting()
        
    }

    func layoutSetting(){
        self.view.backgroundColor = .white

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: deleteModalView Setting
    func deleteModalViewSetting(){
        self.view.addSubview(deleteModalView)
        deleteModalView.addSubview(deleteModalView.backgroundView)
        deleteModalView.backgroundView.addSubview(deleteModalView.modalBackgroundView)
        deleteModalView.modalBackgroundView.addSubview(deleteModalView.modalTitleLabel)
        deleteModalView.modalBackgroundView.addSubview(deleteModalView.circleView)
        deleteModalView.modalBackgroundView.addSubview(deleteModalView.labelContentView)
        deleteModalView.modalBackgroundView.addSubview(deleteModalView.userName)
        deleteModalView.modalBackgroundView.addSubview(deleteModalView.labeltobottomView)
        deleteModalView.labeltobottomView.addSubview(deleteModalView.cancelButton)
        deleteModalView.labeltobottomView.addSubview(deleteModalView.deleteButton)
        deleteModalView.labelContentView.addSubview(deleteModalView.planNameLabel)
        deleteModalView.labelContentView.addSubview(deleteModalView.deleteLabel)
        deleteModalView.circleView.addSubview(deleteModalView.iconImageView)
        
        deleteModalView.cancelButton.addTarget(self, action: #selector(groupCancelButtonClicked(_:)), for: .touchUpInside)
        deleteModalView.deleteButton.addTarget(self, action: #selector(groupDeleteButtonClicked(_:)), for: .touchUpInside)

        deleteModalView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        deleteModalView.backgroundView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        deleteModalView.modalBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3.5)
            make.width.equalToSuperview().dividedBy(1.1)
        }

        deleteModalView.modalTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.height/33.8)
            make.top.equalToSuperview().offset(self.view.frame.height/33.8)
        }
        
        deleteModalView.circleView.snp.makeConstraints { make in
            make.width.height.equalTo(self.view.snp.height).dividedBy(15.3)
            make.top.equalTo(deleteModalView.modalTitleLabel.snp.bottom).offset(self.view.frame.height/58)
            make.centerX.equalToSuperview()
            
            deleteModalView.circleView.layer.cornerRadius = (self.view.frame.height/15.3)/2
        }
        
        deleteModalView.iconImageView.snp.makeConstraints { make in
            make.height.width.equalTo(deleteModalView.modalBackgroundView.snp.height).dividedBy(9)
            make.centerX.centerY.equalToSuperview()
        }
        
        deleteModalView.userName.snp.makeConstraints { make in
            make.bottom.equalTo(deleteModalView.labelContentView.snp.top).offset(-self.view.frame.height/270)
            make.left.equalTo(deleteModalView.labelContentView)
        }
        
        deleteModalView.labelContentView.snp.makeConstraints { make in
            make.top.equalTo(deleteModalView.iconImageView.snp.bottom).offset(self.view.frame.height/30)
            make.height.equalToSuperview().dividedBy(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.4)
        }
        
        deleteModalView.planNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        deleteModalView.deleteLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        deleteModalView.labeltobottomView.snp.makeConstraints { make in
            make.top.equalTo(deleteModalView.labelContentView.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        deleteModalView.cancelButton.snp.makeConstraints { make in
            make.height.equalTo(deleteModalView.modalBackgroundView).dividedBy(6.8)
            make.width.equalTo(deleteModalView.modalBackgroundView).dividedBy(4.7)
            make.centerY.equalToSuperview()
            make.right.equalTo(deleteModalView.deleteButton.snp.left).offset(-self.view.frame.width/20)
        }
        
        deleteModalView.deleteButton.snp.makeConstraints { make in
            make.height.equalTo(deleteModalView.modalBackgroundView).dividedBy(6.8)
            make.width.equalTo(deleteModalView.modalBackgroundView).dividedBy(4.7)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-self.view.frame.width/15)
        }
        
        deleteModalView.isHidden = true
    }

    //MARK: groupModifyDeleteModalView Setting
    func groupModifyDeleteModalViewSetting(){
        
        self.view.addSubview(groupModifyDeleteModalView)
        groupModifyDeleteModalView.addSubview(groupModifyDeleteModalView.backgroundView)
        groupModifyDeleteModalView.backgroundView.addSubview(groupModifyDeleteModalView.modalBackgroundView)
        groupModifyDeleteModalView.modalBackgroundView.addSubview(groupModifyDeleteModalView.groupModifyLabelBackgroundView)
        groupModifyDeleteModalView.modalBackgroundView.addSubview(groupModifyDeleteModalView.groupDeleteLabelBackgroundView)
        groupModifyDeleteModalView.modalBackgroundView.addSubview(groupModifyDeleteModalView.introTitleLabel)
        groupModifyDeleteModalView.modalBackgroundView.addSubview(groupModifyDeleteModalView.modifyViewButton)
        groupModifyDeleteModalView.modalBackgroundView.addSubview(groupModifyDeleteModalView.deleteViewButton)
        
        groupModifyDeleteModalView.deleteViewButton.addSubview(groupModifyDeleteModalView.deleteLabel)
        groupModifyDeleteModalView.modifyViewButton.addSubview(groupModifyDeleteModalView.modifyLabel)
        
        groupModifyDeleteModalView.modifyViewButton.addSubview(groupModifyDeleteModalView.modifyIconBackgroundCircleView)
        groupModifyDeleteModalView.deleteViewButton.addSubview(groupModifyDeleteModalView.deleteIconBackgroundCircleView)
        groupModifyDeleteModalView.modifyIconBackgroundCircleView.addSubview(groupModifyDeleteModalView.modifyIconImageView)
        groupModifyDeleteModalView.deleteIconBackgroundCircleView.addSubview(groupModifyDeleteModalView.deleteIconImageView)
        
        groupModifyDeleteModalView.modalBackgroundView.addSubview(groupModifyDeleteModalView.selectButton)
        
        groupModifyDeleteModalView.deleteViewButton.addTarget(self, action: #selector(groupDeleteViewButtonClicked(sender:)), for: .touchUpInside)
        
        groupModifyDeleteModalView.modifyViewButton.addTarget(self, action: #selector(groupModifyViewButtonClicked(sender:)), for: .touchUpInside)
        
        groupModifyDeleteModalView.selectButton.addTarget(self, action: #selector(selectButtonClicked(sender:)), for: .touchUpInside)
        
        groupModifyDeleteModalView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        groupModifyDeleteModalView.backgroundView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        groupModifyDeleteModalView.modalBackgroundView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2.9)
            make.centerX.equalToSuperview()
        }
        
        groupModifyDeleteModalView.introTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/19.3)
            make.centerX.equalToSuperview()
        }
        
        groupModifyDeleteModalView.deleteViewButton.snp.makeConstraints { make in
            make.height.equalTo(self.view).dividedBy(7.8)
            make.width.equalTo(self.view).dividedBy(4.1)
            make.top.equalTo(groupModifyDeleteModalView.introTitleLabel.snp.bottom).offset(self.view.frame.height/27)
            make.left.equalToSuperview().offset(self.view.frame.width/5)
        }
        
        groupModifyDeleteModalView.modifyViewButton.snp.makeConstraints { make in
            make.height.equalTo(self.view).dividedBy(7.8)
            make.width.equalTo(self.view).dividedBy(4.1)
            make.top.equalTo(groupModifyDeleteModalView.introTitleLabel.snp.bottom).offset(self.view.frame.height/27)
            make.right.equalToSuperview().offset(-self.view.frame.width/5)
        }
        
        groupModifyDeleteModalView.modifyLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-self.view.frame.height/40.6)
        }
        
        groupModifyDeleteModalView.deleteLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-self.view.frame.height/40.6)
        }
        
        groupModifyDeleteModalView.deleteIconBackgroundCircleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/40.6)
            make.height.equalTo(self.view).dividedBy(27)
            make.width.equalTo(groupModifyDeleteModalView.deleteIconBackgroundCircleView.snp.height)
            
            groupModifyDeleteModalView.deleteIconBackgroundCircleView.layer.cornerRadius = (self.view.frame.height/27)/2
        }
        
        groupModifyDeleteModalView.modifyIconBackgroundCircleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/40.6)
            make.height.equalTo(self.view).dividedBy(27)
            make.width.equalTo(groupModifyDeleteModalView.deleteIconBackgroundCircleView.snp.height)
            
            groupModifyDeleteModalView.modifyIconBackgroundCircleView.layer.cornerRadius = (self.view.frame.height/27)/2
        }
        
        groupModifyDeleteModalView.deleteIconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.3)
        }
        
        groupModifyDeleteModalView.modifyIconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.3)
        }
        
        groupModifyDeleteModalView.selectButton.snp.makeConstraints { make in
            make.height.equalTo(self.view).dividedBy(24.6)
            make.width.equalTo(self.view).dividedBy(5.3)
            make.bottom.equalToSuperview().offset(-self.view.frame.width/15)
            make.right.equalToSuperview().offset(-self.view.frame.width/15)
        }
        
        groupModifyDeleteModalView.isHidden = true
    }
    
    //MARK: GroupModalView Setting
    func groupModalViewSetting(){
        self.view.addSubview(groupAddModalView)
        
        groupAddModalView.nickNameTextField.delegate = self
        groupAddModalView.groupNameTextField.delegate = self
        
        groupAddModalView.groupModalViewHideButton.addTarget(self, action: #selector(self.groupAddModalViewHide), for: .touchUpInside)
        
        groupAddModalView.modalView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2.3)
            make.width.equalToSuperview().dividedBy(1.2)
        }
        
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
        
        groupAddModalView.groupModalViewHideButton.snp.makeConstraints { make in
            make.right.equalTo(groupAddModalView.modalButton)
            make.top.equalTo(groupAddModalView.modalTitleLabel)
            make.height.width.equalTo(groupAddModalView.modalTitleLabel.snp.height)
        }
        
        groupAddModalView.isHidden = true
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
            make.height.equalToSuperview().dividedBy(4.9)
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
    
    @objc func selectButtonClicked(sender: UIButton){
        groupModifyDeleteModalView.isHidden = true
        if deleteViewButtonSelected == true{ // 일정 삭제가 선택되었다면
            deleteModalView.isHidden = false // 삭제 모달 띄우기
        }else if modifyViewButtonSelected == true{ // 일정 수정이 선택되었다면
            groupAddModalView.isHidden = false
        }
    }
    
    @objc func groupDeleteViewButtonClicked(sender: UIButton){
        if deleteViewButtonSelected == false{
            // 삭제 버튼 테두리 주고, 강조 색 주기
            groupModifyDeleteModalView.deleteViewButton.layer.borderWidth = 1
            groupModifyDeleteModalView.deleteViewButton.layer.borderColor = UIColor(red: 131/255, green: 122/255, blue: 255/255, alpha: 1).cgColor
            groupModifyDeleteModalView.deleteLabel.textColor = UIColor(red: 131/255, green: 122/255, blue: 255/255, alpha: 1)
            groupModifyDeleteModalView.deleteIconBackgroundCircleView.backgroundColor = UIColor(red: 131/255, green: 122/255, blue: 255/255, alpha: 1)
            
            // 수정 버튼 테두리 없애고, 강조 색 빼기
            groupModifyDeleteModalView.modifyViewButton.layer.borderWidth = 0
            groupModifyDeleteModalView.modifyLabel.textColor = UIColor(red: 188/255, green: 183/255, blue: 255/255, alpha: 1)
            groupModifyDeleteModalView.modifyIconBackgroundCircleView.backgroundColor = UIColor(red: 188/255, green: 183/255, blue: 255/255, alpha: 1)
            
            deleteViewButtonSelected.toggle()
            modifyViewButtonSelected.toggle()
        }
    }
    
    @objc func groupModifyViewButtonClicked(sender: UIButton){
        if modifyViewButtonSelected == false{
            // 수정 버튼 테두리 주고, 강조 색 주기
            groupModifyDeleteModalView.modifyViewButton.layer.borderWidth = 1
            groupModifyDeleteModalView.modifyViewButton.layer.borderColor = UIColor(red: 131/255, green: 122/255, blue: 255/255, alpha: 1).cgColor
            groupModifyDeleteModalView.modifyLabel.textColor = UIColor(red: 131/255, green: 122/255, blue: 255/255, alpha: 1)
            groupModifyDeleteModalView.modifyIconBackgroundCircleView.backgroundColor = UIColor(red: 131/255, green: 122/255, blue: 255/255, alpha: 1)
            
            // 삭제 버튼 테두리 없애고, 강조 색 빼기
            groupModifyDeleteModalView.deleteViewButton.layer.borderWidth = 0
            groupModifyDeleteModalView.deleteLabel.textColor = UIColor(red: 188/255, green: 183/255, blue: 255/255, alpha: 1)
            groupModifyDeleteModalView.deleteIconBackgroundCircleView.backgroundColor = UIColor(red: 188/255, green: 183/255, blue: 255/255, alpha: 1)
            
            deleteViewButtonSelected.toggle()
            modifyViewButtonSelected.toggle()
        }
    }
    
    @objc func groupCancelButtonClicked(_ button: UIButton){
        print("groupCancelButtonClicked")
        deleteModalView.isHidden = true
    }
    
    @objc func groupDeleteButtonClicked(_ button: UIButton){
        print("groupDeleteButtonClicked")
        deleteModalView.isHidden = true
    }
    
    @objc func groupAddModalViewHide(sender: UIButton){
        groupAddModalView.isHidden = true
        self.view.endEditing(true)
    }
    
    func groupModalViewStartAnimation(){
        groupModalViewLayoutUpdateByKeyBoard()
        UIView.animate(withDuration: 3, delay: 1, options:.curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc //MARK: 모달 창 올리기
    func keyboardWillShow(_ sender: Notification) {
        groupAddModalView.modalView.frame.origin.y = self.view.frame.height/10
    }

    @objc //MARK: 모달 창 원래대로
    func keyboardWillHide(_ sender: Notification) {
        groupAddModalView.modalView.frame.origin.y = (self.view.frame.height/2) - (groupAddModalView.modalView.frame.height/2)
    }
    
    func groupModalViewLayoutUpdateByKeyBoard(){
        groupAddModalView.modalView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2.3)
            make.width.equalToSuperview().dividedBy(1.2)
        }
    }

    //MARK: 화면터치하여 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
        groupModifyDeleteModalView.isHidden = true
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
                groupAddModalView.isHidden = false
                groupAddModalView.GroupModalDataSetting(modalTitleText: "그룹 추가", modalColor: UIColor(red: 255/255, green: 191/255, blue: 191/255, alpha: 1))
            }else{
                groupModifyDeleteModalView.isHidden = false
                
                modifyViewButtonSelected = false
                deleteViewButtonSelected = true
                
                groupModifyDeleteModalView.deleteViewButton.layer.borderWidth = 1
                groupModifyDeleteModalView.deleteViewButton.layer.borderColor = UIColor(red: 131/255, green: 122/255, blue: 255/255, alpha: 1).cgColor
                groupModifyDeleteModalView.deleteViewButton.setTitleColor(UIColor(red: 131/255, green: 122/255, blue: 255/255, alpha: 1), for: .normal)
                
                groupModifyDeleteModalView.modifyViewButton.layer.borderWidth = 0
            }
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

