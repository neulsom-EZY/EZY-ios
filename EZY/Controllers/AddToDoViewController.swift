//
//  AddToDoViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/05/31.
//

import UIKit
import SnapKit
import Then
import Alamofire

class AddToDoViewController:UIViewController{
    
    //MARK: - Properties
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_BAC8FF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(todobackbtn), for: .touchUpInside)
        $0.sizeThatFits(CGSize(width: 24, height: 24))
    }
    private let TitleLabel = UILabel().then{
        $0.textColor = .EZY_BAC8FF
        $0.text = "나의 할 일 추가"
        $0.dynamicFont(fontSize: 22, weight: .semibold)
    }
    
    private lazy var titleContainerView : UIView = {
        let title = "제목"
        let view = Utilities().inputContainerView(withMessage: title, textField: titleTextField, Color: .EZY_F4F6FF,ViewSize: Double(view.frame.width) )

        return view
    }()
    
    private let titleTextField : UITextField = {
        let tf = Utilities().textField(TextColor: .EZY_656565, TextSize: 14)
        
        return tf
    }()
    
    
    private lazy var calendarButtonView : UIView = {
        let message = "2020 - 10 - 28"
        let view = Utilities().AlertbtnView(withMessage: message, ViewSize: Double(view.frame.width), Button: calendarButton)
        return view
    }()
    
    private let calendarButton : UIButton = {
        let button = Utilities().AlertButton(image: UIImage(named: "calendar")!)
        button.addTarget(self, action: #selector(calendarAlert), for: .touchUpInside)
        button.setImage(UIImage(named: "calendar"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
       return button
    }()
    
    
    private let addButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("추가", for: .normal)
        
        button.backgroundColor = .EZY_BAC8FF
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
        
        backbutton.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.frame.height/33.8)
            make.left.equalTo(self.view.frame.width/13.3)
            make.top.equalTo(self.view.frame.height/13.3)
        }
        
        view.addSubview(TitleLabel)
        
        TitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backbutton.snp.bottom).offset(self.view.frame.height/30.0)
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
    AddToDoViewController()
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
