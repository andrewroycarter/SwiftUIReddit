//
//  RedditAPI.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation
import SwiftUI

enum Method: String {
    case get = "GET"
    case post = "POST"
}

enum Authorization {
    case value(String)
    case accessTokenIfSignedIn
}

protocol Endpoint {
    associatedtype DecodeType: Decodable

    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var method: Method { get }
    var body: Data? { get }
    var contentTypeHeader: String? { get }
    var authorization: Authorization? { get }
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

    var authorization: Authorization? {
        return .accessTokenIfSignedIn
    }
    
    func makeURLRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.queryItems = queryItems
        components.path = path
        
        let authorizationValue: String?
        switch (authorization, RedditAuthenticationStore.shared.state) {
        case (.accessTokenIfSignedIn, .signedIn(let token)):
            authorizationValue = "bearer \(token)"
            components.host = "oauth.reddit.com"

        case (.value(let value), _):
            authorizationValue = value
            components.host = "www.reddit.com"

        case (.accessTokenIfSignedIn, .signedOut),
            (nil, _):
            authorizationValue = nil
            components.host = "www.reddit.com"
        }
        
        let url = components.url
        guard var request = url.map({ URLRequest(url: $0) }) else {
            return nil
        }
        
        request.httpBody = body
        request.httpMethod = method.rawValue
        
        if let authorizationValue = authorizationValue {
            request.addValue(authorizationValue, forHTTPHeaderField: "Authorization")
        }
        
        if let contentTypeHeader = contentTypeHeader {
            request.addValue(contentTypeHeader, forHTTPHeaderField: "Content-Type")
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
