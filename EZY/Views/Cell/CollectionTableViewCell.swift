//
//  CollectionViewCell.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/16.
//

import UIKit
protocol CollectionTableViewCellDelegate {
    func didSelectItem(with model : CollectionTableCellModel)
}
//
//class CollectionTableViewCell : UITableViewCell{
//
//    public var delegate: CollectionTableViewCellDelegate?
//
//    static let identifier  = "CollectionTableViewCell"
//
//    private var model = [CollectionTableCellModel]()
//
//    private let collectionView : UICollectionView
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        let layer = UICollectionViewFlowLayout()
//        layer.scrollDirection = .horizontal
//        layer.itemSize = CGSize(width: collectionView.frame.height, height: <#T##CGFloat#>)
//    }
//}

