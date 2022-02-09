//
//  SubredditDetail.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

struct SubredditDetail: Codable {
    
    let communityIcon: String?
    
    var cleanedCommunityIcon: String? {
        return communityIcon?.replacingOccurrences(of: ";amp;amp;", with: "").replacingOccurrences(of: "amp;", with: "")
    }
    
    var cleanedCommunityIconURL: URL? {
        return cleanedCommunityIcon.flatMap(URL.init(string:))
    }
    
    static let testSubredditDetail = SubredditDetail(communityIcon: "https://styles.redditmedia.com/t5_2qimj/styles/communityIcon_rxy00l0fn4581.png?width=256&s=62f48fbf6e1cc2b107a5a79939b96a36564caf49")
}
