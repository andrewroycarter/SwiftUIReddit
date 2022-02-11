//
//  SideMenuAuthView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import SwiftUI

struct SideMenuAuthView: View {
    
    @EnvironmentObject var authenticationStore: RedditAuthenticationStore
    
    var body: some View {
        VStack {
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
    }
}

struct SideMenuAuthView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuAuthView()
            .previewLayout(.sizeThatFits)
    }
}
