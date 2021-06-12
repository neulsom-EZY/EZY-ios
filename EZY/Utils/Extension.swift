//
//  Extension.swift
//  EZY
//
//  Created by 노연주 on 2021/06/02.
//

import UIKit

extension UIColor{
    static func rgb(red: CGFloat ,green: CGFloat,blue:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
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
    static let EZY_000000 = UIColor.rgb(red: 0, green: 0, blue: 0)
    static let EZY_FCA1A1 = UIColor.rgb(red: 252, green: 161, blue: 161)
}

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
    default:
      print("not an iPhone")
      break
    }
  }
}

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
    case 926.0: //iphone 12 Pro Max
        self.font = UIFont(name:currentFontName, size: size * 1.18)
    default:
      print("not an iPhone")
      break
    }
  }
}

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

extension UIView {
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }

    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

//class ViewController: UIViewController {
//
//    @IBOutlet weak var btn: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.btn.applyGradient(colours: [.yellow, .blue])
//        self.view.applyGradient(colours: [.yellow, .blue, .red], locations: [0.0, 0.5, 1.0])
//    }
//
//
//}
