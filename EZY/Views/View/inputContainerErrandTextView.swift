//
//  ErrandText.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/28.
//

import UIKit

class inputContainerErrandTextView : UIView{
    private let view = UIView().then{
        $0.layer.cornerRadius = 20
    }
    private let label = UILabel().then{
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    private lazy var textView = UITextView().then{
        $0.backgroundColor = .clear
        $0.textColor = .rgb(red: 167, green: 167, blue: 167)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsVerticalScrollIndicator = false
        $0.textAlignment = NSTextAlignment.left
    }
    private var viewModel : ErrandinputContainerTv?

    init(with viewModel: ErrandinputContainerTv) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        addView()
        configure(with: viewModel)
    }
    
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
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
        
        textView.contentOffset.y = 6
        view.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(frame.height/5.79)
            make.left.equalToSuperview().offset(frame.height/6.23)
        }
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(frame.height/13.75)
            make.left.right.equalTo(view).inset(bounds.width/29.7297)
            make.height.equalTo(bounds.width/7.16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
