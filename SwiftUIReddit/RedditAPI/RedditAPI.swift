//
//  RedditAPI.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

protocol Endpoint {
    associatedtype DecodeType: Decodable

    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    
}

extension Endpoint {
    
    func makeURLRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.reddit.com"
        components.queryItems = queryItems
        components.path = path
        
        let url = components.url
        let request = url.map { url in
            return URLRequest(url: url)
        }
        return request
    }
    
}

class RedditAPI {

    enum Error: Swift.Error {
        case invalidRequestURL
    }
    
    // MARK: - Properties
    
    private let session = URLSession(configuration: .default)
    static let shared = RedditAPI()
    
    // MARK: - Instance Methods
    
    func request<T: Endpoint>(_ endpoint: T) async throws -> T.DecodeType {
        guard let request = endpoint.makeURLRequest() else {
            throw Error.invalidRequestURL
        }
        
        let value: T.DecodeType = try await perform(request: request)
        
        return value
    }
    
    func perform<T: Decodable>(request: URLRequest) async throws -> T {
        let (data, _) = try await session.data(for: request)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let value = try decoder.decode(T.self, from: data)
        return value
    }
    
}
