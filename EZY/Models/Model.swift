//
//  Model.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/16.
//

import UIKit

enum CellModel {
    case collectionView(models: [CollectionTableCellModel], rows: Int)
 
}
struct CollectionTableCellModel{
    let title : String
    let color : UIColor
}

//MARK: - MoreCalendarModal Button 

struct MyCustomButtonViewModel{
    let title : String?
    let image: UIImage?
    let color : UIColor?
}

struct AlertBtn{
    let icon : UIImage?
    let color : UIColor?
    let message : UILabel?
}