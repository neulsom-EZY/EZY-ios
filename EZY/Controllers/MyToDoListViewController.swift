//
//  MyToDoListViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/07/24.
//

import UIKit
import SnapKit
import Then

class MyToDoListViewController: UIViewController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
    }
    
    func addView(){
        
    }
    
    func cornerRadius(){
        
    }
    
    func location(){
        
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI
struct MyToDoListViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        MyToDoListViewController()
    }
}
@available(iOS 13.0, *)
struct MyToDoListViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            MyToDoListViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

