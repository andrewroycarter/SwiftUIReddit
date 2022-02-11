//
//  RedditAPI.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

enum Method: String {
    case get = "GET"
    case post = "POST"
}

protocol Endpoint {
    associatedtype DecodeType: Decodable

    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var method: Method { get }
    var body: Data? { get }
    var contentTypeHeader: String? { get }
    var authorizationHeader: String? { get }
    
}

extension Endpoint {
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var method: Method {
        return .get
    }
    
    var body: Data? {
        return nil
    }
    
    var contentTypeHeader: String? {
        return nil
    }
    
    var authorizationHeader: String? {
        return nil
    }
    
    func makeURLRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.reddit.com"
        components.queryItems = queryItems
        components.path = path
        
        let url = components.url
        guard var request = url.map({ URLRequest(url: $0) }) else {
            return nil
        }
        
        request.httpBody = body
        request.httpMethod = method.rawValue
        
        if let contentTypeHeader = contentTypeHeader {
            request.addValue(contentTypeHeader, forHTTPHeaderField: "Content-Type")
        }
        
        if let authorizationHeader = authorizationHeader {
            request.addValue(authorizationHeader, forHTTPHeaderField: "Authorization")
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
