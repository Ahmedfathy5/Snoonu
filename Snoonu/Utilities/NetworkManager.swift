//
//  NetworkManager.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 22/09/2024.
//

import Foundation
import Combine

/// api: https://www.themealdb.com/api/json/v1/1/filter.php?a=Egyptian


protocol ApiManagerType: AnyObject {
    func fetch(url: URL) -> AnyPublisher<Data, NetworkError>
}

final class NetworkManager: ApiManagerType {
    
    private var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func fetch(url: URL) -> AnyPublisher< Data, NetworkError>{
        self.session.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { result in
                guard let httpRespons = result.response as? HTTPURLResponse,
                      httpRespons.statusCode >= 200 && httpRespons.statusCode < 300 else {
                    throw NetworkError.errorInResponse
                }
                return result.data 
            }
            .receive(on: DispatchQueue.main)
            .mapError { error -> NetworkError in
                if let error = error as? NetworkError {
                    return error
                }
                return NetworkError.decodingFaild
            }
            .eraseToAnyPublisher()
    }
}
