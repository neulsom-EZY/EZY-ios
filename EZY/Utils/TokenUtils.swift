//
//  TokenUtils.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/22.
//
import Security
import Foundation
import UIKit
import Alamofire

final class TokenUtils{
    
    static let shared = TokenUtils()
    private init() { }
    
    //MARK: - 키체인 값 저장
    func save(_ service: String, account : String, value : String){
        let keyChainQuery : NSDictionary = [
            kSecClass : kSecClassGenericPassword, // 어떤 타입 저장할 지
            kSecAttrService : service, //앱 번들 id
            kSecAttrAccount : account, //사용자 계정
            kSecValueData : value.data(using: .utf8,allowLossyConversion: false)! // 저장할 값
        ]
        //현재 저장되어 있는 값 삭제 - 기존의 값을 덮어 쓰지 못하기 떄문에
        SecItemDelete(keyChainQuery)
        //새로운 키 체인 아이템 등록
        let status: OSStatus = SecItemAdd(keyChainQuery, nil)
        assert(status == noErr, "토큰 값 저장에 실패했습니다.")
        NSLog("status = \(status)")
    }
    //MARK: - 키체인에 저장된 값을 읽어오는 메소드
    func read(_ service : String, account : String) -> String?{
        //1.키 체인 쿼리 정의
        let keyChainQuery :NSDictionary = [
                kSecClass : kSecClassGenericPassword,
                kSecAttrService : service,
                kSecAttrAccount : account,
                kSecReturnData : kCFBooleanTrue!, //CFData타입으로 불러오라는 의미
                kSecMatchLimit : kSecMatchLimitOne // 중복되는 경우 하나의 값만 가져오라는 의미
            ]
            //2.키 체인에 저장된 값을 읽어온다
            var dataTypeRef : AnyObject?
            let status = SecItemCopyMatching(keyChainQuery, &dataTypeRef)
            
            //3.처리 결과가 성공이라면 읽어온 값을 Data 타입으로 변환하고, 다시 String 타입으로 변환한다.
        if (status == errSecSuccess){
                let retrievedData = dataTypeRef as! Data
                let value = String(data: retrievedData, encoding: .utf8)
                return value
            }else{
                //4.처리결과가 실패라면 nil을 반환한다.
                print("Nothing was retrieved from the keychain. Status code \(status)")
                return nil
            }
    }
    // 키체인에 저장된 값을 삭제하는 메소드
    func delete(_ service : String, account : String){
        let keyChainQuery : NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount : account
        ]
        //현재 저장되어 있는 값 삭제
        let status = SecItemDelete(keyChainQuery)
        assert(status == noErr , "토큰값 삭제에 실패했습니다.")
        NSLog("status = \(status)")
    }
    //키 체인안에 저장된 엑세스 토큰을 이용하여 헤더를 만들어주는 메소드
    func getAuthorizationHeader(_ serviceID : String) -> HTTPHeaders? {
         let serviceID = serviceID
         if let accessToken = self.read(serviceID, account: "accessToken"){
//             return ["Autorization": "Bearer \(accessToken)"] as HTTPHeaders
             return ["Autorization": "\(accessToken)"] as HTTPHeaders
         }else{
             return nil
         }
     }
}
