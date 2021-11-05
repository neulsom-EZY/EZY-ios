//
//  BaseModal.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/05.
//

import UIKit

protocol BaseModalDelegate : AnyObject{
    func onTapClose()
}

class BaseModal : UIViewController{
    //MARK: - Properties
    weak var baseDelegate : BaseModalDelegate?
    
    let bounds = UIScreen.main.bounds
    let transparentView = UIView()
    @available(*,unavailable)
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    //MARK: - Selector
    @objc func onTapclose(){
        dismiss(animated: true, completion: nil)
        baseDelegate?.onTapClose()
    }
    //MARK: - Helper
    func configure(){ addTransparentsview()
        view.addSubview(transparentView)
    }
    
    private func addTransparentsview(){
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(onTapclose))
        transparentView.addGestureRecognizer(tapgesture)
    }
}
