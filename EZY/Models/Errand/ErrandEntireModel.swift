//
//  ErrandEntireModel.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/26.
//

import Foundation

class ErrandEntireModel : Codable{
    let list : [ErrandEntireDocument]
}
struct ErrandEntireDocument : Codable{
    let planIdx : Int
    let subject : String
    let title : String
    let period : periodDocument
    let sender : String
    let recipient : String
    let errandStatus: String
}
struct periodDocument : Codable{
    let startDateTime : String
    let endDateTime : String
}

