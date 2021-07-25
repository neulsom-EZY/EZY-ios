//
//  AddErrandViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/22.
//

import UIKit
import SnapKit
import Then

class AddErrandViewController : UIViewController{
    //MARK: - Properties
    static let data = ["@JiHoooooon","+ 수정"]
    
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_AFADFF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(todobackbtn), for: .touchUpInside)

    }
    private let TitleLabel = UILabel().then{
        $0.textColor = .EZY_AFADFF
        $0.text = "심부름 추가"
        $0.dynamicFont(fontSize: 22, weight: .semibold)
    }
    
    private lazy var titleContainerView : UIView = {
        let title = "제목"
        let view = Utilities().inputContainerView(withMessage: title, textField: titleTextField, color: .EZY_F4F6FF,viewSize: Double(view.frame.height))
        return view
    }()

    private let titleTextField : UITextField = {
        let tf = Utilities().textField(textColor: .EZY_656565, textSize: 14,font: .medium)
        return tf
    }()
    
    private lazy var  RequestList : UIView = {
        let title = "어떤 심부름을 부탁할까요?"
        let view = Utilities().inputContainerCustomTextView(withMessage: title, textView: RequestTextView, Color: .EZY_F4F6FF, viewSize: Double(view.frame.height))
        return view
    }()
    private let RequestTextView : UITextView = {
        let tv = Utilities().textView(TextColor: .EZY_A7A7A7, TextSize: 12, font: .medium)
        return tv
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
    
    
    private lazy var explanationContainerView : UIView = {
        let title = "설명"
        let view = Utilities().inputContainerTextView(withMessage: title, textView: explanationTextView, Color: .EZY_F6F3FF, viewSize: Double(view.frame.height))

        return view
    }()
    private let kindOfCollectionView = UILabel().then{
        $0.text = "어떤 분에게 부탁할까요?"
        $0.textColor = .EZY_B6B6B6
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }
    private let explanationTextView : UITextView = {
        let tf = Utilities().textView(TextColor: .EZY_929292, TextSize: 14,font: .medium)
        return tf
    }()
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(WhoShouldIAskCell.self, forCellWithReuseIdentifier: WhoShouldIAskCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    private lazy var addButton : AdditionalButton = {
        let button = AdditionalButton(type: .system)
        button.title = "부탁하기"
        button.addTarget(self, action: #selector(Addmytodobtn), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = true
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
        collectionView.contentInset = UIEdgeInsets(top: 0, left: view.frame.height/29, bottom: 0, right: 0)

        collectionView.backgroundColor = .clear
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
        view.addSubview(RequestList)
        view.addSubview(calendarBtn)
        view.addSubview(clockBtn)
        view.addSubview(locationBtn)
        view.addSubview(explanationContainerView)
        view.addSubview(collectionView)
        view.addSubview(kindOfCollectionView)
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
        RequestList.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/10.545)
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
        explanationContainerView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/10.8)
            make.top.equalTo(locationBtn.snp.bottom).offset(self.view.frame.height/30.0)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(self.view.frame.width/13.8 * -1)
        }
        kindOfCollectionView.snp.makeConstraints { (make) in
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(explanationContainerView.snp.bottom).offset(view.frame.height/38.6)
        }
        collectionView.snp.makeConstraints { (make) in
            make.right.left.equalToSuperview()
            make.height.equalTo(view.frame.height/20)
            make.top.equalTo(kindOfCollectionView.snp.bottom).offset(view.frame.height/81.2)
        }
        addButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(view.frame.height/8.2 * -1)
            make.height.equalTo(self.view.frame.height/18.0)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(RequestList.snp.right)
            
        }
    }
}
//MARK: - AddErrandViewController CollectionView

extension AddErrandViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AddErrandViewController.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WhoShouldIAskCell.identifier, for: indexPath) as? WhoShouldIAskCell else {return UICollectionViewCell()}
        cell.bglabel.text = AddErrandViewController.data[indexPath.row]
        cell.bglabel.dynamicFont(fontSize: 12, weight:  .thin)
        cell.bglabel.textColor = .EZY_3D64FF
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.EZY_6383FF.cgColor
        if cell.bglabel.text == AddErrandViewController.data.last{
            cell.bglabel.textColor = .EZY_BAC8FF
            cell.layer.borderColor = UIColor.EZY_BAC8FF.cgColor
            cell.bglabel.dynamicFont(fontSize: 12, weight: .bold)
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return WhoShouldIAskCell.fittingSize(availableHeight: view.frame.height/25.375, name: AddErrandViewController.data[indexPath.row])
    }
}


