//
//  ErrandText.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/28.
//

import UIKit

class inputContainerErrandTextView : UIView{
    private let view = UIView()
    private let label = UILabel().then{
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    private var textView = UITextView().then{
        $0.backgroundColor = .clear
        $0.textColor = .EZY_A7A7A7
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        let point = CGPoint(x: 0, y: 0)
    }
    private var viewModel : ErrandinputContainerTv?

    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
    }
    init(with viewModel: ErrandinputContainerTv) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        addView()
        configure(with: viewModel)
    }
    
    private func addView(){
        addSubview(view)
        view.addSubview(label)
        view.addSubview(textView)
    }
    public func configure( with viewModel : ErrandinputContainerTv){
        view.backgroundColor = viewModel.viewbackColor
        label.textColor = viewModel.titleColor
        label.text = viewModel.titleText
        textView.text = viewModel.explanationText
        textView.isEditable = viewModel.writeEditable!
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        view.layer.cornerRadius = frame.height/5
        textView.textAlignment = NSTextAlignment.left
        textView.showsVerticalScrollIndicator = false
        textView.contentOffset.y = 6
        view.snp.makeConstraints { (make) in
            make.top.left.right.bottom.height.width.equalToSuperview()
        }
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(frame.height/5.79)
            make.left.equalToSuperview().offset(frame.height/6.23)
        }
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(frame.height/13.75)
            make.left.equalTo(label.snp.left)
            make.right.equalTo(view.snp.right).inset(frame.height/6.47)
            make.bottom.equalToSuperview().inset(view.frame.height/6.47)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
