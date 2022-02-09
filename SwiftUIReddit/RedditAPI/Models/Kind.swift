//
//  Kind.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

struct Kind<T: Codable>: Codable {
    let kind: String
    let data: T
}
