//
//  NetworkingManager.swift
//  CryptoApp
//
//  Created by Elodie Cari on 3/13/23.
//

import Combine
import Foundation

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badUrlResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badUrlResponse(url: let url): return "Bad response from URL: \(url)"
            case .unknown: return "Unkown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, any Error>{
        return URLSession.shared.dataTaskPublisher(for: url) // This URLSession will keep on listenning so line 46 we cancel the task
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher() // allows us to return a convenient "small" return type
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badUrlResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        print(completion)
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
