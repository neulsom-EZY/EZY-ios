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
        let view = Utilities().inputContainerView(withMessage: title, textField: titleTextField, Color: .EZY_F4F6FF)
        
        return view
    }()
    
    private let titleTextField : UITextField = {
        let tf = Utilities().textField(TextColor: .EZY_656565, TextSize: 14)
        
        return tf
    }()
    

    

    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc func todobackbtn(){
        
    }
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        view.addSubview(backbutton)
        
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
