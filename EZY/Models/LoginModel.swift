//
//  LoginModel.swift
//  EZY
//
//  Created by 노연주 on 2021/11/28.
//

import Foundation

struct LoginModel:Codable {
    var success:Bool
    var code: Int
    var massage: String
    var data: UserTokens
}

struct UserTokens:Codable {
    var accessToken:String
    var username:String
    var refreshToken:String
}
