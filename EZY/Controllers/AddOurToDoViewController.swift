//
//  AddOurToDoViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/22.
//

import UIKit
import SnapKit
import Then
import Alamofire

class AddOurToDoViewController: UIViewController {
    
    //MARK: - Properties
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_CFCBFF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(todobackbtn), for: .touchUpInside)
    }
   
    let scrollView = UIScrollView().then  {
        $0.backgroundColor = .white
        
    }

    
    
    private let TitleLabel = UILabel().then{
        $0.textColor = .EZY_CFCBFF
        $0.text = "우리의 할 일 추가"
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
    
    
    private lazy var calendarButtonView : UIView = {
        let message = "2021. 6. 6 일요일 "
        let view = Utilities().AlertbtnView(withMessage: message, viewSize: Double(view.frame.height), button: calendarButton)
        return view
    }()
    
    private let calendarButton : UIButton = {
        let button = Utilities().AlertButton(image: UIImage(named: "calendar")!)
        button.addTarget(self, action: #selector(calendarAlert), for: .touchUpInside)
       return button
    }()
    
    
    
    private lazy var clockButtonView : UIView = {
        let message = "11:00AM - 1:00PM"
        let view = Utilities().AlertbtnView(withMessage: message, viewSize: Double(view.frame.height), button: clockButton)
        return view
    }()
    
    private let clockButton : UIButton = {
        let button = Utilities().AlertButton(image: UIImage(named: "clock")!)
        button.addTarget(self, action: #selector(calendarAlert), for: .touchUpInside)
       return button
    }()
    
    private lazy var locationButtonView : UIView = {
        let message = "광주소프트웨어마이스터고등학교"
        let view = Utilities().AlertbtnView(withMessage: message, viewSize: Double(view.frame.height), button: locationButton)
        return view
    }()
    private let locationButton : UIButton = {
        let button = Utilities().AlertButton(image: UIImage(named: "location")!)
        button.addTarget(self, action: #selector(calendarAlert), for: .touchUpInside)
       return button
    }()
    
    private lazy var explanationContainerView : UIView = {
        let title = "설명"
        let view = Utilities().inputContainerTextView(withMessage: title, textView: explanationTextView, Color: .EZY_F6F3FF, viewSize: Double(view.frame.height))

        return view
    }()
    
    private let explanationTextView : UITextView = {
        let tf = Utilities().textView(TextColor: .EZY_929292, TextSize: 14,font: .medium)
        
        return tf
    }()
    
    
    
    private let selectPeople = UILabel().then{
        $0.text = "인원선택"
        $0.textColor = .EZY_B6B6B6
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }
    
    private var collectionView: UICollectionView?

    private let tagLabel = UILabel().then{
        $0.text = "태그"
        $0.textColor = .EZY_B6B6B6
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }
    
    
    private let addButton : AdditionalButton = {
        let button = AdditionalButton(type: .system)
        button.title = "추가"
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
    
    @objc func Addmytodobtn(){
        print("DEBUG:AddButton")
        //추가페이지 작성후 실행시키는 코드
        
    }
    
    //MARK: - Helpers
    func configureUI(){
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.bottom.right.left.equalToSuperview()
        }
        
        
        scrollView.addSubview(backbutton)
        titleContainerView.layer.cornerRadius = view.frame.height/40.6
        addButton.layer.cornerRadius = view.frame.height/81.2
        calendarButton.layer.cornerRadius = view.frame.height/81.2
        clockButton.layer.cornerRadius = view.frame.height/81.2
        locationButton.layer.cornerRadius = view.frame.height/81.2
        explanationContainerView.layer.cornerRadius = view.frame.height/40.6
        
        backbutton.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/33.8)
            make.left.equalTo(self.view.frame.height/29)
            make.top.equalTo(view.frame.height/39.4)

        }
        
        scrollView.addSubview(TitleLabel)
        
        TitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backbutton.snp.bottom).offset(self.view.frame.height/36.9)
            make.left.equalTo(backbutton.snp.left)
        }
        
        scrollView.addSubview(titleContainerView)
        
        titleContainerView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/14.7)
            make.top.equalTo(TitleLabel.snp.bottom).offset(self.view.frame.height/19.8)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(view.snp.right).offset(self.view.frame.height/19.8 * -1)
        }

        scrollView.addSubview(calendarButtonView)
        calendarButtonView.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/18.0)
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(titleContainerView.snp.bottom).offset(view.frame.height/30.0)
        }

        scrollView.addSubview(clockButtonView)
        clockButtonView.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/18.0)
            make.left.equalTo(calendarButtonView.snp.left)
            make.top.equalTo(calendarButtonView.snp.bottom).offset(view.frame.height/47.8)
        }
        scrollView.addSubview(locationButtonView)

        locationButtonView.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/18.0)
            make.left.equalTo(calendarButtonView.snp.left)
            make.top.equalTo(clockButtonView.snp.bottom).offset(view.frame.height/47.7)
        }

        scrollView.addSubview(explanationContainerView)
        
        explanationContainerView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/10.8)
            make.top.equalTo(locationButtonView.snp.bottom).offset(self.view.frame.height/19.8)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(titleContainerView.snp.right)
        }
 
        scrollView.addSubview(selectPeople)
        selectPeople.snp.makeConstraints { (make) in
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(explanationContainerView.snp.bottom).offset(view.frame.height/38.6)
        }
       
        
        scrollView.addSubview(tagLabel)
        tagLabel.snp.makeConstraints { (make) in
            make.left.equalTo(selectPeople.snp.left)
            make.top.equalTo(selectPeople.snp.bottom).offset(view.frame.height/7)
        }
        
        scrollView.addSubview(addButton)
        
        addButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(tagLabel.snp.bottom).offset(view.frame.height/6.1)
            make.height.equalTo(self.view.frame.height/18.0)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(titleContainerView.snp.right)
        }
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.height/0.94)
        
   
  
    }
}
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    AddOurToDoViewController() // 이름 바꾸기
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif



