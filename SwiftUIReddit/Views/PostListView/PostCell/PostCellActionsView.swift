//
//  PostCellActionsView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import SwiftUI

struct PostCellActionsView: View {
    
    let score: String
    let comments: String
    
    var body: some View {
        HStack {
            Group {
                Image(systemName: "arrow.up")
                Text(score)
                Image(systemName: "arrow.down")
            }
            Spacer()
            Group {
                Image(systemName: "bubble.left")
                Text(comments)
            }
            Spacer()
            Group {
                Image(systemName: "square.and.arrow.up")
                Text("Share")
            }
            Spacer()
            Group {
                Image(systemName: "gift")
            }
        }
        .foregroundColor(.secondary)
        .font(.caption)
    }
}

struct PostCellActionsView_Previews: PreviewProvider {
    static var previews: some View {
        PostCellActionsView(score: "100", comments: "20")
            .previewLayout(.sizeThatFits)
    }
}
