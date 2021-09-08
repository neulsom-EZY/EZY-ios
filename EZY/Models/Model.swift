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

struct CustomButtonViewModel{
    let title : String?
    let image: UIImage?
    let color : UIColor?
}

struct AlertBtn{
    let icon : UIImage?
    let iconTintColor : UIColor?
    let message : String?
}

struct OneAlertBtn{
    let icon : UIImage?
    let iconTintColor : UIColor?
}

struct ErrandinputContainerTv{
    let viewbackColor : UIColor?
    let titleText : String?
    let titleColor : UIColor?
    let explanationText : String?
    let writeEditable : Bool?
}

struct SendUserView {
    let sender : String?
    let recipient : String?
    let senderColor : UIColor?
    let recipientColor: UIColor?
    let senderStrokeColor : UIColor?
    let recipientStrokeColor : UIColor?
}

//MARK: - SearchData
struct SearchData {
    let koreanName : String
    let name : String
}


