//
//  UserModel.swift
//  EZY
//
//  Created by 노연주 on 2021/11/15.
//

import Foundation

struct UserModel:Codable {
    var success: Bool
    var fcmToken: String
    var password: String
    var phoneNumber: String
    var username: String
}
