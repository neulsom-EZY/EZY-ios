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
    
//    private let TextTitleView = UITextView().then{
//
//    }
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
            make.width.height.equalTo(24)
            make.top.equalTo(61)
            make.left.equalTo(28)
        }
        view.addSubview(TitleLabel)
        TitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backbutton.snp_bottomMargin).offset(51)
            
            make.left.equalTo(backbutton.snp_leftMargin)
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
