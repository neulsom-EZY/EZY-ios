//
//  MoreAlarmModelViewController.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/26.
//

import UIKit
import SnapKit
import Then

protocol AlarmModelDelegate: class {
    func onTapClose()
}
class MoreAlarmModelViewController : UIViewController{
    
    //MARK: - Properties
    weak var delegate: AlarmModelDelegate?
    
    let bgView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 40
    }
    let transparentView = UIView()
       
    
        

    private let makeButton = UIButton().then{
        $0.backgroundColor = .EZY_8176FF
        $0.addTarget(self, action: #selector(MakeTodo), for: .touchUpInside)
    }

    private let makeTitle = UILabel().then{
        $0.text = "생 성"
        $0.textColor = .white
        $0.dynamicFont(fontSize: 12, weight: .bold)
    }
  
    
    static func instance() -> MoreAlarmModelViewController {
        return MoreAlarmModelViewController(nibName: nil, bundle: nil).then {
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
    

    @objc func MakeTodo(){
        delegate?.onTapClose()
        dismiss(animated: true, completion: nil)
    }
    //MARK: - HELPERS
 
    
    
    func configureUI(){
        addView()
        cornerRadius()
        location()
        addTransparentsview(frame: transparentView.frame)
    }
    func addView(){
        view.addSubview(transparentView)
        view.addSubview(bgView)
        view.addSubview(makeTitle)
        view.addSubview(makeButton)
    }
    
    func cornerRadius(){

        makeButton.layer.cornerRadius = view.frame.height/81.2

    }
    
    func location(){
        bgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(30)
            make.height.equalToSuperview().dividedBy(3.85)
        }
        


        makeButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(bgView.snp.bottom).inset(view.frame.height/31.23)
            make.right.equalTo(view.snp.right).offset(view.frame.height/22.56 * -1)
            make.width.equalTo(view.frame.height/11.6 )
            make.height.equalTo(view.frame.height/24.61 )
        }
        makeTitle.snp.makeConstraints { (make) in
            make.center.equalTo(makeButton.snp.center)
        }
    }

    func addTransparentsview(frame : CGRect){
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(onTapClose))
        transparentView.addGestureRecognizer(tapgesture)
    }
}
