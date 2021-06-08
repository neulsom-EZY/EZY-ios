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

       print(heightForView(text: userNameGroup[indexPath.row], font: UIFont.systemFont(ofSize: 15), width:  200))
        return CGFloat(heightForView(text: userNameGroup[indexPath.row], font: UIFont.systemFont(ofSize: 15), width:  200)/76) * cellWidth
    }
}

class GroupManagementViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: Properties
    private(set) var collectionView: UICollectionView
    private var labelHeightConstraint: NSLayoutConstraint!
    
    let userNameGroup = [
        "1youjin\nyoujin\nyoujin\nyoujin\nyoyoujin\nyoujin\nyoujin\nyoujin\nyoujinujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n",
        "2youjin\nyoujin\nyoujin\n",
        "3\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n",
        "4youjin\nyoujin\nyoujin\nyoujin\n",
        "5youjyoujin\nyoujin\nyoujin\nyoujin\nyoujinin\n","6youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujinyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n",
        "y7oujin\nyoujin\nyoujin\n",
        "youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n",
        "youjin\nyoujin\nyoujin\nyoujin\n",
        "youjyoujin\nyoujin\nyoujin\nyoujin\nyoujinyoujin\nyoujin\nyoujin\nyoujin\nyoujinin\n",
        "youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\n",
        "youjin\nyoujin\nyoujin\n",
        "youjin\nyoujin\nyoujinin\nyoujin\nyoujinnyoujin\nyoujin\nyoujin\nn\nyoujin\nyoujin\nyoujin\n",
        "youjin\nyoujin\nyoujin\nyoujin\n",
        "youjiyoujin\nyoujin\nyoujin\nyoujin\nyoujinyoujin\nyoujin\nyoujin\nyoujin\nyoujinyoujin\nyoujin\nyoujin\nyoujin\nyoujinn\n"
    ]
    
    var greenColor: UIColor! = UIColor(red: 207/255, green: 227/255, blue: 206/255, alpha: 1)
    var orangeColor: UIColor! = UIColor(red: 255/255, green: 205/255, blue: 184/255, alpha: 1)
    var pinkColor: UIColor! = UIColor(red: 255/255, green: 191/255, blue: 191/255, alpha: 1)
    var blueColor: UIColor! = UIColor(red: 197/255, green: 208/255, blue: 255/255, alpha: 1)
    var purpleColor: UIColor! = UIColor(red: 196/255, green: 191/255, blue: 251/255, alpha: 1)
    var yellowColor: UIColor! = UIColor(red: 197/255, green: 226/255, blue: 181/255, alpha: 1)
    
    lazy var EZYPlanBackgroundColor: [UIColor] = [greenColor, orangeColor, pinkColor, blueColor, purpleColor, yellowColor,greenColor, orangeColor, pinkColor, blueColor, purpleColor, yellowColor]
    
    let titleLabel = ["영어 스터디", "EZY", "NELSOM", "영어 스터디", "EZY", "NELSOM", "영어 스터디", "EZY", "NELSOM", "영어 스터디", "EZY", "NELSOM"]
    
    //MARK: Initializers
    init() {
        // Create new `UICollectionView` and set `UICollectionViewFlowLayout` as its layout
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Create new `UICollectionView` and set `UICollectionViewFlowLayout` as its layout
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(coder: aDecoder)
    }
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    //MARK: setupCollectionView
    func setupCollectionView(){
        let pinterestLayout = PinterestLayout()
        pinterestLayout.delegate = self
        collectionView.collectionViewLayout = pinterestLayout
        
        collectionView.register(MultilineLabelCell.self, forCellWithReuseIdentifier: MultilineLabelCell.reuseId)
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        collectionView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).sectionInsetReference = .fromLayoutMargins
    }
    
    //MARK: Getting label height
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
           let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
           label.numberOfLines = 0
           label.lineBreakMode = NSLineBreakMode.byWordWrapping
           label.font = font
           label.text = text
           label.sizeToFit()
           
           return label.frame.height
    }
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultilineLabelCell.reuseId, for: indexPath) as! MultilineLabelCell
        cell.configure(text: userNameGroup[indexPath.row])
        return cell
    }
    
    //MARK: CollectionViewCell count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userNameGroup.count
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionInset = (collectionViewLayout as! UICollectionViewFlowLayout).sectionInset
        let referenceHeight: CGFloat = 100 // Approximate height of your cell
        let referenceWidth = collectionView.safeAreaLayoutGuide.layoutFrame.width
            - sectionInset.left
            - sectionInset.right
            - collectionView.contentInset.left
            - collectionView.contentInset.right
        return CGSize(width: referenceWidth/2.2, height: referenceHeight)
    }
}
