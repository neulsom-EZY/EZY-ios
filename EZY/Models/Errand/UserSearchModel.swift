//
//  UserSearchModel.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/29.
//

import Foundation
class UserSearchModel : Codable{
    let list : [UserNameDocument]
}
struct UserNameDocument: Codable{
    let username : String
}
