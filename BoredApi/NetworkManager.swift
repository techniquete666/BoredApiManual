//
//  NetworkManager.swift
//  BoredApi
//
//  Created by Vyacheslav on 13.11.2022.
//

import Foundation
import Alamofire


enum Link: String {
    case link = "https://www.boredapi.com/api/activity/"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch(from url: String, completion: @escaping(Result<[Headers], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    print(value)
                    let headers = Headers.getHeaders(from: value)
                    completion(.success(headers))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
