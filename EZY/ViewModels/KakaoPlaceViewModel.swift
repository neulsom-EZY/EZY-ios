//
//  KakaoPlaceViewModel.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/22.
//

import Foundation

struct KakaoPlaceViewModel {
    let KakaoPlace : [KakaoDocuments]
}
extension KakaoPlaceViewModel{
    var numberOfSections : Int{
        return 1
    }
    func numberOfRowsInSection(_ section : Int) -> Int{
        return self.KakaoPlace.count
    }
    func kakaoPlaceIndex(_ index : Int) -> KakaoViewModel{
        let kakaoPlace = self.KakaoPlace[index]
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
