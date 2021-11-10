//
//  BasicModalViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/11/10.
//

import UIKit

protocol ModalViewDelegate: AnyObject {
    func onTapCloseModalView()
}

class BasicModalViewController: BaseModal {
    // MARK: - Properties
    weak var delegate: ModalViewDelegate?
    
    private let bgView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let okButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.setTitle("네!", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = UIColor(red: 147/255, green: 145/255, blue: 254/255, alpha: 1)
        $0.addTarget(self, action: #selector(MakeTodo), for: .touchUpInside)
    }
    
    private let cancelButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.setTitle("아니요!", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = UIColor(red: 223/255, green: 223/255, blue: 223/255, alpha: 1)
    }
    
    private let contentLabel = UILabel().then{
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Thin")
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    
    // MARK: - helper
    override func configure(){
        super.configure()

        addView()
    }
    
    // MARK: - addView
    private func addView(){
        self.view.addSubview(bgView)
        bgView.addSubview(okButton)
        bgView.addSubview(cancelButton)
        bgView.addSubview(contentLabel)
    }
    
    static func instance() -> BasicModalViewController {
        return BasicModalViewController(nibName: nil, bundle: nil).then {
            $0.modalPresentationStyle = .overFullScreen
        }
    }
    
    //MARK: - selectors
    @objc func MakeTodo(){
        baseDelegate?.onTapClose()
        dismiss(animated: true, completion: nil)
        delegate?.onTapCloseModalView()
    }
    
    // MARK: - textSetting
    func textSetting(colorText: String, contentText: String){
        let string : NSMutableAttributedString

        if colorText.count < 7{
            string = NSMutableAttributedString(string: "\(colorText) \(contentText)")
        }else{
            string = NSMutableAttributedString(string: "\(colorText)\n\(contentText)")
        }
        
        string.setColorForText(textToFind: "\(colorText)", withColor: .blue)
        contentLabel.attributedText = string
        
        let labelHeight = contentLabel.intrinsicContentSize.height
        let buttonHeight = self.view.frame.height/24.6
        let labelTopPaddingHeight = self.view.frame.height/26
        let amongLabelButtonHeight = self.view.frame.height/50
        let ButtonBottomPaddingHeight = self.view.frame.height/45.11
        
        bgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalTo(labelHeight + buttonHeight + labelTopPaddingHeight + amongLabelButtonHeight + ButtonBottomPaddingHeight)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(labelTopPaddingHeight)
            make.centerX.equalToSuperview()
        }
        
        okButton.snp.makeConstraints { make in
            make.height.equalTo(buttonHeight)
            make.width.equalToSuperview().dividedBy(4.44)
            make.bottom.right.equalToSuperview().offset(-self.view.frame.height/53)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.height.width.equalTo(okButton)
            make.bottom.equalTo(okButton)
            make.right.equalTo(okButton.snp.left).offset(-self.view.frame.height/80)
        }
    }
}

extension NSMutableAttributedString {
    func setColorForText(textToFind: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
    func setFontForText(textToFind: String, withFont font: UIFont
    ){
        let range : NSRange = self.mutableString.range(of: textToFind,options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
}