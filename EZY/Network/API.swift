//
//  API.swift
//  EZY
//
//  Created by 노연주 on 2021/11/15.
//

import Alamofire
import UIKit

class API {
    static let shared: API = API() 
    
    func request(url: String, method: HTTPMethod, parameter: [String: Any]? = nil, completion: @escaping (APIResult<Any>) -> Void) {
        var header: HTTPHeaders = [ : ]
        AF.request("\(Config.baseURL)\(url)",method: method, parameters: parameter, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
                guard let data = response.data else { return }
                guard let status = response.response?.statusCode else { return }
                let networkResult = self.statusFilter(data: data, status: status)
                completion(.success(networkResult))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.networkError)
            }
        }
    }
    
    private func statusFilter(data: Data, status: Int) -> APIResult<Any> {
        switch status {
        case 200, 201:
            return .success(data)
        case 204, 400, 500:
            return .requsestError(data)
        case 404:
            return .invalidURL
        case 401:
            return .tokenError
        case 403:
            return .authorityError
        default:
            return .requsestError(data)
        }
    }
}
