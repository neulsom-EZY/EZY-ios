//
//  extensions.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/05/31.
//

import UIKit

// MARK: - UIColor 재정의
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
    static let EZY_818181 = UIColor.rgb(red: 129, green: 129, blue: 129)
    static let EZY_6A6A6A = UIColor.rgb(red: 106, green: 106, blue: 106)
    static let EZY_F5F5F5 = UIColor.rgb(red: 245, green: 245, blue: 245)
    static let EZY_CACACA = UIColor.rgb(red: 202, green: 202, blue: 202)
    static let EZY_A7A7A7 = UIColor.rgb(red: 167, green: 167, blue: 167)
    static let EZY_B2B2B2 = UIColor.rgb(red: 178, green: 178, blue: 178)
    static let EZY_CDCDCD = UIColor.rgb(red: 205, green: 205, blue: 205)
    static let EZY_DEDEDE = UIColor.rgb(red: 222, green: 222, blue: 222)
}

// MARK: - UILabel 재정의
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
    case 926.0 : //iphone 12 pro max => 6.7 inch
      calculatedFont = UIFont(name: currentFontName, size: size * 1.18)
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
    public func updateGradientTextColor_vertical(gradientColors: [UIColor] = [UIColor(white: 0, alpha: 0.95), UIColor(white: 0, alpha: 0.0)]){
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

//MARK: - TextField 재정의
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
//      case 780.0 : //iphone 12 mini
//        calculatedFont = UIFont(name: currentFontName!, size: size)
//        resizeFont(calculatedFont: calculatedFont, weight: weight)
//        break
      case 812.0: //iphone X, XS => 5.8 inch // iphone 11 pro => 5.8 inch
        calculatedFont = UIFont(name: currentFontName!, size: size)
        resizeFont(calculatedFont: calculatedFont, weight: weight)
        break
//      case 844.0 : // iphone 12 & iphone 12 pro => 6.1 inch
//        calculatedFont = UIFont(name: currentFontName!, size: size)
//        resizeFont(calculatedFont: calculatedFont, weight: weight)
//        break
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
    
      private func resizeFont(calculatedFont: UIFont?, weight: UIFont.Weight) {
          self.font = calculatedFont
          self.font = UIFont.systemFont(ofSize: calculatedFont!.pointSize, weight: weight)
    }
}
//MARK: - TextView 재정의
extension UITextView {
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
      case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
        calculatedFont = UIFont(name: currentFontName!, size: size * 0.92)
        resizeFont(calculatedFont: calculatedFont, weight: weight)
        break
      case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
        calculatedFont = UIFont(name: currentFontName!, size: size * 0.95)
       resizeFont(calculatedFont: calculatedFont, weight: weight)
        break
      case 812.0: //iphone X, XS => 5.8 inch
        calculatedFont = UIFont(name: currentFontName!, size: size)
        resizeFont(calculatedFont: calculatedFont, weight: weight)
        break
      case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
        calculatedFont = UIFont(name: currentFontName!, size: size * 1.15)
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


// MARK: - AddToDoViewController 재정의
extension AddMyToDoViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = view.frame.height/40.6
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.height/9.6,
                      height: view.frame.size.height/25.3)
    }
    
}




