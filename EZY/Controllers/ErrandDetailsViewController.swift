//
//  ErrandDetailsViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/28.
//

import UIKit

class ErrandDetailsViewController: UIViewController {
    //MARK: - Properties
    static let data = ["JiHoooooon","siwony"]
    
    let bounds = UIScreen.main.bounds
    
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_AFADFF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(todobackbtn), for: .touchUpInside)

    }
    private let TitleLabel = UILabel().then{
        $0.textColor = .EZY_AFADFF
        $0.text = "받은 심부름"
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    private let Errandlabel = UILabel().then{
        $0.text = "심부름"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 108, green: 108, blue: 108)
    }
    private let RequestList : inputContainerErrandTextView = {
        let viewModel = ErrandinputContainerTv(viewbackColor: .rgb(red: 244, green: 246, blue: 255), titleText: "어떤 심부름을 부탁 받았나요?", titleColor: .rgb(red: 128, green: 153, blue: 255), explanationText: "송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 송정카페에서 초코마카롱 사오기롱 사오기송정카페에서 초코", writeEditable: false)
        let view = inputContainerErrandTextView(with: viewModel)
        return view
    }()

    private let calendarBtn : AlertButton = {
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_Calendar")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 255, green: 181, blue: 181), message: "2021.6.6 일요일")
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
        let viewModel = AlertBtn(icon: UIImage(named: "EZY_Location")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 199, green: 224, blue: 212), message: "광주소프트웨어마이스터고등학교")
        let button = AlertButton(with: viewModel)
        button.addTarget(self, action: #selector(locationAlert), for: .touchUpInside)
        return button
    }()
    private let userBtn: OneAlertButton = {
        let viewModel = OneAlertBtn(icon: UIImage(named: "EZY_user-3")?.withRenderingMode(.alwaysTemplate), iconTintColor: .rgb(red: 173, green: 202, blue: 239))
        let button = OneAlertButton(with: viewModel)
        return button
    }()
    private let userManagement : SendUser = {
        let viewModel = SendUserView(sender: data[0], recipient: data[1], senderColor: .rgb(red: 155, green: 175, blue: 255), recipientColor: .rgb(red: 254, green: 187, blue: 187), senderStrokeColor: .rgb(red: 186, green: 200, blue: 255), recipientStrokeColor: .rgb(red: 255, green: 204, blue: 204))
        let view = SendUser(with: viewModel)
        return view
    }()

    //MARK: - StackView
    private lazy var btnStackView = UIStackView(arrangedSubviews: [calendarBtn,clockBtn,locationBtn,onebtnStackView]).then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = bounds.height/47.7647
    }
    private lazy var onebtnStackView = UIStackView(arrangedSubviews: [userBtn,userManagement]).then{
        $0.axis = .horizontal
        $0.spacing = bounds.height/47.7647
    }
    private let explanationContainerView : inputContainerErrandTextView = {
        let viewModel = ErrandinputContainerTv(viewbackColor: .rgb(red: 246, green: 243, blue: 255), titleText: "설명", titleColor: .rgb(red: 150, green: 141, blue: 255), explanationText: "송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 송정카페에서 초코마카롱 사오기롱 사오기송정카페에서 초코 송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 사오기송정카페에서 초코마카롱 송정카페에서 초코마카롱 사오기롱 사오기송정카페에서 초코", writeEditable: false)
        let view = inputContainerErrandTextView(with: viewModel)
        return view
    }()
    
    private let addButton : AdditionalButton = {
        let button = AdditionalButton(type: .system)
        button.title = "포기하기"
        button.color = .EZY_BAC8FF
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
        navigationController?.popViewController(animated: true)
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

    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        cornerRadius()
        addView()
        location()
    }
    private func cornerRadius(){
        RequestList.layer.cornerRadius = view.frame.height/40.6
        addButton.layer.cornerRadius = view.frame.height/81.2
        explanationContainerView.layer.cornerRadius = view.frame.height/40.6
    }
    private func addView(){
        view.addSubview(backbutton)
        view.addSubview(TitleLabel)
        view.addSubview(Errandlabel)
        view.addSubview(RequestList)
        view.addSubview(btnStackView)
        view.addSubview(explanationContainerView)
        view.addSubview(addButton)
    }
    private func location(){
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
            make.left.right.equalToSuperview().inset(bounds.width/13.6363)
        }
        btnStackView.snp.makeConstraints {
            $0.top.equalTo(RequestList.snp.bottom).offset(bounds.self.height/42.74)
            $0.left.right.equalToSuperview().inset(bounds.width/13.6363)
            $0.height.equalTo(bounds.height/3.59)
        }
        explanationContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(userBtn.snp.bottom).offset(bounds.height/30.0)
            make.height.equalTo(bounds.height/7.66)
            make.left.right.equalToSuperview().inset(bounds.width/13.6363)
        }
        addButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(bounds.height/12.6875)
            make.height.equalTo(self.view.frame.height/18.0)
            make.left.right.equalToSuperview().inset(bounds.width/13.6363)
        }
    }
}
