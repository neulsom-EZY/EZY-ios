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
    let ampmData = ["오전","오후"]
    
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
        $0.text = "완 료"
        $0.textColor = .white
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    private let AlarmDateView = AlarmDatePickerView().then{
        $0.backgroundColor = .red
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
        makeButton.addSubview(makeTitle)
        view.addSubview(makeButton)
        bgView.addSubview(AlarmDateView)
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
        AlarmDateView.snp.makeConstraints { (make) in
            make.center.equalTo(bgView.snp.center)
            make.height.equalTo(200)
            make.width.equalTo(100)
        }
   
        makeButton.snp.makeConstraints { (make) in
            make.top.equalTo(bgView.snp.top).offset(view.frame.height/6.15)
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
