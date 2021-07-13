//
//  WhoShouldIAsk.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/12.
//

import UIKit

class WhoShouldIAskCell : UICollectionViewCell{
    let bglabel : UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.dynamicFont(fontSize: 12, weight: .bold)
        return label
    }()
    static func fittingSize(availableHeight: CGFloat, name: String?) -> CGSize {
            let cell = WhoShouldIAskCell()
            cell.configure(name: name)
            
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width , height: availableHeight)
            return cell.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .required)
    }
    func configure(name: String?) {
        bglabel.text = name
    }
    override var isHighlighted: Bool {
       didSet {
           if isSelected {
               UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                   // animate highlight
                self.backgroundColor = .red
                self.bglabel.textColor = .white
               }, completion: nil)
           } else {
               UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                   // animate unHighligh
                self.backgroundColor = .clear
                self.bglabel.textColor = .red
               }, completion: nil)
           }
       }
   }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bglabel)
        contentView.backgroundColor = .clear
        layer.cornerRadius = frame.height/6.4
        bglabel.textAlignment = .center
        bglabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10 - frame.height)
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
