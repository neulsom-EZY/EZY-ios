//
//  LoginViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/05/30.
//

import UIKit
import Then
import SnapKit

class LoginViewController: UIViewController{
    let button = UIButton().then {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let bgView = UIView().then {
        $0.backgroundColor = .black
        $0.alpha = 0
    }
    
    static func instance() -> LoginViewController {
        return LoginViewController(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 뷰에 버튼 추가
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        // 이벤트 추가
        button.addTarget(self, action: #selector(onTapBtn), for: .touchUpInside)
    }
    
    
    @objc
    func onTapBtn() {
        // BulletinBoard Modal 생성
        let MoreCalendarModalsVC = MoreCalendarModalsViewController.instance()
        
        MoreCalendarModalsVC.delegate = self
        addDim()
        present(MoreCalendarModalsVC, animated: true, completion: nil)
    }
    
    private func addDim() {
        view.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.bgView.alpha = 0.2
        }
    }
    
    private func removeDim() {
        DispatchQueue.main.async { [weak self] in
            self?.bgView.removeFromSuperview()
        }
    }

}

extension LoginViewController: BulletinDelegate {
    func onTapClose() {
        self.removeDim()
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
    LoginViewController() // 이름 바꾸기
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
