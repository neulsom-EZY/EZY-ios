//
//  lineInputView.swift
//  EZY
//
//  Created by 김유진 on 2021/11/19.
//

import UIKit

class LineInputView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let titleLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    private let infoTextField = UITextField().then {
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    private let underLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    private let conditionLabel = UILabel().then {
        $0.textColor = UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI(){
        addView()
        
        location()
    }
    
    // MARK: - addView
    private func addView(){
        [titleLabel, infoTextField, underLineView, conditionLabel].forEach { self.addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(viewBounds.width/12)
        } 
        
        infoTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(viewBounds.height/160)
            make.left.equalTo(titleLabel).offset(viewBounds.width/80)
            make.centerX.equalToSuperview()
        }
        
        underLineView.snp.makeConstraints { make in
            make.top.equalTo(infoTextField.snp.bottom).offset(viewBounds.height/160)
            make.left.equalTo(titleLabel)
            make.centerX.equalToSuperview()
            make.height.equalTo(2)
        }
        
        conditionLabel.snp.makeConstraints { make in
            make.top.equalTo(underLineView.snp.bottom).offset(viewBounds.height/100)
            make.left.equalTo(underLineView)
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(titleText: String, placeHolderText: String, conditionText: String){
        titleLabel.text = titleText
        infoTextField.placeholder = placeHolderText
        conditionLabel.text = conditionText
    }
    
    // MARK: - getNickNameText
    func getNickNameText() -> String{
        return infoTextField.text!
    }
    
    func checkNickNameIsEmpty() {
        if infoTextField.text?.isEmpty == true{
            shakeView(titleLabel)
        }
    }
    
    // MARK: - shakeView
    private func shakeView(_ view: UIView?) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.08
        shake.repeatCount = 2
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! - 2, y: view?.center.y ?? 0.0))
        shake.toValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! + 2, y: view?.center.y ?? 0.0))
        view?.layer.add(shake, forKey: "position")
    }
}
