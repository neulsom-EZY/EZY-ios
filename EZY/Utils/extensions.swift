//
//  extensions.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/05/31.
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

    
}
extension UILabel {
  func dynamicFont(fontSize size: CGFloat, weight: UIFont.Weight) {
    let currentFontName = self.font.fontName
    var calculatedFont: UIFont?
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height
    
    switch height {
    case 480.0: //Iphone 3,4S => 3.5 inch
      calculatedFont = UIFont(name: currentFontName, size: size * 0.7)
      resizeFont(calculatedFont: calculatedFont, weight: weight)
      break
    case 568.0: //iphone 5, SE => 4 inch
      calculatedFont = UIFont(name: currentFontName, size: size * 0.8)
      resizeFont(calculatedFont: calculatedFont, weight: weight)
      break
    case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
      calculatedFont = UIFont(name: currentFontName, size: size * 0.92)
      resizeFont(calculatedFont: calculatedFont, weight: weight)
      break
    case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
      calculatedFont = UIFont(name: currentFontName, size: size * 0.95)
     resizeFont(calculatedFont: calculatedFont, weight: weight)
      break
    case 812.0: //iphone X, XS => 5.8 inch
      calculatedFont = UIFont(name: currentFontName, size: size)
      resizeFont(calculatedFont: calculatedFont, weight: weight)
      break
    case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
      calculatedFont = UIFont(name: currentFontName, size: size * 1.15)
      resizeFont(calculatedFont: calculatedFont, weight: weight)
      break
    default:
      print("not an iPhone")
      break
    }
  }
  
  private func resizeFont(calculatedFont: UIFont?, weight: UIFont.Weight) {
    self.font = calculatedFont
    self.font = UIFont.systemFont(ofSize: calculatedFont!.pointSize, weight: weight)
  }
}


