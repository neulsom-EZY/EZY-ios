//
//  AlertButton.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/23.
//

import UIKit
import SnapKit
import Then
import Alamofire

class AlertButton : UIButton {

    private let view = UIView()
    private let label = UILabel()
    private let icon = UIImageView()
    
    private var viewModel : AlertBtn?
    
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
        
    }
    init(with viewModel : AlertBtn){
        self.viewModel = viewModel
        super.init(frame: .zero)
        isEnabled = true
        addSubViews()
    }
    private func addSubViews(){
        addSubview(view)
        addSubview(label)
        addSubview(icon)
    }
    public func configure(){
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
