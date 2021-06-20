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
    
    let TitleLabel = UILabel().then{
        $0.text = "추가 할 항목을 선택해주세요"
        $0.dynamicFont(fontSize: 22, weight: .thin)
    }
    
    
    
    let closeBtn = UIButton().then {
        $0.setTitle("닫기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    
    private let myToDo : MoreCalendarModalsButton = {
        let viewModel = MyCustomButtonViewModel(title: "나의 할 일", image: UIImage(systemName: "person")!, color: .EZY_BAC8FF)
        let button = MoreCalendarModalsButton(with: viewModel)

        return button
    }()
    
    private let ourToDo : MoreCalendarModalsButton = {
        let viewModel = MyCustomButtonViewModel(title: "우리의 할 일", image: UIImage(systemName: "person.3")!, color: .EZY_CFCBFF)
        let button = MoreCalendarModalsButton(with: viewModel)

        return button
    }()
    
    private let errand : MoreCalendarModalsButton = {
        let viewModel = MyCustomButtonViewModel(title: "심부름", image: UIImage(systemName: "person.3")!, color: .EZY_AFADFF)
        let button = MoreCalendarModalsButton(with: viewModel)

        return button
    }()
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
    
    //MARK: - HELPERS
    func configureUI(){
        view.backgroundColor = .clear
        view.addSubview(bgView)
        view.addSubview(closeBtn)
        view.addSubview(TitleLabel)
        view.addSubview(myToDo)
        view.addSubview(ourToDo)
        view.addSubview(errand)
        closeBtn.addTarget(self, action: #selector(onTapClose), for: .touchUpInside)
        
        
        
        bgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(30)
            make.height.equalToSuperview().dividedBy(1.5)
        }
        
        TitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgView.snp.centerX)
            make.top.equalTo(bgView.snp.top).offset(view.frame.height/7.4)
            
        }
        
        myToDo.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgView.snp.centerX)
            make.top.equalTo(TitleLabel.snp.bottom).offset(view.frame.height/11.6)
            make.width.equalTo(view.frame.height/4.8)
            make.height.equalTo(view.frame.height/15.3)
        }
        
        ourToDo.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgView.snp.centerX)
            make.top.equalTo(myToDo.snp.bottom).offset(view.frame.height/32.4)
            make.width.equalTo(view.frame.height/4.8)
            make.height.equalTo(view.frame.height/15.3)
        }
        errand.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgView.snp.centerX)
            make.top.equalTo(ourToDo.snp.bottom).offset(view.frame.height/32.4)
            make.width.equalTo(view.frame.height/4.8)
            make.height.equalTo(view.frame.height/15.3)
        }
        
        
        closeBtn.snp.makeConstraints { (make) in
            make.center.equalTo(bgView)
        }
    }
    
    
}


