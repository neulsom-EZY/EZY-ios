//
//  KakaoPlaceSearchAPI.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/13.
//

import Foundation
import Alamofire

struct KakaoPlaceSearchAPI{
    
    static let shared = KakaoPlaceSearchAPI()
    
    func getKakaoInfo(Parameters param : Parameters,completion : @escaping (NetworkResult<Any>) -> Void){
        let URL  = "https://dapi.kakao.com/v2/local/search/keyword.json"
        
        let header : HTTPHeaders = [ "Authorization" : "KakaoAK 5991020f6bc97398537f1fc8ede3c0c5"]

        let dataRequest = AF.request(URL, method: .get, parameters: param, encoding: URLEncoding.queryString, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
            case .success(let success) :
                guard let statusCode = dataResponse.response?.statusCode else {return}
                print(statusCode)
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                print(success)
                completion(networkResult)
            case.failure(let err):
                print(err.localizedDescription)
                completion(.pathErr)
            }
        }
    }
    //MARK: - StatusCode를 바탕으로 결과값 처리
    private func judgeStatus(by  statusCode : Int, _ data : Data) -> NetworkResult<Any>{
        switch statusCode{
        case 200 : return isValidData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    //MARK: - 200대 이하로 떨어질때 데이터 가공
    private func isValidData(data : Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let dataDecoder = try? decoder.decode(KakaoDataModel.self, from: data) else {return .pathErr}
        print(dataDecoder.documents)
        return .success(dataDecoder.documents)
    }
}
