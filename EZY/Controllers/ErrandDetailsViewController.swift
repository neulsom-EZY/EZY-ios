//
//  ErrandDetailsViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/28.
//

import UIKit
import SnapKit
import Then
import Alamofire
class ErrandDetailsViewController: UIViewController {
    //MARK: - Properties
    static let data = ["JiHoooooon","siwony"]
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_AFADFF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(todobackbtn), for: .touchUpInside)

    }
    private let TitleLabel = UILabel().then{
        $0.textColor = .EZY_AFADFF
        $0.text = "마카롱 사오기"
        $0.dynamicFont(fontSize: 22, weight: .semibold)
    }
    private let Errandlabel = UILabel().then{
        $0.text = "심부름"
        $0.dynamicFont(fontSize: 10, weight: .thin)
        $0.textColor = .EZY_6C6C6C
    }
    private let RequestList : inputContainerErrandTextView = {
        let viewModel = ErrandinputContainerTv(viewbackColor: .EZY_F4F6FF, titleText: "어떤 심부름을 부탁 받았나요?", titleColor: .EZY_8099FF, explanationText: "송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 송정카페에서 초코마카롱 사오기롱 사오기송정카페에서 초코", writeEditable: false)
        let view = inputContainerErrandTextView(with: viewModel)
        return view
    }()

    private let calendarBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_calendar")?.withRenderingMode(.alwaysTemplate), iconTintColor: .EZY_FFB5B5, message: "2021.6.6 일요일")
        let button = AlertButton(with: viewModel)
        
        button.addTarget(self, action: #selector(calendarAlert), for: .touchUpInside)
        return button
    }()
    private let clockBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_clock")?.withRenderingMode(.alwaysTemplate), iconTintColor: .EZY_FFCBB5, message: "11:00AM - 1:00PM")
        let button = AlertButton(with: viewModel)
        
        button.addTarget(self, action: #selector(clockAlert), for: .touchUpInside)
        return button
    }()
    private let locationBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_location")?.withRenderingMode(.alwaysTemplate), iconTintColor: .EZY_C7E0D4, message: "광주소프트웨어마이스터고등학교")
        let button = AlertButton(with: viewModel)
        
        button.addTarget(self, action: #selector(locationAlert), for: .touchUpInside)
        return button
    }()
    private let userBtn: OneAlertButton = {
        let viewModel = OneAlertBtn(icon: UIImage(named: "EZY_user-3")?.withRenderingMode(.alwaysTemplate), iconTintColor: .EZY_ADCAE5)
        let button = OneAlertButton(with: viewModel)
        return button
    }()
    
    fileprivate let userManagement : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero,collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cv.register(WhatAboutPeopleLikeThisCell.self, forCellWithReuseIdentifier: WhatAboutPeopleLikeThisCell.identifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        
        cv.showsHorizontalScrollIndicator = false
        cv.isScrollEnabled = false
        return cv
    }()

    
    private lazy var explanationContainerView : inputContainerErrandTextView = {
        let viewModel = ErrandinputContainerTv(viewbackColor: .EZY_F6F3FF, titleText: "설명", titleColor: .EZY_968DFF, explanationText: "송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 송정카페에서 초코마카롱 사오기롱 사오기송정카페에서 초코 송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 송정카페에서 초코마카롱 사오기롱 사오기송정카페에서 초코", writeEditable: false)
        let view = inputContainerErrandTextView(with: viewModel)
        return view
    }()
    
    private lazy var addButton : AdditionalButton = {
        let button = AdditionalButton(type: .system)
        button.title = "포기하기"
        button.addTarget(self, action: #selector(Addmytodobtn), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }
    
    //MARK: - Selectors
    
    @objc func todobackbtn(){
        //전페이지로 되돌아가는 버튼
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    
    @objc func calendarAlert(){
        // 날짜 Alert를 실행시킬 부분
    }
    @objc func clockAlert(){
        //시간 Alert를 실행시킬 부분
    }
    @objc func locationAlert(){
        //위치 Alert 실행시킬 부분
    }
    @objc func Addmytodobtn(){
        print("DEBUG:AddButton")
        //추가페이지 작성후 실행시키는 코드
        
        
    }
    @objc func Addlocationbtn(){
        let vc = AddMyToDoViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)    }

    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        userManagement.delegate = self
        userManagement.dataSource = self
        cornerRadius()
        addView()
        location()
        
    }
    
    func cornerRadius(){
        RequestList.layer.cornerRadius = view.frame.height/40.6
        addButton.layer.cornerRadius = view.frame.height/81.2
        explanationContainerView.layer.cornerRadius = view.frame.height/40.6
    }
    func addView(){
        view.addSubview(backbutton)
        view.addSubview(TitleLabel)
        view.addSubview(Errandlabel)
        view.addSubview(RequestList)
        view.addSubview(calendarBtn)
        view.addSubview(clockBtn)
        view.addSubview(locationBtn)
        view.addSubview(userBtn)
        view.addSubview(userManagement)
        view.addSubview(explanationContainerView)
        view.addSubview(addButton)
    }
    func location(){
        backbutton.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/33.8)
            make.left.equalTo(self.view.frame.height/29)
            make.top.equalTo(self.view.frame.height/13.3)
        }
        TitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backbutton.snp.bottom).offset(self.view.frame.height/36.9)
            make.left.equalTo(backbutton.snp.left)
        }
        Errandlabel.snp.makeConstraints { (make) in
            make.left.equalTo(TitleLabel.snp.right).offset(view.frame.height/162.4)
            make.bottom.equalTo(TitleLabel.snp.bottom).inset(view.frame.height/270.66)
        }
        RequestList.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/7.38)
            make.top.equalTo(TitleLabel.snp.bottom).offset(self.view.frame.height/19.8)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(self.view.frame.width/13.8 * -1)
            
        }
        calendarBtn.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/18.0)
            make.width.equalTo(view.frame.height/3.14)
            make.right.equalTo(view.snp.right).offset(view.frame.height/9.23 * -1)
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(RequestList.snp.bottom).offset(view.frame.height/30.1)
        }
        clockBtn.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/18.0)
            make.right.equalTo(view.snp.right).offset(view.frame.height/9.23 * -1)
            make.width.equalTo(view.frame.height/3.14)
            make.left.equalTo(calendarBtn.snp.left)
            make.top.equalTo(calendarBtn.snp.bottom).offset(view.frame.height/47.7)
        }
        locationBtn.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/18.0)
            make.right.equalTo(view.snp.right).offset(view.frame.height/9.23 * -1)
            make.width.equalTo(view.frame.height/3.14)
            make.left.equalTo(calendarBtn.snp.left)
            make.top.equalTo(clockBtn.snp.bottom).offset(view.frame.height/47.7)
        }
        userBtn.snp.makeConstraints { (make) in
            make.left.equalTo(calendarBtn.snp.left)
            make.top.equalTo(locationBtn.snp.bottom).offset(view.frame.height/47.7)
            make.height.width.equalTo(self.view.frame.height/18)
        }
        userManagement.snp.makeConstraints { (make) in
            make.left.equalTo(userBtn.snp.right)
            make.top.equalTo(userBtn.snp.top)
            make.height.equalTo(100)
            make.right.equalToSuperview()
        }
        
        explanationContainerView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/7.66)
            make.top.equalTo(userBtn.snp.bottom).offset(self.view.frame.height/30.0)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(self.view.frame.width/13.8 * -1)
        }
        

        addButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(view.frame.height/12.6875)
            make.height.equalTo(self.view.frame.height/18.0)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(RequestList.snp.right)
            
        }
    }
}
extension ErrandDetailsViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WhatAboutPeopleLikeThisCell.identifier, for: indexPath) as! WhatAboutPeopleLikeThisCell
        cell.bglabel.text = "@ " + ErrandDetailsViewController.data[indexPath.row]
        cell.bglabel.dynamicFont(fontSize: 12, weight:.thin)
        cell.bglabel.textColor = .EZY_3D64FF
        cell.layer.borderWidth = 1
        cell.bglabel.sizeToFit()
        cell.layer.borderColor = UIColor.EZY_6383FF.cgColor
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return WhatAboutPeopleLikeThisCell.fittingSize(availableHeight: view.frame.size.height/25.375, name: MorePeopleToDo.data[indexPath.row])
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.height/90.22
    }
    

}
