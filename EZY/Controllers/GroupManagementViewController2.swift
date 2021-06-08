//
//  GroupManagementViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/07.
//

import UIKit

class GroupManagementViewController2: UIViewController {
    
    //MARK: Properties
    let topView = TopView()
    
    let GroupCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 10, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        ($0.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        ($0.collectionViewLayout as! UICollectionViewFlowLayout).sectionInsetReference = .fromLayoutMargins
           
    }
    
    var greenColor: UIColor! = UIColor(red: 207/255, green: 227/255, blue: 206/255, alpha: 1)
    var orangeColor: UIColor! = UIColor(red: 255/255, green: 205/255, blue: 184/255, alpha: 1)
    var pinkColor: UIColor! = UIColor(red: 255/255, green: 191/255, blue: 191/255, alpha: 1)
    var blueColor: UIColor! = UIColor(red: 197/255, green: 208/255, blue: 255/255, alpha: 1)
    var purpleColor: UIColor! = UIColor(red: 196/255, green: 191/255, blue: 251/255, alpha: 1)
    var yellowColor: UIColor! = UIColor(red: 197/255, green: 226/255, blue: 181/255, alpha: 1)
    
    lazy var EZYPlanBackgroundColor: [UIColor] = [greenColor, orangeColor, pinkColor, blueColor, purpleColor, yellowColor,greenColor, orangeColor, pinkColor, blueColor, purpleColor, yellowColor]
    
    let titleLabel = ["영어 스터디", "EZY", "NELSOM", "영어 스터디", "EZY", "NELSOM", "영어 스터디", "EZY", "NELSOM", "영어 스터디", "EZY", "NELSOM"]
    
    let userNameGroup = ["youjin\nyoujin\nyoujin\nyouji","youjin\nyoujin\nyoujin\nyoujin\nyoujin\\n","youjin\\nyoujin\nyoujin\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\\\nyoujin\n","\nyoujin\nyoujin\\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\nyoujin\\\n","youjin\nyoujin\\nyoujin\\nyoujin\n","youjin\\\nyoujin\\nyoujin\n","youjin\nyoujin\nyoujin\\\nyoujin\n","youjin\nyoujin\\\nyoujin\nyoujin\n","youjin\nyoujinnyoujin\nyoujin\nyyoujin\nyoujin\\\nyoujin\nyoujin\nyoujin\nyoujin\\\nyoujin\nyoujin\nyoujin\nyoujin\\\nyoujin\nyoujin\noujin\\n"]

    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        topViewSetting()
        setupCollectionView()
    }
    
    func setupCollectionView(){
        self.view.addSubview(GroupCollectionView)
        
        GroupCollectionView.delegate = self
        GroupCollectionView.dataSource = self
        GroupCollectionView.contentInsetAdjustmentBehavior = .always

        
        GroupCollectionView.register(GroupCollectionViewCell.self, forCellWithReuseIdentifier: GroupCollectionViewCell.GroupCollectionViewCellIdentifier)
        GroupCollectionView.register(GroupAddCollectionViewCell.self, forCellWithReuseIdentifier: GroupAddCollectionViewCell.GroupAddCollectionViewCellIdentifier)
        
        GroupCollectionView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.width.bottom.centerX.equalToSuperview()
        }
           
    }
    
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
}

extension GroupManagementViewController2: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize.init(width: self.view.frame.width / 2.4, height: self.view.frame.width / 2.4)
//    }
    
    // MARK: - UICollectionViewDelegateFlowLayout -
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let sectionInset = (collectionViewLayout as! UICollectionViewFlowLayout).sectionInset
            let referenceHeight: CGFloat = 50 // Approximate height of your cell
//            let referenceWidth = collectionView.safeAreaLayoutGuide.layoutFrame.width
//                - sectionInset.left
//                - sectionInset.right
//                - collectionView.contentInset.left
//                - collectionView.contentInset.right
            let referenceWidth = collectionView.frame.width/3
            return CGSize(width: referenceWidth, height: referenceHeight)
    }
    
    //MARK: collectionView - left Padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: self.view.frame.width/16, bottom: 0, right: self.view.frame.width/16)
    }
    
    //MARK: collectionView - cell 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.view.frame.height/45
    }
}

extension GroupManagementViewController2: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupAddCollectionViewCell.GroupAddCollectionViewCellIdentifier, for: indexPath) as! GroupAddCollectionViewCell
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCollectionViewCell.GroupCollectionViewCellIdentifier, for: indexPath) as! GroupCollectionViewCell
            
            cell.titleLabel.text = titleLabel[indexPath.row]
            cell.configure(text: userNameGroup[indexPath.row])
            cell.titleBackgroundView.backgroundColor = EZYPlanBackgroundColor[indexPath.row]
            
            return cell
        }
    }
}
