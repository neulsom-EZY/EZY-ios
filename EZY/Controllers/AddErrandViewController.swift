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
    
    
    private lazy var calendarButtonView : UIView = {
        let message = "2021. 6. 6 일요일 "
        let view = Utilities().AlertbtnView(withMessage: message, viewSize: Double(view.frame.height), button: calendarButton)
        return view
    }()
    
    private let calendarButton : UIButton = {
        let button = Utilities().AlertButton(image: UIImage(named: "calendar")!, tintColor: .EZY_FFB5B5)
        button.addTarget(self, action:#selector(calendarAlert), for: .touchUpInside)
       return button
    }()
    
    
    
    private lazy var clockButtonView : UIView = {
        let message = "11:00AM - 1:00PM"
        let view = Utilities().AlertbtnView(withMessage: message, viewSize: Double(view.frame.height), button: clockButton)
        return view
    }()
    
    private let clockButton : UIButton = {
        let button = Utilities().AlertButton(image: UIImage(named: "clock")!, tintColor: .EZY_FFCBB5)
        button.addTarget(self, action: #selector(calendarAlert), for: .touchUpInside)
       return button
    }()
    
    private lazy var locationButtonView : UIView = {
        let message = "광주소프트웨어마이스터고등학교"
        let view = Utilities().AlertbtnView(withMessage: message, viewSize: Double(view.frame.height), button: locationButton)
        return view
    }()
    private let locationButton : UIButton = {
        let button = Utilities().AlertButton(image: UIImage(named: "location")!, tintColor: .EZY_C7E0D4)
        button.addTarget(self, action: #selector(calendarAlert), for: .touchUpInside)
       return button
    }()
    
    private lazy var errandButtonView : UIView = {
        let message = "11:00AM - 1:00PM"
        let view = Utilities().AlertbtnView(withMessage: message, viewSize: Double(view.frame.height), button: errandButton)
        return view
    }()
    
    private let errandButton : UIButton = {
        let button = Utilities().AlertButton(image: UIImage(named: "person.3")!, tintColor: .EZY_ADCAE5)
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
    
    
    
    private let kindOfCollectionView = UILabel().then{
        $0.text = "태그"
        $0.textColor = .EZY_B6B6B6
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }
    
    private var collectionView: UICollectionView?


    
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
        view.backgroundColor = .white
        view.addSubview(backbutton)
        titleContainerView.layer.cornerRadius = view.frame.height/40.6
        addButton.layer.cornerRadius = view.frame.height/81.2
        calendarButton.layer.cornerRadius = view.frame.height/81.2
        clockButton.layer.cornerRadius = view.frame.height/81.2
        locationButton.layer.cornerRadius = view.frame.height/81.2
        explanationContainerView.layer.cornerRadius = view.frame.height/40.6
        
        backbutton.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/33.8)
            make.left.equalTo(self.view.frame.height/29)
            make.top.equalTo(self.view.frame.height/13.3)
        }
        
        view.addSubview(TitleLabel)
        
        TitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backbutton.snp.bottom).offset(self.view.frame.height/36.9)
            make.left.equalTo(backbutton.snp.left)
        }
        
        view.addSubview(titleContainerView)
        
        titleContainerView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/14.7)
            make.top.equalTo(TitleLabel.snp.bottom).offset(self.view.frame.height/19.8)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(self.view.frame.width/13.8 * -1)
        }

        view.addSubview(calendarButtonView)
        calendarButtonView.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/18.0)
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(titleContainerView.snp.bottom).offset(view.frame.height/30.0)
        }

        view.addSubview(clockButtonView)
        clockButtonView.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/18.0)
            make.left.equalTo(calendarButtonView.snp.left)
            make.top.equalTo(calendarButtonView.snp.bottom).offset(view.frame.height/47.8)
        }
        view.addSubview(locationButtonView)

        locationButtonView.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/18.0)
            make.left.equalTo(calendarButtonView.snp.left)
            make.top.equalTo(clockButtonView.snp.bottom).offset(view.frame.height/47.7)
        }

        view.addSubview(explanationContainerView)
        
        explanationContainerView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/10.8)
            make.top.equalTo(locationButtonView.snp.bottom).offset(self.view.frame.height/19.8)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(self.view.frame.width/13.8 * -1)
        }
        
        view.addSubview(kindOfCollectionView)
        kindOfCollectionView.snp.makeConstraints { (make) in
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(explanationContainerView.snp.bottom).offset(view.frame.height/38.6)
        }
        
        
        
        view.addSubview(addButton)
        
        addButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(view.frame.height/10.9 * -1)
            make.height.equalTo(self.view.frame.height/18.0)
            make.left.equalTo(backbutton.snp.left)
            make.right.equalTo(titleContainerView.snp.right)
            
        }
   
  
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
    AddErrandViewController() // 이름 바꾸기
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



