//
//  SendUser.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/30.
//

import UIKit

class SendUser : UIView{
    private let view = UIView()
    private let senderView = UIView()
    private let recipientView = UIView()
    
    private var senderText = UILabel().then{
        $0.dynamicFont(fontSize: 12, weight: .ultraLight)
        $0.sizeToFit()
    }
    private let image = UIImageView().then{
        $0.image = UIImage.init(named: "EZY_chevron.right")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .EZY_BAC8FF
    }
    private var recipientText = UILabel().then{
        $0.dynamicFont(fontSize: 12, weight: .ultraLight)
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
        senderView.layer.borderWidth = 1
        recipientView.layer.borderWidth = 1
        view.snp.makeConstraints { (make) in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        senderView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(senderText.frame.width)
        }
        
        image.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(senderView.snp.right).offset(frame.height/2.46)
            make.right.equalTo(recipientView.snp.left).inset(frame.height/2.46)
            make.height.equalTo(frame.height/2.6667)
            make.width.equalTo(frame.height/5.3333)
        }
        recipientView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(senderText.frame.width)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
