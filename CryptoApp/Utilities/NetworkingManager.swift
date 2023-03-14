//
//  NetworkingManager.swift
//  CryptoApp
//
//  Created by Elodie Cari on 3/13/23.
//

import Combine
import Foundation

class NetworkingManager {
    
    static func download(url: URL) -> AnyPublisher<Data, any Error>{
        return URLSession.shared.dataTaskPublisher(for: url) // This URLSession will keep on liscenning so line 46 we cancel the task
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher() // allows us to return a convenient "small" return type
    }
}
