//
//  User.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/14/22.
//

import Foundation

struct User: Codable {
    
    let snoovatarImg: String?
    let totalKarma: Int
    let createdUtc: Int
    let name: String
    let iconImg: String?
    
    var snoovatarImgURL: URL? {
        return snoovatarImg.flatMap(URL.init(string:))
    }
    
    static let testUser = User(snoovatarImg: "https://i.redd.it/snoovatar/avatars/4b198000-fa2f-4ba3-b0bb-f8c87b5573b8.png",
                               totalKarma: 74339,
                               createdUtc: 1595042133,
                               name: "fiddletune",
                               iconImg: "https://styles.redditmedia.com/t5_2vmiae/styles/profileIcon_snoo4b198000-fa2f-4ba3-b0bb-f8c87b5573b8-headshot-f.png?width=256&amp;height=256&amp;crop=256:256,smart&amp;s=30103856bfd9fe65f4cef6fb50ce0a28963d0bd6")
    
}
