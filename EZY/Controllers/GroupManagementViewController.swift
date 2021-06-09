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
            }else{
                
                return CGFloat(heightForView(text: userNameGroup[indexPath.row], font: UIFont.systemFont(ofSize: 15), width:  200)/76) * cellWidth
            
        }
    }
}

class GroupManagementViewController: UIViewController {
    
    //MARK: Properties
    let topView = TopView()
    
    let groupModalView = GroupModalView()

    private(set) var groupCollectionView: UICollectionView
    
    let recommendUserCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
            
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    
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
        // Create new `UICollectionView` and set `UICollectionViewFlowLayout` as its layout
        groupCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Create new `UICollectionView` and set `UICollectionViewFlowLayout` as its layout
        groupCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(coder: aDecoder)
    }
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        topViewSetting()
        
        GroupModalViewSetting()
        
        setupCollectionView()
    }
    
    //MARK: setuptopView
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
    
    //MARK: modal창 설정
    func GroupModalViewSetting(){
        groupModalView.addSubview(groupModalView.backgroundView)
        groupModalView.backgroundView.addSubview(groupModalView.modalView)
        groupModalView.modalView.addSubview(groupModalView.modalTitleLabel)
        groupModalView.modalView.addSubview(groupModalView.modalButton)
        groupModalView.modalView.addSubview(groupModalView.groupMemberTitleLabel)
        groupModalView.modalView.addSubview(groupModalView.nicknameTextFieldBackgroundView)
        groupModalView.nicknameTextFieldBackgroundView.addSubview(groupModalView.nickNameTextField)
        groupModalView.modalView.addSubview(groupModalView.groupNameTitleLabel)
        groupModalView.modalView.addSubview(groupModalView.groupNameTextFieldBackgroundView)
        groupModalView.groupNameTextFieldBackgroundView.addSubview(groupModalView.groupNameTextField)
        
        groupModalView.GroupModalDataSetting(modalTitleText: "그룹 추가", modalColor: UIColor(red: 255/255, green: 191/255, blue: 191/255, alpha: 1))

    }
    
    //MARK: collectionView 설정
    func setupCollectionView(){
        let pinterestLayout = PinterestLayout()
        pinterestLayout.delegate = self
        groupCollectionView.collectionViewLayout = pinterestLayout
        
        groupCollectionView.register(GroupAddCollectionViewCell.self, forCellWithReuseIdentifier: GroupAddCollectionViewCell.reuseId)
        groupCollectionView.register(GroupCollectionViewCell.self, forCellWithReuseIdentifier: GroupCollectionViewCell.reuseId)

        view.addSubview(groupCollectionView)
        
        groupCollectionView.backgroundColor = .white
        
        groupCollectionView.contentInsetAdjustmentBehavior = .always
        groupCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        groupCollectionView.snp.makeConstraints { make in
            groupCollectionView.backgroundColor = .white
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
        }
        
        groupCollectionView.dataSource = self
        groupCollectionView.delegate = self
        
        (groupCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        (groupCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).sectionInsetReference = .fromLayoutMargins
        
        //MARK: recommendUserCollectionView 설정
        groupModalView.modalView.addSubview(recommendUserCollectionView)
        recommendUserCollectionView.delegate = self
        recommendUserCollectionView.dataSource = self
        recommendUserCollectionView.register(groupAddUserCollectionViewCell.self, forCellWithReuseIdentifier: groupAddUserCollectionViewCell.reuseId)
        
        recommendUserCollectionView.snp.makeConstraints { make in
            make.top.equalTo(groupModalView.nicknameTextFieldBackgroundView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(self.view.frame.height/13)
        }
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: groupAddUserCollectionViewCell.reuseId, for: indexPath) as! groupAddUserCollectionViewCell
            
            cell.titleLabel.text = titleLabelText[indexPath.row]
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    //MARK: cell이 선택되었을 때
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == groupCollectionView{
            if indexPath.row == 0{
                print("addButtonClicked")
                self.view.addSubview(groupModalView)
                groupModalView.snp.makeConstraints { make in
                    make.top.bottom.right.left.equalToSuperview()
                }
                groupModalView.GroupModalLayoutSetting(screenHeight: Double(self.view.bounds.height), screenWeight: Double(self.view.bounds.width))
                
            }
        }else{ //MARK: GroupAddCollectionView
            
        }
        
    }
    
}

extension GroupManagementViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == groupCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }else{
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        }
        
        return UIEdgeInsets()
    }
    
    //MARK: cell 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == recommendUserCollectionView{
            return titleLabelText.count
        }else{
            return userNameGroup.count
        }
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
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
        }else{
            return CGSize(width: self.view.frame.width/5, height: 30)
        }
    }
}
