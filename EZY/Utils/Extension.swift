//
//  Extension.swift
//  EZY
//
//  Created by 노연주 on 2021/06/02.
//

import UIKit

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
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
<<<<<<< HEAD
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
=======
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
extension UIColor{
    static func rgb(red: CGFloat ,green: CGFloat,blue:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
    
    static func rgba(red: CGFloat ,green: CGFloat,blue:CGFloat, alpha:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    static let EZY_BAC8FF = UIColor.rgb(red: 186, green: 200, blue: 255)
    static let EZY_CFCBFF = UIColor.rgb(red: 207, green: 203, blue: 255)
    static let EZY_AFADFF = UIColor.rgb(red: 175, green: 173, blue: 255)
    static let EZY_968DFF = UIColor.rgb(red: 150, green: 141, blue: 255)
    static let EZY_6B40FF = UIColor.rgb(red: 107, green: 64,  blue: 255)
    static let EZY_C9BCFF = UIColor.rgb(red: 201, green: 188, blue: 255)
    static let EZY_B2B2B2 = UIColor.rgb(red: 178, green: 178, blue: 178)
=======
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
    static func rgba(red: CGFloat ,green: CGFloat,blue:CGFloat, alpha:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    static let EZY_BAC8FF = UIColor.rgb(red: 186, green: 200, blue: 255)
    static let EZY_CFCBFF = UIColor.rgb(red: 207, green: 203, blue: 255)
    static let EZY_AFADFF = UIColor.rgb(red: 175, green: 173, blue: 255)
    static let EZY_8099FF = UIColor.rgb(red: 128, green: 153, blue: 255)
    static let EZY_F4F6FF = UIColor.rgb(red: 244, green: 246, blue: 255)
    static let EZY_968DFF = UIColor.rgb(red: 150, green: 141, blue: 255)
    static let EZY_939393 = UIColor.rgb(red: 147, green: 147, blue: 147)
    static let EZY_FFCDB8 = UIColor.rgb(red: 255, green: 205, blue: 184)
    static let EZY_BADEFF = UIColor.rgb(red: 186, green: 222, blue: 255)
    static let EZY_CFE3CE = UIColor.rgb(red: 207, green: 227, blue: 255)
    static let EZY_E4C9FF = UIColor.rgb(red: 228, green: 201, blue: 255)
    static let EZY_6B40FF = UIColor.rgb(red: 107, green: 64,  blue: 255)
    static let EZY_FFA680 = UIColor.rgb(red: 255, green: 166, blue: 128)
    static let EZY_FFD18D = UIColor.rgb(red: 255, green: 209, blue: 141)
    static let EZY_B880FF = UIColor.rgb(red: 184, green: 128, blue: 255)
    static let EZY_F6F3FF = UIColor.rgb(red: 246, green: 243, blue: 255)
    static let EZY_C7E0D4 = UIColor.rgb(red: 199, green: 224, blue: 212)
    static let EZY_FFCBB5 = UIColor.rgb(red: 255, green: 203, blue: 181)
    static let EZY_FFB5B5 = UIColor.rgb(red: 255, green: 181, blue: 181)
    static let EZY_ADCAE5 = UIColor.rgb(red: 173, green: 202, blue: 229)
    static let EZY_EED9B9 = UIColor.rgb(red: 238, green: 217, blue: 185)
    static let EZY_FFCEB9 = UIColor.rgb(red: 255, green: 206, blue: 185)
    static let EZY_DEC4FF = UIColor.rgb(red: 222, green: 196, blue: 255)
    static let EZY_656565 = UIColor.rgb(red: 101, green: 101, blue: 101)
    static let EZY_929292 = UIColor.rgb(red: 146, green: 146, blue: 146)
    static let EZY_B6B6B6 = UIColor.rgb(red: 182, green: 182, blue: 182)
    static let EZY_C9BCFF = UIColor.rgb(red: 201, green: 188, blue: 255)
    static let EZY_B2B2B2 = UIColor.rgb(red: 178, green: 178, blue: 178)
    static let EZY_FFFFFF = UIColor.rgb(red: 255, green: 255, blue: 255)
    static let EZY_B5A0FF = UIColor.rgb(red: 181, green: 160, blue: 255)
    static let EZY_8F8DFF = UIColor.rgb(red: 143, green: 141, blue: 255)
    static let EZY_BFCCFF = UIColor.rgb(red: 191, green: 204, blue: 255)
<<<<<<< HEAD
=======
    
    static func rgba(red: CGFloat ,green: CGFloat,blue:CGFloat, alpha:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    static let EZY_BAC8FF = UIColor.rgb(red: 186, green: 200, blue: 255)
    static let EZY_CFCBFF = UIColor.rgb(red: 207, green: 203, blue: 255)
    static let EZY_AFADFF = UIColor.rgb(red: 175, green: 173, blue: 255)
    static let EZY_968DFF = UIColor.rgb(red: 150, green: 141, blue: 255)
    static let EZY_6B40FF = UIColor.rgb(red: 107, green: 64,  blue: 255)
    static let EZY_C9BCFF = UIColor.rgb(red: 201, green: 188, blue: 255)
    static let EZY_B2B2B2 = UIColor.rgb(red: 178, green: 178, blue: 178)
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
    static let EZY_000000 = UIColor.rgb(red: 0, green: 0, blue: 0)
    static let EZY_FCA1A1 = UIColor.rgb(red: 252, green: 161, blue: 161)
    static let EZY_747474 = UIColor.rgb(red: 116, green: 116, blue: 116)
    static let EZY_E3E3E3 = UIColor.rgb(red: 227, green: 227, blue: 227)
    static let EZY_FAFAFA = UIColor.rgb(red: 250, green: 250, blue: 250)
    static let EZY_AFAFAF = UIColor.rgb(red: 175, green: 175, blue: 175)
    static let EZY_E1E1E1 = UIColor.rgb(red: 225, green: 225, blue: 225)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    static let EZY_FFFFFF = UIColor.rgb(red: 255, green: 255, blue: 255)
    static let EZY_656565 = UIColor.rgb(red: 101, green: 101, blue: 101)
    static let EZY_DEDEDE = UIColor.rgb(red: 222, green: 222, blue: 222)
    static let EZY_CDCDCD = UIColor.rgb(red: 205, green: 205, blue: 205)
}

//MARK: - UILabel dynamic font extension
=======
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
    static let EZY_AAA8FF = UIColor.rgb(red: 170, green: 168, blue: 255)
    static let EZY_D0D0D0 = UIColor.rgb(red: 208, green: 208, blue: 208)
    static let EZY_796DFF = UIColor.rgb(red: 121, green: 109, blue: 255)
    static let EZY_8F85FF = UIColor.rgb(red: 143, green: 133, blue: 255)
    static let EZY_PLAN_FINISH_PURPLE = UIColor.rgb(red: 189, green: 170, blue: 255)
    static let EZY_PLAN_YELLOW = UIColor.rgb(red: 255, green: 209, blue: 141)
    static let EZY_PLAN_ORANGE = UIColor.rgb(red: 255, green: 166, blue: 128)
    static let EZY_PLAN_PURPLE = UIColor.rgb(red: 141, green: 138, blue: 255)
    static let EZY_PLAN_MIDDLEPURPLE = UIColor.rgb(red: 175, green: 173, blue: 255)
    static let EZY_PLAN_LIGHTPURPLE = UIColor.rgb(red: 200, green: 199, blue: 255)
    static let EZY_PLAN_FINISH_BACK = UIColor.rgb(red: 242, green: 242, blue: 242)
    static let EZY_PLAN_DO_BACK = UIColor.rgb(red: 255, green: 255, blue: 255)
}

extension CGColor{
    static let EZY_PLAN_DO_SHADOW = UIColor.EZY_000000.cgColor
    static let EZY_PLAN_FINISH_SHADOW = UIColor.EZY_FFFFFF.cgColor
}

extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}

<<<<<<< HEAD
=======
    static let EZY_FFFFFF = UIColor.rgb(red: 255, green: 255, blue: 255)
    static let EZY_656565 = UIColor.rgb(red: 101, green: 101, blue: 101)
    static let EZY_DEDEDE = UIColor.rgb(red: 222, green: 222, blue: 222)
    static let EZY_CDCDCD = UIColor.rgb(red: 205, green: 205, blue: 205)
}

//MARK: - UILabel dynamic font extension
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
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
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
    case 844.0: //iphone 12, 12Pro => 6.1 inch
        self.font = UIFont(name: currentFontName, size: size * 1.08)
        break
    case 926.0: //iphone 12Pro MAX
        self.font = UIFont(name: currentFontName, size: size * 1.19)
        break
<<<<<<< HEAD
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
=======
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
    default:
      print("not an iPhone")
      break
    }
  }
}

<<<<<<< HEAD
<<<<<<< HEAD
extension UITextView {
=======
//MARK: - UITextField dynamic font extension
extension UITextField {
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
//MARK: - UITextField dynamic font extension
extension UITextField {
=======
extension UITextView {
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
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
<<<<<<< HEAD
<<<<<<< HEAD
    case 926.0: //iphone 12 Pro Max
        self.font = UIFont(name:currentFontName, size: size * 1.18)
=======
=======
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
    case 844.0: //iphone 12, 12Pro => 6.1 inch
        self.font = UIFont(name: currentFontName, size: size * 1.08)
        break
    case 926.0: //iphone 12Pro MAX
        self.font = UIFont(name: currentFontName, size: size * 1.19)
        break
<<<<<<< HEAD
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
=======
    case 926.0: //iphone 12 Pro Max
        self.font = UIFont(name:currentFontName, size: size * 1.18)
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
    default:
      print("not an iPhone")
      break
    }
  }
}

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
//MARK: - UIView roundCornerRadius extension
extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}

//MARK: - UIButton dynamic font extension
<<<<<<< HEAD
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
=======
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
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
<<<<<<< HEAD
<<<<<<< HEAD
    case 926.0: //iphone 12 Pro Max
        self.titleLabel?.font = UIFont(name:currentFontName, size: size * 1.18)
=======
=======
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
    case 844.0: //iphone 12, 12Pro => 6.1 inch
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 1.08)
        break
    case 926.0: //iphone 12Pro MAX
        self.titleLabel?.font = UIFont(name: currentFontName, size: size * 1.19)
        break
<<<<<<< HEAD
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
=======
    case 926.0: //iphone 12 Pro Max
        self.titleLabel?.font = UIFont(name:currentFontName, size: size * 1.18)
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
    default:
      print("not an iPhone")
      break
    }
  }
}

<<<<<<< HEAD
<<<<<<< HEAD

extension UITextField {
=======
//MARK: - UITextView dynamic font extension
extension UITextView {
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
//MARK: - UITextView dynamic font extension
extension UITextView {
=======

extension UITextField {
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
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
<<<<<<< HEAD
<<<<<<< HEAD
    case 926.0: //iphone 12 Pro Max
        self.font = UIFont(name:currentFontName, size: size * 1.18)
=======
=======
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
    case 844.0: //iphone 12, 12Pro => 6.1 inch
        self.font = UIFont(name: currentFontName, size: size * 1.08)
        break
    case 926.0: //iphone 12Pro MAX
        self.font = UIFont(name: currentFontName, size: size * 1.19)
        break
<<<<<<< HEAD
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
=======
    case 926.0: //iphone 12 Pro Max
        self.font = UIFont(name:currentFontName, size: size * 1.18)
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
    default:
      print("not an iPhone")
      break
    }
  }
}

<<<<<<< HEAD
<<<<<<< HEAD
=======
//MARK: - label gradient extension
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
//MARK: - label gradient extension
=======
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
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
<<<<<<< HEAD
<<<<<<< HEAD
        
=======
          
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
          
=======
        
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
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

<<<<<<< HEAD
<<<<<<< HEAD
=======
// MARK: - view gradient color extension
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
// MARK: - view gradient color extension
=======
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
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

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac

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




<<<<<<< HEAD
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
=======
>>>>>>> 9bbc5407cdf17955541ca51e4b109690faf78959
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
