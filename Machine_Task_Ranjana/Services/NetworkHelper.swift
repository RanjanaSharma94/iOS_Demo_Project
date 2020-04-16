//
//  NetworkHelper.swift
//  Machine_Task_Ranjana
//
//  Created by Ranjana Sharma on 15/04/20.
//  Copyright © 2020 Ranjana Sharma. All rights reserved.
//

import Foundation
import Alamofire

open class NetworkHelper<T: RecordTemplate> {
    
    var BASE_PATH = "http://dummy.restapiexample.com/api/v1/"
    
    open func APICall(_ apiUrl : String,
                      method: HTTPMethod,
                      parameters : [String: Any]? = nil,
                      headers :HTTPHeaders = [],
                      success :((_ model : T) -> Void)? = nil,
                      unsuccessfull : ((_ error: String) -> Void)? = nil) {
        
        guard Alamofire.NetworkReachabilityManager(host: "\(BASE_PATH)\(apiUrl)")?.isReachable ?? false else {
            unsuccessfull?("No Internet Connection")
            return
        }
        
        print(BASE_PATH+apiUrl)
        let encoding: ParameterEncoding = (method == .get ? URLEncoding.default : JSONEncoding.default)
        
        AF.request(BASE_PATH+apiUrl, method: method, parameters: parameters, encoding: encoding, headers: headers).responseString { (response) in
//                print("The response in Network Helper \(response.result)")
            }
            .responseJSON { (response) in
                    if response.error != nil {
                        unsuccessfull?(response.error as? String ?? "")
                        print(response.error ?? "")
                    } else {
                        if let value = response.value,
                            let dict = value as? [String: Any] {
                            let data = NSDictionary(dictionary: dict)
                            print(response.value ?? "")
                            if let responseData = data["data"] as? [String: Any] {
                                if let code = data["code"] as? Int {
                                    if code == -114 {
                                        print("got message")
                                    }
                                }
                            }
                            success?(T(fromDictionary: data as? [String: Any] ?? [:]))
                        }
                    }
        }
        
        
        
    }
}

