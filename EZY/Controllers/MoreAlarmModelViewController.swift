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
    let ampmData = ["오전","오후"]
    
    //MARK: - Properties
    weak var delegate: AlarmModelDelegate?
    
    let bgView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 40
    }
    let transparentView = UIView()
    
    fileprivate let ampmCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        cv.register(AmPmCell.self, forCellWithReuseIdentifier: AmPmCell.identifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let makeButton = UIButton().then{
        $0.backgroundColor = .EZY_8176FF
        $0.addTarget(self, action: #selector(MakeTodo), for: .touchUpInside)
    }
    private let makeTitle = UILabel().then{
        $0.text = "완 료"
        $0.textColor = .white
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }
  
    
    static func instance() -> MoreAlarmModelViewController {
        return MoreAlarmModelViewController(nibName: nil, bundle: nil).then {
            $0.modalPresentationStyle = .overFullScreen
        }
    }
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ampmCollectionView.delegate = self
        ampmCollectionView.dataSource = self
        configureUI()
    }
    
    //MARK: - Selectors
    @objc func onTapClose() {
        delegate?.onTapClose()
        dismiss(animated: true, completion: nil)
    }
    

    @objc func MakeTodo(){
        delegate?.onTapClose()
        dismiss(animated: true, completion: nil)
    }
    //MARK: - HELPERS
 
    
    
    func configureUI(){
        ampmCollectionView.backgroundColor = .clear
        ampmCollectionView.collectionViewLayout = ZoomAndSnapFlowLayout()
        addView()
        cornerRadius()
        location()
        addTransparentsview(frame: transparentView.frame)
    }
    func addView(){
        view.addSubview(transparentView)
        view.addSubview(bgView)
        bgView.addSubview(ampmCollectionView)
        makeButton.addSubview(makeTitle)
        view.addSubview(makeButton)
    }
    
    func cornerRadius(){
        makeButton.layer.cornerRadius = view.frame.height/81.2
    }
    
    func location(){
        bgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(30)
            make.height.equalToSuperview().dividedBy(3.85)
        }
        ampmCollectionView.snp.makeConstraints { (make) in
            make.centerY.equalTo(bgView.snp.centerY)
            make.height.equalTo(view.frame.height/22.5556)
            make.width.equalTo(100)
        }
        
        makeButton.snp.makeConstraints { (make) in
            make.top.equalTo(bgView.snp.top).offset(view.frame.height/6.15)
            make.right.equalTo(view.snp.right).offset(view.frame.height/22.56 * -1)
            make.width.equalTo(view.frame.height/11.6 )
            make.height.equalTo(view.frame.height/24.61 )
        }
        makeTitle.snp.makeConstraints { (make) in
            make.center.equalTo(makeButton.snp.center)
        }
        
        
    }

    func addTransparentsview(frame : CGRect){
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(onTapClose))
        transparentView.addGestureRecognizer(tapgesture)
    }
}
extension MoreAlarmModelViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.ampmCollectionView{
            return ampmData.count
        }
        else{
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: AmPmCell.identifier, for: indexPath) as! AmPmCell
        tagCell.bglabel.text = MoreAlarmModelViewController().ampmData[indexPath.row]
        return tagCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 100)
    }
}
