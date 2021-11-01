//
//  Extension.swift
//  EZY
//
//  Created by 노연주 on 2021/06/02.
//

import UIKit

//MARK: - TextField 재정의
extension UITextField {
      private func resizeFont(calculatedFont: UIFont?, weight: UIFont.Weight) {
          self.font = calculatedFont
          self.font = UIFont.systemFont(ofSize: calculatedFont!.pointSize, weight: weight)
    }
}

//MARK: - dateFormatter extension
extension String {
    func stringFromDate() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: now)
    }
}

// MARK: - EZY_ reuse color extension
extension UIColor{
    static func rgb(red: CGFloat ,green: CGFloat,blue:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func rgba(red: CGFloat ,green: CGFloat,blue:CGFloat, alpha:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    static let EZY_000000 = UIColor.rgb(red: 0, green: 0, blue: 0)
    static let EZY_BAC8FF = UIColor.rgb(red: 186, green: 200, blue: 255)
    static let EZY_CFCBFF = UIColor.rgb(red: 207, green: 203, blue: 255)
    static let EZY_AFADFF = UIColor.rgb(red: 175, green: 173, blue: 255)
    static let EZY_968DFF = UIColor.rgb(red: 150, green: 141, blue: 255)
    static let EZY_6B40FF = UIColor.rgb(red: 107, green: 64,  blue: 255)
    static let EZY_C9BCFF = UIColor.rgb(red: 201, green: 188, blue: 255)
    static let EZY_B2B2B2 = UIColor.rgb(red: 178, green: 178, blue: 178)
    static let EZY_FCA1A1 = UIColor.rgb(red: 252, green: 161, blue: 161)
    static let EZY_747474 = UIColor.rgb(red: 116, green: 116, blue: 116)
    static let EZY_E3E3E3 = UIColor.rgb(red: 227, green: 227, blue: 227)
    static let EZY_FAFAFA = UIColor.rgb(red: 250, green: 250, blue: 250)
    static let EZY_AFAFAF = UIColor.rgb(red: 175, green: 175, blue: 175)
    static let EZY_E1E1E1 = UIColor.rgb(red: 225, green: 225, blue: 225)
    static let EZY_FFFFFF = UIColor.rgb(red: 255, green: 255, blue: 255)
    static let EZY_656565 = UIColor.rgb(red: 101, green: 101, blue: 101)
    static let EZY_DEDEDE = UIColor.rgb(red: 222, green: 222, blue: 222)
    static let EZY_CDCDCD = UIColor.rgb(red: 205, green: 205, blue: 205)
    static var EZY_TagColor1 = UIColor(red: 154/255, green: 119/255, blue: 255/255, alpha: 1)
    static var EZY_TagColor2 = UIColor(red: 129/255, green: 85/255, blue: 255/255, alpha: 1)
    static var EZY_TagColor3 = UIColor(red: 114/255, green: 110/255, blue: 255/255, alpha: 1)
    static var EZY_TagColor4 = UIColor(red: 100/255, green: 131/255, blue: 255/255, alpha: 1)
    static var EZY_TagColor5 = UIColor(red: 129/255, green: 154/255, blue: 255/255, alpha: 1)
    static var EZY_TagColor6 = UIColor(red: 159/255, green: 168/255, blue: 255/255, alpha: 1)
    static var EZY_TagColor7 = UIColor(red: 175/255, green: 173/255, blue: 255/255, alpha: 1)
    static var EZY_TagColor8 = UIColor(red: 156/255, green: 154/255, blue: 255/255, alpha: 1)
    static var EZY_TagColor9 = UIColor(red: 129/255, green: 126/255, blue: 255/255, alpha: 1)
    static var EZY_TagColor10 = UIColor(red: 127/255, green: 124/255, blue: 226/255, alpha: 1)
    static var EZY_TagColor11 = UIColor(red: 166/255, green: 152/255, blue: 255/255, alpha: 1)
    static var EZY_TagColor12 = UIColor(red: 186/255, green: 154/255, blue: 255/255, alpha: 1)
    static var EZY_TagColor13 = UIColor(red: 198/255, green: 171/255, blue: 255/255, alpha: 1)
    
    static var EZY_TagColorArray = [EZY_TagColor1,EZY_TagColor2,EZY_TagColor3,EZY_TagColor4,EZY_TagColor5,EZY_TagColor6,EZY_TagColor7,EZY_TagColor8,EZY_TagColor9,EZY_TagColor10,EZY_TagColor11,EZY_TagColor12,EZY_TagColor13]
}

//MARK: - UILabel dynamic font extension
extension UILabel {
    func dynamicFont(fontSize size: CGFloat, currentFontName: String) {
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height
    
    switch height {
    case 480.0: //Iphone 3,4S => 3.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.7)
      break
    case 568.0: //iphone 5, SE => 4 inch
        self.font = UIFont(name: currentFontName, size: size * 0.8)
      break
    case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
        self.font = UIFont(name: currentFontName, size: size * 0.92)
      break
    case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.95)
      break
    case 812.0: //iphone X, XS => 5.8 inch
        self.font = UIFont(name: currentFontName, size: size)
      break
    case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
        self.font = UIFont(name: currentFontName, size: size * 1.15)
      break
    case 844.0: //iphone 12, 12Pro => 6.1 inch
        self.font = UIFont(name: currentFontName, size: size * 1.08)
        break
    case 926.0: //iphone 12Pro MAX
        self.font = UIFont(name: currentFontName, size: size * 1.19)
        break
    default:
      print("not an iPhone")
      break
    }
  }
}

//MARK: - UITextField dynamic font extension
extension UITextField {
    func dynamicFont(fontSize size: CGFloat, currentFontName: String) {
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height

    switch height {
    case 480.0: //Iphone 3,4S => 3.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.7)
      break
    case 568.0: //iphone 5, SE => 4 inch
        self.font = UIFont(name: currentFontName, size: size * 0.8)
      break
    case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
        self.font = UIFont(name: currentFontName, size: size * 0.92)
      break
    case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.95)
      break
    case 812.0: //iphone X, XS => 5.8 inch
        self.font = UIFont(name: currentFontName, size: size)
      break
    case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
        self.font = UIFont(name: currentFontName, size: size * 1.15)
      break
    case 844.0: //iphone 12, 12Pro => 6.1 inch
        self.font = UIFont(name: currentFontName, size: size * 1.08)
        break
    case 926.0: //iphone 12Pro MAX
        self.font = UIFont(name: currentFontName, size: size * 1.19)
        break
    default:
      print("not an iPhone")
      break
    }
  }
    
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
}

//MARK: - UIView roundCornerRadius extension
extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}

//MARK: - UIButton dynamic font extension
extension UIButton {
    func dynamicFont(fontSize size: CGFloat, currentFontName: String) {
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height

    switch height {
    case 480.0: //Iphone 3,4S => 3.5 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 0.7)
      break
    case 568.0: //iphone 5, SE => 4 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 0.8)
      break
    case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 0.92)
      break
    case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 0.95)
      break
    case 812.0: //iphone X, XS => 5.8 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size)
      break
    case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 1.15)
      break
    case 844.0: //iphone 12, 12Pro => 6.1 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 1.08)
        break
    case 926.0: //iphone 12Pro MAX
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 1.19)
        break
    default:
      print("not an iPhone")
      break
    }
  }
}

//MARK: - UITextView dynamic font extension
extension UITextView {
    func dynamicFont(fontSize size: CGFloat, currentFontName: String) {
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height

    switch height {
    case 480.0: //Iphone 3,4S => 3.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.7)
      break
    case 568.0: //iphone 5, SE => 4 inch
        self.font = UIFont(name: currentFontName, size: size * 0.8)
      break
    case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
        self.font = UIFont(name: currentFontName, size: size * 0.92)
      break
    case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
        self.font = UIFont(name: currentFontName, size: size * 0.95)
      break
    case 812.0: //iphone X, XS => 5.8 inch
        self.font = UIFont(name: currentFontName, size: size)
      break
    case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
        self.font = UIFont(name: currentFontName, size: size * 1.15)
      break
    case 844.0: //iphone 12, 12Pro => 6.1 inch
        self.font = UIFont(name: currentFontName, size: size * 1.08)
        break
    case 926.0: //iphone 12Pro MAX
        self.font = UIFont(name: currentFontName, size: size * 1.19)
        break
    default:
      print("not an iPhone")
      break
    }
  }
}

//MARK: - label gradient extension
extension UILabel{
    public func updateGradientTextColor_horizontal(gradientColors: [UIColor] = [UIColor(white: 0, alpha: 0.95), UIColor(white: 0, alpha: 0.6)]){
        let size = CGSize(width: intrinsicContentSize.width, height: 1)
        
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
            end: CGPoint(x: size.width, y:0),
            options: []
        )
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            self.textColor = UIColor(patternImage: image)
        }
    }
    
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
            end: CGPoint(x: 0, y: size.height),
            options: []
        )
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            self.textColor = UIColor(patternImage: image)
        }
    }
   
}

// MARK: - view gradient color extension
extension UIView {
    @discardableResult
    func applyGradient(colors: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colors: colors, locations: nil)
    }

    @discardableResult
    func applyGradient(colors: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}


//MARK: - Shadow extension
extension CALayer {
func applySketchShadow(color: UIColor = .black,alpha: Float = 0.5,x:CGFloat,y:CGFloat,blur: CGFloat,spread: CGFloat = 0){
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur/UIScreen.main.scale
        masksToBounds = false
    
        if spread == 0 {
            shadowPath = nil
        }else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

//MARK: - TextField placeholder dynamic font
extension UITextField {
    func dynamicFont(fontSize size: CGFloat, weight: UIFont.Weight) {
        let currentFontName = self.font?.fontName
      var calculatedFont: UIFont?
      let bounds = UIScreen.main.bounds
      let height = bounds.size.height
      
      switch height {
      case 480.0: //Iphone 3,4S => 3.5 inch
        calculatedFont = UIFont(name: currentFontName!, size: size * 0.7)
        resizeFont(calculatedFont: calculatedFont, weight: weight)
        break
      case 568.0: //iphone 5, SE => 4 inch
        calculatedFont = UIFont(name: currentFontName!, size: size * 0.8)
        resizeFont(calculatedFont: calculatedFont, weight: weight)
        break
      case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch // iphone SE2 -> 4.7 inch
        calculatedFont = UIFont(name: currentFontName!, size: size * 0.92)
        resizeFont(calculatedFont: calculatedFont, weight: weight)
        break
      case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
        calculatedFont = UIFont(name: currentFontName!, size: size * 0.95)
       resizeFont(calculatedFont: calculatedFont, weight: weight)
        break
      case 812.0: //iphone X, XS => 5.8 inch // iphone 11 pro => 5.8 inch
        calculatedFont = UIFont(name: currentFontName!, size: size)
        resizeFont(calculatedFont: calculatedFont, weight: weight)
        break
      case 844.0 : // iphone 12 & iphone 12 pro => 6.1 inch
        calculatedFont = UIFont(name: currentFontName!, size: size * 1.08)
        resizeFont(calculatedFont: calculatedFont, weight: weight)
        break
      case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch // iphone 11 => 6.1 inch // iphone 11 pro max => 6.5 inch
        calculatedFont = UIFont(name: currentFontName!, size: size * 1.15)
        resizeFont(calculatedFont: calculatedFont, weight: weight)
        break
      case 926.0 : //iphone 12 pro max => 6.7 inch
        calculatedFont = UIFont(name: currentFontName!, size: size * 1.18)
        resizeFont(calculatedFont: calculatedFont, weight: weight)
        break
      default:
        print("not an iPhone")
        break
      }
    }
}




