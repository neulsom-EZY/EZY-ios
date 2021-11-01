//
//  SendUser.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/30.
//

import UIKit

class SendUser : UIView{
    //MARK: - Properties
    private let view = UIView()
    private lazy var senderView = UIView().then{
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
        $0.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 4, blur: 14, spread: 0)
    }
    private lazy var recipientView = UIView().then{
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
        $0.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 4, blur: 14, spread: 0)
    }
    
    private lazy var senderText = UILabel().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = .rgb(red: 164, green: 137, blue: 255)
    }
    private let image = UIImageView().then{
        $0.image = UIImage.init(named: "EZY_chevron.right")?.withRenderingMode(.alwaysTemplate)
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .rgb(red: 164, green: 137, blue: 255)
    }
    private lazy var recipientText = UILabel().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = .rgb(red: 164, green: 137, blue: 255)
    }
    private var viewModel : SendUserView?
    
    override init(frame: CGRect) {
        viewModel = nil
        super.init(frame: frame)
    }
    
    init(with viewModel : SendUserView) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        addview()
        configure(with: viewModel)
    }

    private func addview(){
        addSubview(view)
        view.addSubview(senderView)
        view.addSubview(recipientView)
        senderView.addSubview(senderText)
        view.addSubview(image)
        recipientView.addSubview(recipientText)
    }

    
    private func configure(with viewModel : SendUserView)
    {
        senderText.text = "@ " + viewModel.sender!
        recipientText.text = "@ " + viewModel.recipient!
    }
    //MARK: - Label SizeToFit
    private func SizeToFit(){
        senderText.sizeToFit()
        recipientText.sizeToFit()
    }
    //MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        SizeToFit()
        
        view.snp.makeConstraints { 
            $0.left.top.bottom.equalToSuperview()
            $0.right.equalTo(recipientView.snp.right)
        }
        senderView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(bounds.width/13.888)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(senderText.frame.width + bounds.width/8.4)
        }
        senderText.snp.makeConstraints { (make) in
            make.center.equalTo(senderView.snp.center)
        }
        image.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(senderView.snp.right).offset(bounds.width/24.6)
            make.height.equalTo(bounds.height/3.75)
            make.width.equalTo(bounds.width/53.333)
        }
        recipientText.snp.makeConstraints { (make) in
            make.center.equalTo(recipientView.snp.center)
        }
        recipientView.snp.makeConstraints { (make) in
            make.left.equalTo(image.snp.right).offset(bounds.width/24.6)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(recipientText.frame.width + bounds.width/8.4)
        }

        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
