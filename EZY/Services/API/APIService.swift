//
//  APIService.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/23.
//
import Foundation
import Alamofire
import UIKit

//MARK: - API Service !
class APIService<T : Decodable>{

    //MARK: - Request Method
    func Request(url : String ,method : HTTPMethod, param : Parameters?, header : HTTPHeaders?,completion: @escaping(NetworkResult<Any>) ->  Void){
        let dataRequest = AF.request("\(Config.baseURL)\(url)",
                                     method: method,
                                     parameters: param,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseJSON { (response) in
            switch response.result{
            case.success(let success):
                NSLog("Success : \(success)")
                guard let statusCode = response.response?.statusCode else {return}
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data, method: method)
                completion(networkResult)
            case.failure(let err):
                NSLog("Fail : \(err.localizedDescription)")
                completion(.pathErr)
            }
        }
    }
    //MARK: - Data Request Status
    private func judgeStatus(by  statusCode : Int, _ data : Data, method : HTTPMethod) -> NetworkResult<Any>{
        switch statusCode{
        case 200 : return methodStatus(method: method, data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    //MARK: - Method Type
    private func methodStatus(method : HTTPMethod, data : Data) -> NetworkResult<Any>{
        switch method{
        case .post:
            return .success(data)
        case .get:
            return isValidData(data)
        case .put:
            return .success(data)
        case .delete:
            return .success(data)
        default:
            return .pathErr
        }
    }
    //MARK: - JSONDecoder
    private func isValidData(_ data : Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let dataDecoder = try? decoder.decode(T.self, from: data) else {return .pathErr}
        print(dataDecoder)
        return .success(dataDecoder)
    }
}

