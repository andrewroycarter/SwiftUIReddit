//
//  Me.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/14/22.
//

import Foundation

struct Me: Endpoint {
    
    typealias DecodeType = User
    
    var path = "/api/v1/me"
    
}
