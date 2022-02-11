//
//  SideMenuView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var sideMenuStore: SideMenuStore
    @EnvironmentObject var authenticationStore: RedditAuthenticationStore
    @StateObject var authenticationSession = RedditAuthenticationStore()
    
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
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 75.0, height: 75.0)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.secondary)
            Text("Sign up to upvote the best content, customize your feed, share your intrests, and more!")
                .font(.body)
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 8.0)
            Divider()
            Spacer()
                .frame(height: 8.0)
            Group {
                Button {
                    Task {
                        try await authenticationStore.signIn()
                    }
                } label: {
                    HStack {
                        Image(systemName: "person.circle")
                        Text("Sign up / Log in")
                            .bold()
                        Spacer()
                    }
                    .padding([.top, .bottom])
                }
                .foregroundColor(.primary)
                Spacer()
                    .frame(height: 8.0)
                HStack {
                    Image(systemName: "person.circle")
                    Text("Anonymouse Browsing")
                        .bold()
                    Spacer()
                }
                .padding([.top, .bottom])
            }
            Spacer()
            Divider()
            HStack {
                Image(systemName: "gearshape")
                Text("Settings")
                Spacer()
                Image(systemName: "moon")
            }
        }.padding()
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
