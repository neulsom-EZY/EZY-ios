//
//  UserModel.swift
//  EZY
//
//  Created by 노연주 on 2021/11/15.
//

import Foundation

struct UserModel:Codable {
    let success: Bool
    let fcmToken: String
    let password: String
    let phoneNumber: String
    let username: String
}
