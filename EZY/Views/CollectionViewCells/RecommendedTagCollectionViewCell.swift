//
//  recommendedTagCollectionViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/08/13.
//

import UIKit

protocol CustomCollectionViewCellDelegate: AnyObject{
    func didTabButton(with string: String)
}

class RecommendedTagCollectionViewCell: UICollectionViewCell {
    static let reuseId = "\(RecommendedTagCollectionViewCell.self)"
        
    public weak var delegate: CustomCollectionViewCellDelegate?
        
    lazy var cellBackgroundView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.layer.shadowOpacity = 0.11
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowRadius = 7
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.backgroundColor = .white
    }
    
    lazy var tagButton = UIButton().then{
        $0.isEnabled = true
        $0.setTitle("STUDY", for: .normal)
        $0.setTitleColor(UIColor(red: 115/255, green: 103/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor(red: 121/255, green: 109/255, blue: 255/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 5
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var addButton = UIButton().then{
        $0.layer.cornerRadius = 10
        $0.setTitle("추 가", for: .normal)
        $0.dynamicFont(fontSize: 9, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = UIColor(red: 154/255, green: 145/255, blue: 254/255, alpha: 1)
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    
    //MARK: LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutSetting()
    }
    
    private var string: String?
    
    public func configure(with string: String){
        self.string = string
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutSetting()
    }
    
    @objc func addButtonClicked(sender:UIButton){
        
        guard let string = string else {
            return
        }
        
        delegate?.didTabButton(with: string)
    }
    
    
    func layoutSetting(){
        contentView.addSubview(cellBackgroundView)
        
        cellBackgroundView.addSubview(addButton)
        cellBackgroundView.addSubview(tagButton)
        
        addButton.addTarget(self, action: #selector(addButtonClicked(sender:)), for: .touchUpInside)
        
        cellBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.1)
            make.height.equalToSuperview().dividedBy(1.1)
        }
        
        tagButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(contentView.frame.height/7.25)
            make.height.equalToSuperview().dividedBy(4.6)
            make.width.equalToSuperview().dividedBy(1.6)
        }
        
        addButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.6)
            make.height.equalToSuperview().dividedBy(3.6)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-contentView.frame.height/7.25)
        }
    }
}
