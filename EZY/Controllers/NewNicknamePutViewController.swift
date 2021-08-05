//
//  NewNicknamePutViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/08/05.
//

import UIKit
import SnapKit
import Then

class NewNicknamePutViewController: UIViewController{
    //MARK: - Properties
    
    let topBarView = TopBarView().then {
        $0.goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    lazy var toNewNicknameLabel = UILabel().then {
        $0.text = "새로운 닉네임을"
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    lazy var putLabel = UILabel().then {
        $0.text = "입력해주세요."
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF, UIColor.rgba(red: 148, green: 139, blue: 255, alpha: 0.4)])
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc
    func goBack(){
        navigationController?.popViewController(animated: true )
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        addView()
        topBarViewSetting()
        cornerRadius()
        location()
    }
    
    func addView(){
        view.addSubview(topBarView)
        view.addSubview(toNewNicknameLabel)
        view.addSubview(putLabel)
    }
    
    func cornerRadius(){
        
    }
    
    func location(){
        topBarView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(self.view.frame.height/7.19)
        }
    }
    
    func topBarViewSetting(){
        topBarView.addSubview(topBarView.goBackButton)
        topBarView.addSubview(topBarView.EZY_Logo)
                       
        topBarView.topBarViewLayoutSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI
struct NewNicknamePutViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        NewNicknamePutViewController()
    }
}
@available(iOS 13.0, *)
struct NewNicknamePutViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            NewNicknamePutViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

