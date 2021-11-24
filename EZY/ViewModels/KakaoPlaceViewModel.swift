//
//  KakaoPlaceViewModel.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/22.
//

import Foundation

struct KakaoPlaceViewModel {
    let KakaoPlaces : [KakaoDocuments]
}
extension KakaoPlaceViewModel{
    var numberOfSections : Int{
        return 1
    }
    func numberOfRowsInSection(_ section : Int) -> Int{
        return self.KakaoPlaces.count
    }
    func kakaoPlaceIndex(_ index : Int) -> KakaoViewModel{
        let kakaoPlace = self.KakaoPlaces[index]
        return KakaoViewModel(kakaoPlace)
    }
}

struct KakaoViewModel{
    private let kakaoPlace : KakaoDocuments
}
extension KakaoViewModel{
    init(_ kakaoPlace : KakaoDocuments){
        self.kakaoPlace = kakaoPlace
    }
}
extension KakaoViewModel{
    var placeName : String?{
        return self.kakaoPlace.placeName
    }
    var roadName : String?{
        return self.kakaoPlace.roadAddressName
    }
    var addressName: String?{
        return self.kakaoPlace.addressName
    }
}
