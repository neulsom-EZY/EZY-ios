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
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
    }
    private lazy var recipientView = UIView().then{
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
    }
    
    private lazy var senderText = UILabel().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-UltraLight")
    }
    private let image = UIImageView().then{
        $0.image = UIImage.init(named: "EZY_chevron.right")?.withRenderingMode(.alwaysTemplate)
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .EZY_BAC8FF
    }
    private lazy var recipientText = UILabel().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-UltraLight")
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
        senderText.textColor = viewModel.senderColor
        recipientText.textColor = viewModel.recipientColor
        senderView.layer.borderColor = viewModel.senderStrokeColor?.cgColor
        recipientView.layer.borderColor = viewModel.recipientStrokeColor?.cgColor
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
            make.height.equalTo(bounds.height/1.40625)
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
            make.height.equalTo(bounds.height/1.40625)
            make.width.equalTo(recipientText.frame.width + bounds.width/8.4)
        }

        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
