//
//  LoginViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/06/10.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController{
    //MARK: - Properties
    
    lazy var titleLabel = UILabel().then {
        $0.text = "EZY"
        $0.dynamicFont(fontSize: 38, currentFontName: "AppleSDGothicNeo-Bold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_C9BCFF, .EZY_6B40FF])
    }
    
    lazy var subLabel = UILabel().then {
        $0.text = "는"
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor.rgb(red: 0, green: 0, blue: 0)
    }
    
    lazy var textLabel = UILabel().then {
        $0.text = "자신만의 라이프스타일\n역사를 쓰고 있습니다."
        $0.numberOfLines = 2
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor.rgb(red: 0, green: 0, blue: 0)
    }
    
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors

    //MARK: - Helpers
    func configureUI(){
        view.addSubview(titleLabel)
        view.addSubview(subLabel)
        view.addSubview(textLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/6.6)
            make.left.equalToSuperview().offset(47)
        }
        
        subLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/6.05)
            make.right.equalTo(titleLabel).offset(22)
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalTo(subLabel).offset(self.view.frame.height/27.06)
            make.left.equalToSuperview().offset(47)
        }
    }

}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        LoginViewController()
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


