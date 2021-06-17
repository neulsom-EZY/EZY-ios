//
//  PlanRequestRespondingViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/17.
//

import UIKit

class PlanRequestRespondingViewController: UIViewController {
    
    var purpleColor: UIColor! = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    var whiteColor: UIColor! = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    
    lazy var labelColor: [UIColor] = [purpleColor, whiteColor]
    
    lazy var backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_RequestBackButton"), for: .normal)
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "지환님이\n팀 일정을 보내셨어요."
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 27, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = purpleColor
    }
    
    lazy var contentLabel = UILabel().then {
        $0.text = "보여드릴게요!"
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: labelColor)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        layoutSetting()
    }
    
    func layoutSetting(){
        self.view.addSubview(backButton)
        self.view.addSubview(titleLabel)
        self.view.addSubview(contentLabel)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(20)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/30)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(titleLabel.snp.bottom)
        }
    }
    
}

extension UILabel{
  public func updateGradientTextColor_vertical(gradientColors: [UIColor] = [UIColor(white: 0, alpha: 0.95), UIColor(white: 0, alpha: 0.6)]){
        let size = CGSize(width: intrinsicContentSize.width, height: intrinsicContentSize.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        defer { UIGraphicsEndImageContext()}
        guard let context = UIGraphicsGetCurrentContext() else {return}
        var colors: [CGColor] = []
        for color in gradientColors{
            colors.append(color.cgColor)
        }
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else {return }
        
        context.drawLinearGradient(
            gradient,
            start: CGPoint.zero,
            end: CGPoint(x: 0, y: size.height+10),
            options: []
        )
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            self.textColor = UIColor(patternImage: image)
        }
    }
}
