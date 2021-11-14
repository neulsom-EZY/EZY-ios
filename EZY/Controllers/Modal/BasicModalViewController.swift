//
//  BasicModalViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/11/10.
//

import UIKit

protocol BasicModalViewButtonDelegate: AnyObject {
    func onTabOkButton()
}

class BasicModalViewController: BaseModal {
    // MARK: - Properties
    
    weak var delegate: BasicModalViewButtonDelegate?
    
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
        $0.addTarget(self, action: #selector(noButton), for: .touchUpInside)
    }
    
    private let contentLabel = UILabel().then{
        $0.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-Thin")
        $0.numberOfLines = 3
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
        delegate?.onTabOkButton()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func noButton(){
        baseDelegate?.onTapClose()
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - textSetting
    func textSetting(colorText: String, contentText: String){
        let string : NSMutableAttributedString
        var changeColorText = colorText
        print("colorText.count : \(colorText.count)")
        if colorText.count < 7{
            string = NSMutableAttributedString(string: "\(changeColorText) \(contentText)")
        }else if colorText.count < 33{
            changeColorText = colorText.replacingOccurrences(of: " ", with: "\n")
            string = NSMutableAttributedString(string: "\(changeColorText) \n\(contentText)")
        }else{
            string = NSMutableAttributedString(string: "\(changeColorText)\n\(contentText)")
        }
        
        string.setColorForText(textToFind: "\(changeColorText)", withColor: UIColor(red: 147/255, green: 145/255, blue: 254/255, alpha: 1))
        string.setFontForText(textToFind: "\(changeColorText)", withFont: UIFont(name: "AppleSDGothicNeo-SemiBold", size: 17)!)
        string.setFontForText(textToFind: "\(contentText)", withFont: UIFont(name: "AppleSDGothicNeo-Thin", size: 16.5)!)
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
