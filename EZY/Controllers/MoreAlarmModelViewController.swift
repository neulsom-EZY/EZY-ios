//
//  MoreAlarmModelViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/26.
//

import UIKit
import SnapKit
import Then

protocol AlarmModelDelegate: class {
    func onTapClose()
}
class MoreAlarmModelViewController : UIViewController{
    //MARK: - Properties
    weak var delegate: AlarmModelDelegate?
    let bgView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 40
    }
    let transparentView = UIView()
    
//    fileprivate let amPmCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        layout.scrollDirection = .vertical
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
//        cv.showsHorizontalScrollIndicator = false
//        cv.backgroundColor = .clear
//        return cv
//    }()

    
    static func instance() -> MoreAlarmModelViewController {
        return MoreAlarmModelViewController(nibName: nil, bundle: nil).then {
            $0.modalPresentationStyle = .overFullScreen
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        amPmCollectionView.delegate = self
//        amPmCollectionView.dataSource = self
        configureUI()
    }
    //MARK: - Selectors
    
    
    //MARK: - Helpers
    func configureUI(){
        view.addSubview(transparentView)
        view.addSubview(bgView)
//        view.addSubview(amPmCollectionView)
    }
}
//extension MoreAlarmModelViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//
//
//}
