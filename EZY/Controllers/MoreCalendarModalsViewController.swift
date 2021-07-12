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
    
    
        
    private let myToDo : AddScheduleModalBtn = {
        let viewModel = CustomButtonViewModel(title: "나의 할 일", image: UIImage(named: "EZY_user")?.withRenderingMode(.alwaysTemplate), color: .EZY_BAC8FF)

        let button = AddScheduleModalBtn(with: viewModel)
        
        button.addTarget(self, action: #selector(MyTodo), for: .touchUpInside)
        return button
    }()
    
    private let ourToDo : AddScheduleModalBtn = {
        let viewModel = CustomButtonViewModel(title: "우리의 할 일", image: UIImage(named: "EZY_user-3")?.withRenderingMode(.alwaysTemplate), color: .EZY_CFCBFF)
        let button = AddScheduleModalBtn(with: viewModel)
        button.addTarget(self, action: #selector(MyTodo), for: .touchUpInside)
        
        return button
    }()
    
    private let errand : AddScheduleModalBtn = {
        let viewModel = CustomButtonViewModel(title: "심부름", image: UIImage(named: "EZY_work")?.withRenderingMode(.alwaysTemplate), color: .EZY_AFADFF)
        let button = AddScheduleModalBtn(with: viewModel)
        button.addTarget(self, action: #selector(MyTodo), for: .touchUpInside)
        return button
    }()
    private let makeButton = UIButton().then{
        $0.backgroundColor = .EZY_AAA3FF
    }

    private let makeTitle = UILabel().then{
        $0.text = "생 성"
        $0.textColor = .white
        $0.dynamicFont(fontSize: 12, weight: .bold)
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
        
    }
    @objc func OurTodo(){
        
    }
    @objc func ErrandTodo(){
        
    }
    @objc func MakeTodo(){
        
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
        view.addSubview(myToDo)
        view.addSubview(ourToDo)
        view.addSubview(errand)
        view.addSubview(makeButton)
        view.addSubview(makeTitle)
    }
    
    func cornerRadius(){
        myToDo.layer.cornerRadius = view.frame.height/40.6
        ourToDo.layer.cornerRadius = view.frame.height/40.6
        errand.layer.cornerRadius = view.frame.height/40.6
        makeButton.layer.cornerRadius = view.frame.height/81.2
        myToDo.layer.applySketchShadow(color: .gray, alpha: 0.25, x: 0, y: 4, blur: 14, spread: 0)
        ourToDo.layer.applySketchShadow(color: .gray, alpha: 0.25, x: 0, y: 4, blur: 14, spread: 0)
        errand.layer.applySketchShadow(color: .gray, alpha: 0.25, x: 0, y: 4, blur: 14, spread: 0)
    }
    
    func location(){
        bgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(30)
            make.height.equalToSuperview().dividedBy(2.2)
        }
        
        TitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgView.snp.centerX)
            make.top.equalTo(bgView.snp.top).offset(view.frame.height/18.45)
            
        }
        myToDo.snp.makeConstraints { (make) in
            make.height.equalTo(view.frame.height/5.927)
            make.width.equalTo(view.frame.height/8.95)
            make.top.equalTo(TitleLabel.snp.bottom).offset(view.frame.height/21.37)
            make.left.equalTo(view.frame.height/21.945)
        }
        ourToDo.snp.makeConstraints { (make) in
            make.height.equalTo(view.frame.height/5.927)
            make.width.equalTo(view.frame.height/8.95)
            make.top.equalTo(TitleLabel.snp.bottom).offset(view.frame.height/21.37)
            make.centerX.equalTo(bgView.snp.centerX)
        }
        errand.snp.makeConstraints { (make) in
            make.height.equalTo(view.frame.height/5.927)
            make.width.equalTo(view.frame.height/8.95)
            make.top.equalTo(TitleLabel.snp.bottom).offset(view.frame.height/21.37)
            make.right.equalTo(view.frame.height/21.945 * -1)
        }
        makeButton.snp.makeConstraints { (make) in
            make.top.equalTo(errand.snp.bottom).offset(view.frame.height/31.23)
            make.right.equalTo(view.snp.right).offset(view.frame.height/22.56 * -1)
            make.width.equalTo(view.frame.height/11.6 )
            make.height.equalTo(view.frame.height/24.61 )
        }
        makeTitle.snp.makeConstraints { (make) in
            make.center.equalTo(makeButton.snp.center)
        }
    }
    
}


