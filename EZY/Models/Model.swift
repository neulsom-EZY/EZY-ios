//
//  Model.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/16.
//

import Foundation

enum CellModel {
    case collectionView(models: [CollectionTableCellModel], rows: Int)
 
}
struct CollectionTableCellModel{
    let title : String
}


