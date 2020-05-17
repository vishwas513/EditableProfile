//
//  NetworkManager.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import Foundation

final class NetworkManager {
    
    // Making the network manager a singleton, cause its considered bad practice to have multiple object lifecycles of the network manager.
    private init() {}
    static let shared = NetworkManager()
    
    func get(urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> ()) {
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: {
            data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                completion(.success(data))
            }
        })
        task.resume()
    }
    
    func put(urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> ()) {
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: {
            data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                completion(.success(data))
            }
        })
        task.resume()
    }
    
    func buildRequest(url: URL, endpoint: Endpoint, payload: Data? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        
        switch endpoint {
        case .singleChoiceAttributes, .location, .getProfile:
            request.httpMethod = HttpMethod.get.rawValue
        case .putProfile:
            if let payload = payload {
                request.httpMethod = HttpMethod.put.rawValue
                request.httpBody = payload
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept") 
            }
        }
        return request
    }
}
