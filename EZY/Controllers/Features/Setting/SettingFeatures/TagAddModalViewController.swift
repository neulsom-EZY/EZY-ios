//
//  TagAddModalViewViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/11/05.
//

import UIKit

protocol TagAddDelegate: AnyObject {
    func onTapTagAddModalClose()
    func updateData(tagName: String, tagColorIndex: Int)
}

class TagAddModalViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    // MARK: - configureUI
    func configureUI(){
        addView()
        
        location()
        
        delegateAndDataSource()
    }
    
    // MARK: - addView
    func addView(){
        
    }
    
    // MARK: - location
    func location(){
        
    }
    
    // MARK: - delegateAndDataSource
    func delegateAndDataSource(){
        
    }
}
