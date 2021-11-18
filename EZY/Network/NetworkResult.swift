//
//  NetworkResult.swift
//  EZY
//
//  Created by 노연주 on 2021/11/15.
//

import Foundation

enum APIResult<T> {
    case success(T) // 성공
    case invalidURL // 잘못된 URL
    case requsestError(T) // 잘못된 파라미터
    case networkError // 네트워크 에러
    case tokenError // 토큰 만료
    case authorityError // 권한 없음
}
