//
//  TagCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/27.
//

import UIKit

class TagCell : UICollectionViewCell{
    static let identifier = "TagCell"
    
    let bglabel = UILabel().then {
        $0.sizeToFit()
        $0.clipsToBounds = true
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textAlignment = .center
    }
    
    let iv = UIImageView().then{
        $0.contentMode = .scaleAspectFit
    }
    //MARK: - Select effect
    override var isSelected: Bool{
        didSet{
            if isSelected{
                UIView.animate(withDuration: 0.1) { [self] in
                    contentView.backgroundColor = backgroundColor
                    bglabel.textColor = .white
                    iv.tintColor = .white
                }
            }
            else {
                UIView.animate(withDuration: 0.1) { [self] in
                    contentView.backgroundColor = .white
                    bglabel.textColor = backgroundColor
                    iv.tintColor = backgroundColor
                }
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(bglabel)
        contentView.addSubview(iv)
        Location()
    }
    private func Location(){
        bglabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        iv.snp.makeConstraints{
            $0.height.width.equalTo(contentView.frame.height/3.58)
            $0.center.equalToSuperview()
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        iv.tintColor = .white
        contentView.backgroundColor = .white
        bglabel.textColor = .white
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 20
        contentView.layer.cornerRadius = 10
        contentView.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 4, blur: 14, spread: 0)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
