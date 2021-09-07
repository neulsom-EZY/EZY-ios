//
//  SendUser.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/30.
//

import UIKit

class SendUser : UIView{
    private let view = UIView()
    private lazy var senderView = UIView().then{
        $0.layer.borderWidth = 1
    }
    private lazy var recipientView = UIView().then{
        $0.layer.borderWidth = 1
    }
    
    private lazy var senderText = UILabel().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-UltraLight")
        $0.sizeToFit()
    }
    private let image = UIImageView().then{
        $0.image = UIImage.init(named: "EZY_chevron.right")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .EZY_BAC8FF
    }
    private lazy var recipientText = UILabel().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-UltraLight")
        $0.sizeToFit()
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

    func addview(){
        addSubview(view)
        view.addSubview(senderView)
        view.addSubview(recipientView)
        senderView.addSubview(senderText)
        view.addSubview(image)
        recipientView.addSubview(recipientText)
    }
    func cornerRadius(){
        senderView.layer.cornerRadius = frame.height/6.4
        recipientView.layer.cornerRadius = frame.height/6.4
    }
    
    public func configure(with viewModel : SendUserView)
    {
        
        senderText.text = "@ " + viewModel.sender!
        recipientText.text = "@ " + viewModel.recipient!
        senderText.textColor = viewModel.senderColor
        recipientText.textColor = viewModel.recipientColor
        senderView.layer.borderColor = viewModel.senderStrokeColor?.cgColor
        recipientView.layer.borderColor = viewModel.recipientStrokeColor?.cgColor
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius()

        senderText.sizeToFit()
        recipientText.sizeToFit()
        view.snp.makeConstraints { (make) in
            make.top.right.bottom.left.equalToSuperview()
        }
        senderView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(frame.height/1.185)
            make.top.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(senderText.frame.width + frame.height/0.84)
        }
        senderText.snp.makeConstraints { (make) in
            make.center.equalTo(senderView.snp.center)
        }
        image.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(senderView.snp.right).offset(frame.height/2.46)
            make.height.equalTo(frame.height/2.6667)
            make.width.equalTo(frame.height/5.3333)
        }
        recipientText.snp.makeConstraints { (make) in
            make.center.equalTo(recipientView.snp.center)
        }
        recipientView.snp.makeConstraints { (make) in
            make.left.equalTo(image.snp.right).offset(frame.height/2.46)
            make.top.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(recipientText.frame.width + frame.height/0.84)
        }

        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
