//
//  SideMenuView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var authStore: RedditAuthenticationStore
    
    var body: some View {
        switch authStore.state {
        case .signedOut:
            SideMenuViewUnauthed()
            
        case .signedIn:
            SideMenuViewAuthed(user: $authStore.signedInUser)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
