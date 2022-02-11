//
//  AccessToken.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import Foundation

struct AccessToken: Endpoint {
    
    typealias DecodeType = AccessTokenContainer
    
    var path = "/api/v1/access_token"
    let method = Method.post
    let code: String
    let clientId: String

    var body: Data? {
        return "grant_type=authorization_code&code=\(code)&redirect_uri=swiftuireddit://auth".data(using: .utf8)
    }
    
    var contentTypeHeader: String? {
        return "application/x-www-form-urlencoded"
    }
    
    var authorizationHeader: String? {
        guard let encodedPassword = "\(clientId):".data(using: .utf8)?.base64EncodedString() else {
            fatalError("Failed to encode password")
        }
        
        return "Basic \(encodedPassword)"
    }
    
}
