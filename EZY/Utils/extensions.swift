//
//  extensions.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/05/31.
//

import UIKit

// MARK: - UIColor 재정의
extension UIColor{
    static let EZY_818181 = UIColor.rgb(red: 129, green: 129, blue: 129)
    static let EZY_6A6A6A = UIColor.rgb(red: 106, green: 106, blue: 106)
    static let EZY_F5F5F5 = UIColor.rgb(red: 245, green: 245, blue: 245)
    static let EZY_CACACA = UIColor.rgb(red: 202, green: 202, blue: 202)
    static let EZY_A7A7A7 = UIColor.rgb(red: 167, green: 167, blue: 167)
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

  }
//MARK: - CALayer
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
extension UISwitch {
    func set(width : CGFloat, height : CGFloat){
        let standardHeight: CGFloat = 31
        let standardWidth: CGFloat = 51

        let heightRatio = height/standardHeight
        let widthRatio = width / standardWidth
        
        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}


//MARK: - PersonalCalendarViewController TableView

extension PersonalCalendarViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomManagePushNotificationCell.identifier, for: indexPath) as! CustomManagePushNotificationCell
        cell.title.text = titleNotification[indexPath.row]
        cell.explanation.text = explanation[indexPath.row]
        return cell
    }
}

extension TeamCalendarViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomManagePushNotificationCell.identifier, for: indexPath) as! CustomManagePushNotificationCell
        cell.title.text = titleNotification[indexPath.row]
        cell.explanation.text = explanation[indexPath.row]
        return cell
    }
}

extension ErrandCalendarViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomManagePushNotificationCell.identifier, for: indexPath) as! CustomManagePushNotificationCell
        cell.title.text = titleNotification[indexPath.row]
        cell.explanation.text = explanation[indexPath.row]
        return cell
    }
}
