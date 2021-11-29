//
//  LogoutViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/10/28.
//

import UIKit
import SnapKit
import Then
import Alamofire

class LogoutViewController : UIViewController {
    private let tk = TokenUtils.shared
    final class API : APIService<KakaoDataModel>{
        //MARK: - SingleTon
        static let shared = APIService<KakaoDataModel>()
    }
    //MARK: - Properties
    private let backBtn = UIButton().then{
        $0.setImage(UIImage(named: "EZY_ErrandBackButtonImage")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        $0.tintColor = .EZY_968DFF
    }
    private let titleLabel = UILabel().then{
        $0.text = "로그아웃"
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF,.EZY_968DFF,.rgb(red: 194, green: 189, blue: 255)])
    }
    private let logoutBtn = LogoutCustomBtn().then{
        $0.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
    }
    
    let bounds = UIScreen.main.bounds
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc
    private func backBtnAction(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func logoutAction(){
        print("Logout")
        let header = tk.getAuthorizationHeader(Bundle.bundleIdentifier)
        API.shared.request(url: "/v1/member/logout", method: .delete, param: .none, header: header, JSONDecodeUsingStatus: false, completion: {result in
            switch result{
            case .success(let data):
                print(data)
                self.tk.delete(Bundle.bundleIdentifier, account: "accessToken")
                self.tk.delete(Bundle.bundleIdentifier, account: "refreshToken")
                let controller = LoginViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            case .requestErr(let err):
                print(err)
                break
            case .pathErr:
                print("pathErr")
                break
            case .serverErr:
                print("serverErr")
                break
            case .networkFail:
                print("networkFail")
                break
            case .tokenErr:
                print("tokenErr")
                break
            case .authorityErr:
                print("authorityErr")
                break
            }
        })
    }
    
    //MARK: - Helper
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
    }
    
    //MARK: - AddView
    private func addView(){
        [backBtn,titleLabel,logoutBtn].forEach{ view.addSubview($0)}
    }
    
    private func location(){
        backBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(bounds.height/13.3114)
            $0.left.equalToSuperview().offset(bounds.width/11.71875)
            $0.width.height.equalTo(bounds.height/33.8333)
        }
        titleLabel.snp.makeConstraints{
            $0.left.equalTo(backBtn)
            $0.top.equalTo(backBtn.snp.bottom).offset(bounds.height/27.0667)
        }
        logoutBtn.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(bounds.height/35.3043)
            $0.height.equalTo(bounds.height/5.01234)
            $0.left.right.equalToSuperview().inset(bounds.width/12.5)
        }
    }
}
