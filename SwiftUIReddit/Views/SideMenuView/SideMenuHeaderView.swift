//
//  SideMenuHeaderView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        VStack {
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
        }
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView()
            .previewLayout(.sizeThatFits)
    }
}
