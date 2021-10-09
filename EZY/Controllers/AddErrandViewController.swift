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
    var data = ["JiHooooooooon","+ 추가"]
    let bounds = UIScreen.main.bounds
    
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_AFADFF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(todobackbtn), for: .touchUpInside)

    }
    private let TitleLabel = UILabel().then{
        $0.textColor = .EZY_AFADFF
        $0.text = "심부름 추가"
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private var RequestList : ErrandInputContainterTextField = {
        let tf = ErrandInputContainterTextField(title: "어떤 심부름을 부탁할까요?")
        return tf
    }()
    fileprivate lazy var btnStackView = UIStackView(arrangedSubviews: [calendarBtn,clockBtn,locationBtn]).then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = bounds.height/47.7647
    }
    
    private let calendarBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_calendar")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 255, green: 181, blue: 181), message: "2021.6.6 일요일")
        let button = AlertButton(with: viewModel)
        
        button.addTarget(self, action: #selector(calendarAlert), for: .touchUpInside)
        return button
    }()
    private let clockBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_clock")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 255, green: 203, blue: 181), message: "11:00AM - 1:00PM")
        let button = AlertButton(with: viewModel)
        
        button.addTarget(self, action: #selector(clockAlert), for: .touchUpInside)
        return button
    }()
    private let locationBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_location")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 199, green: 224, blue: 212), message: "광주소프트웨어마이스터고등학교")
        let button = AlertButton(with: viewModel)
        
        button.addTarget(self, action: #selector(locationAlert), for: .touchUpInside)
        return button
    }()
    
    
    private let explanationContainerView : ExplanationContainerTextView = {
        let view = ExplanationContainerTextView(tvTitle: "설명")
        return view
    }()
    private let kindOfCollectionView = UILabel().then{
        $0.text = "어떤 분에게 부탁할까요?"
        $0.textColor = .rgb(red: 182, green: 182, blue: 182)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
 
    
    let addPersonCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(WhoShouldIAskCell.self, forCellWithReuseIdentifier: WhoShouldIAskCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        cv.isScrollEnabled = false
        return cv
    }()
    
    private lazy var addButton : AdditionalButton = {
        let button = AdditionalButton(type: .system)
        button.title = "부탁하기"
        button.color = .EZY_BAC8FF
        button.addTarget(self, action: #selector(Addmytodobtn), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addPersonCollectionView.dataSource = self
        addPersonCollectionView.delegate = self
        addPersonCollectionView.allowsMultipleSelection = true
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
        addPersonCollectionView.contentInset = UIEdgeInsets(top: 0, left: view.frame.height/29, bottom: 0, right: 0)

        addPersonCollectionView.backgroundColor = .clear
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
        view.addSubview(btnStackView)
        view.addSubview(explanationContainerView)
        view.addSubview(addPersonCollectionView)
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
        btnStackView.snp.makeConstraints {
            $0.top.equalTo(RequestList.snp.bottom).offset(bounds.height/30.1)
            $0.left.equalTo(backbutton.snp.left)
            $0.right.equalToSuperview().inset(bounds.height/9.23)
            $0.height.equalTo(bounds.height/4.805)
        }
        explanationContainerView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/10.8)
            make.top.equalTo(btnStackView.snp.bottom).offset(self.view.frame.height/30.0)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(self.view.frame.width/13.8 * -1)
        }
        kindOfCollectionView.snp.makeConstraints { (make) in
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(explanationContainerView.snp.bottom).offset(view.frame.height/33.75)
        }
        addPersonCollectionView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.height/25.375)
            make.top.equalTo(kindOfCollectionView.snp.bottom).offset(view.frame.height/81.2)
        }
        addButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(view.frame.height/8.202)
            make.height.equalTo(self.view.frame.height/18.0)
            make.left.right.equalToSuperview().inset(view.frame.width/13.636363)
        }
    }

}

//MARK: - AddErrandViewController CollectionView

extension AddErrandViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if data.count == 1{
            if indexPath.item == indexPath.last{
                    let controller = MorePeopleToDo()
                navigationController?.pushViewController(controller, animated: true)
            }
        }else{
            if indexPath.item == 0{
                    
            }
            else if indexPath.item == indexPath.last{
                let controller = MorePeopleToDo()
                navigationController?.pushViewController(controller, animated:true)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WhoShouldIAskCell.identifier, for: indexPath) as? WhoShouldIAskCell else {return UICollectionViewCell()}
        cell.bglabel.text = data[indexPath.row]
        cell.bglabel.dynamicFont(fontSize: 12, currentFontName:  "AppleSDGothicNeo-UltraLight")
        cell.bglabel.textColor = .rgb(red: 61, green: 100, blue: 255)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.rgb(red: 99, green: 131, blue: 255).cgColor
   
        if cell.bglabel.text == data.last{
            cell.bglabel.textColor = .EZY_BAC8FF
            cell.layer.borderColor = UIColor.EZY_BAC8FF.cgColor
            cell.bglabel.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        }
        if data.count == 2 {
            if indexPath.item == indexPath.first{
                cell.bglabel.text = "@" + data[indexPath.item]
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = data[indexPath.row]
        label.sizeToFit()
        return CGSize(width: label.frame.width + view.frame.height/40.6, height: view.frame.height/25.375)
    }

}
