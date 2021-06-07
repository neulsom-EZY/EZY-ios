//
//  GroupManagementViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/07.
//

import UIKit

class GroupManagementViewController: UIViewController {
    
    //MARK: Properties
    let topView = TopView()
    
    let GroupCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    
    let titleLabel = ["영어 스터디 그룹", "EZY", "NELSOM", "영어 스터디 그룹", "EZY", "NELSOM", "영어 스터디 그룹", "EZY", "NELSOM", "영어 스터디 그룹", "EZY", "NELSOM"]
    
    let userNameGroup = ["youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n","youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n",]

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
        
        GroupCollectionView.register(GroupCollectionViewCell.self, forCellWithReuseIdentifier: GroupCollectionViewCell.GroupCollectionViewCellIdentifier)
        
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

extension GroupManagementViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.width / 2.4, height: self.view.frame.width / 2.4)
    }
    
    //MARK: collectionView - left Padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: self.view.frame.width/20, bottom: 0, right: self.view.frame.width/20)
    }
    
    //MARK: collectionView - cell 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.view.frame.height/45
    }
}

extension GroupManagementViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCollectionViewCell.GroupCollectionViewCellIdentifier, for: indexPath) as! GroupCollectionViewCell
        
        cell.titleLabel.text = titleLabel[indexPath.row]
        cell.userNameGroup.text = userNameGroup[indexPath.row]
        
        return cell
    }
    
    
}
