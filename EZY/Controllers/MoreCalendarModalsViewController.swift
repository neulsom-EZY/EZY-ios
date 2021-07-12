//
//  MoreCalendarModalsController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/19.
//

import UIKit
import Then
import SnapKit

protocol BulletinDelegate: class {
    func onTapClose()
}
class MoreCalendarModalsViewController : UIViewController{
    //MARK: - Properties
    weak var delegate: BulletinDelegate?
    
    let bgView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 40
    }
    let transparentView = UIView()
    
    let TitleLabel = UILabel().then{
        $0.text = "추가 할 항목을 선택해주세요"
        $0.dynamicFont(fontSize: 22, weight: .thin)
    }
    
    static func instance() -> MoreCalendarModalsViewController {
        return MoreCalendarModalsViewController(nibName: nil, bundle: nil).then {
            $0.modalPresentationStyle = .overFullScreen
        }
    }
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: - Selectors
    @objc func onTapClose() {
        delegate?.onTapClose()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func MyTodo(){
        
        let vc = AddMyToDoViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    @objc func OurTodo(){
        let vc = AddOurToDoViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    @objc func Errand(){
        let vc = AddErrandViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    //MARK: - HELPERS
    
    func addTransparentsview(frame : CGRect){
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(onTapClose))
        transparentView.addGestureRecognizer(tapgesture)
    }
    
    func configureUI(){
        
        addView()
        cornerRadius()
        location()
        addTransparentsview(frame: transparentView.frame)
    }
    func addView(){
        view.addSubview(transparentView)
        view.addSubview(bgView)
        view.addSubview(TitleLabel)

    }
    
    func cornerRadius(){
  
    }
    
    func location(){
        bgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(30)
            make.height.equalToSuperview().dividedBy(2.1)
        }
        
        TitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgView.snp.centerX)
            make.top.equalTo(bgView.snp.top).offset(view.frame.height/18.4545)
            
        }
        
    }
    
}


