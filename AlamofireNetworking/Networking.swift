//
//  Networking.swift
//  AlamofireNetworking
//
//  Created by Dhawal Mahajan on 01/10/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import Foundation
import Alamofire

class Networking {
    
    
    typealias WebServiceResponse = ([[String : Any]]?, Error?) -> Void
    
    func execute(_ url : URL, completion: @escaping WebServiceResponse) {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
         
        
        Alamofire.request(url).validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            } else if let jsonArray = response.result.value as? [[String : Any]] {
                completion(jsonArray , nil)
            } else if let jsonDict = response.result.value as? [String : Any] {
                completion([jsonDict], nil)
            }
        }
        
    }
    
}
