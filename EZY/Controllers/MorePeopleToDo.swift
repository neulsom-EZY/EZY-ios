//
//  morepeopletodo.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/08.
//
    
import UIKit
import SnapKit
import Then
    
class MorePeopleToDo: UIViewController{
    static let data = ["JiHoooooon","siwony","NoName","mingki","johnjihwan","noplayy","gyeongggggjuunnn"]
    
    
    //MARK: - Properties
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_968DFF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(backButton), for: .touchUpInside)
    }
    private let TitleLabel = UILabel().then{
        $0.text = "누구와 일정을 함께하시나요?"
        $0.dynamicFont(fontSize: 24, weight: .semibold)
        $0.textColor = .EZY_968DFF
    }
    private let SubLabel = UILabel().then{
        $0.text = "한명도 좋고 여러명도 좋아요!"
        $0.dynamicFont(fontSize: 20, weight: .semibold)
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF,.EZY_968DFF,.EZY_968DFF,.white])
    }
//    private let titleLabel : GradientTitle = {
//        let tL = GradientTitle()
//        tL.title = "누구와 일정을 함께하시나요?"
//        tL.subTitle = "한명도 좋고 여러명도 좋아요!"
//        return tL
//    }()
    
    private let GroupLabel = UILabel().then{
        $0.text = "그룹원"
        $0.dynamicFont(fontSize: 10, weight: .thin)
        $0.textColor = .EZY_818181
    }

    private let nickNameTextField : UITextField = {
        let tf = Utilities().textField(textColor: .EZY_6A6A6A, textSize: 10,font: .bold)
        return tf
    }()
    private lazy var nickNameTextFieldContainerView: UIView = {
        let view = Utilities().customTextField(withMessage: "닉네임을 검색하세요.", textField: nickNameTextField, Color: .EZY_F5F5F5, viewSize: Double(view.frame.height))
        return view
        
    }()
    private let recommendPeopleLabel = UILabel().then{
        $0.text = "이런 사람들은 어때요"
        $0.dynamicFont(fontSize: 14, weight: .thin)
    }
    
    fileprivate let WhatAboutPeopleLikeThis: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(WhatAboutPeopleLikeThisCell.self, forCellWithReuseIdentifier: WhatAboutPeopleLikeThisCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    private let divider = UIView().then{
        $0.backgroundColor = .EZY_DEDEDE
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        WhatAboutPeopleLikeThis.dataSource = self
        WhatAboutPeopleLikeThis.delegate = self
        WhatAboutPeopleLikeThis.allowsMultipleSelection = true
    }
    
    //MARK: - Selectors
    @objc func backButton(){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        WhatAboutPeopleLikeThis.contentInset = UIEdgeInsets(top: 0, left: view.frame.height/21.95, bottom: 0, right: view.frame.height/21.95)
        addView()
        location()
    }
    
    func addView(){
        view.addSubview(backbutton)
//        view.addSubview(titleLabel)
        view.addSubview(TitleLabel)
        view.addSubview(SubLabel)
        view.addSubview(GroupLabel)
        view.addSubview(nickNameTextFieldContainerView)
        view.addSubview(recommendPeopleLabel)
        view.addSubview(WhatAboutPeopleLikeThis)
        view.addSubview(divider)
    }
    
    
    func location(){
        backbutton.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/33.8)
            make.left.equalTo(self.view.frame.height/29)
            make.top.equalTo(self.view.frame.height/13.3)
        }
        TitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(backbutton.snp.top).offset(view.frame.height/15.6)
        }
        SubLabel.snp.makeConstraints { (make) in
            make.top.equalTo(TitleLabel.snp.bottom)
            make.left.equalTo(TitleLabel.snp.left)
        }
//        titleLabel.snp.makeConstraints { (make) in
//            make.left.equalTo(backbutton.snp.left)
//            make.top.equalTo(backbutton.snp.top).offset(view.frame.height/15.6)
//
//        }
        GroupLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view.frame.height/20.8)
            make.top.equalTo(SubLabel.snp.bottom).offset(view.frame.height/17.6)
        }
        nickNameTextFieldContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(GroupLabel.snp.bottom).offset(view.frame.height/135.3)
            make.height.equalTo(self.view.frame.height/21.3)
            make.left.equalTo(view.snp.left).offset(self.view.frame.height/23.2)
            make.right.equalTo(view.snp.right).offset(self.view.frame.height/23.8 * -1)
        }
        recommendPeopleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nickNameTextFieldContainerView.snp.bottom).offset(view.frame.height/21.9)
            make.left.equalTo(view.frame.height/22.5)
        }
        WhatAboutPeopleLikeThis.snp.makeConstraints { (make) in
            make.top.equalTo(recommendPeopleLabel.snp.bottom).offset(view.frame.height/81.2)
            make.left.equalToSuperview()
            make.height.equalTo(view.frame.height/11.277)
            make.right.equalToSuperview()
        }
        divider.snp.makeConstraints { (make) in
            make.height.equalTo(view.frame.height/1624)
            make.top.equalTo(WhatAboutPeopleLikeThis.snp.bottom).offset(view.frame.height/35.3)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.height/2.689)
        }
        
    }
    
}


#if DEBUG
import SwiftUI
struct LoginViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        MorePeopleToDo()
    }
}
@available(iOS 13.0, *)
struct LoginViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            LoginViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
