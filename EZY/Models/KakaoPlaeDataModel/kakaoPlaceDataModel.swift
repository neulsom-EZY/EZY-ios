//
//  kakaoPlaceDataModel.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/13.
//

import Foundation
import Alamofire

class KakaoDataModel : Codable{
    let documents : [KakaoDocuments]
}
struct KakaoDocuments : Codable{
    var addressName,placeName, roadAddressName : String
    enum CodingKeys : String,CodingKey{
        case addressName  = "address_name"
        case placeName = "place_name"
        case roadAddressName = "road_address_name"
    }
}