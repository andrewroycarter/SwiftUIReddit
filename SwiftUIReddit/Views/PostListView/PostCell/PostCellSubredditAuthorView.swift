//
//  PostCellSubredditAuthorView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import SwiftUI

struct PostCellSubredditAuthorView: View {
    
    let author: String
    let subreddit: String
    let iconURL: URL?
    let shouldShowIcon: Bool
    
    var body: some View {
        HStack {
            if shouldShowIcon {
                AsyncImage(url: iconURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: "photo")
                }
                .frame(maxWidth: 30.0, maxHeight: 30.0)
            }
            
            VStack(alignment: .leading) {
                Text("r/") + Text(subreddit).bold()
                Text("u/" + author)
            }
            .font(.caption)
            Spacer()
            Image(systemName: "ellipsis")
        }
        .foregroundColor(.secondary)
    }
}

struct PostCellSubredditAuthorView_Previews: PreviewProvider {
    static var previews: some View {
        PostCellSubredditAuthorView(author: "Andrew",
                                    subreddit: "Cats",
                                    iconURL: URL(string: "https://styles.redditmedia.com/t5_2qimj/styles/communityIcon_rxy00l0fn4581.png?width=256&s=62f48fbf6e1cc2b107a5a79939b96a36564caf49"),
                                    shouldShowIcon: true)
            .previewLayout(.sizeThatFits)
    }
}
