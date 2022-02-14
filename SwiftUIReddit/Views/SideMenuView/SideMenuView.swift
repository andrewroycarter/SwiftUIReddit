//
//  SideMenuView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var authStore: RedditAuthenticationStore
    @EnvironmentObject var sideMenuStore: SideMenuStore

    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        sideMenuStore.isShowingMenu = false
                    }
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                }
                Spacer()
            }
            switch authStore.state {
            case .signedOut:
                SideMenuViewUnauthed()
                
            case .signedIn:
                SideMenuViewAuthed(user: $authStore.signedInUser)
            }
        }
        .padding()
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
