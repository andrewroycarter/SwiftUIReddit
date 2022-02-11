//
//  PostCellPlainBody.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import Foundation
import SwiftUI

struct PostCellPlainBody: View {
    
    let title: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.body)
                .lineLimit(5)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 0)
        }
    }
}

struct PostCellDefaultBody_Previews: PreviewProvider {
    static var previews: some View {
        PostCellPlainBody(title: Post.testPost.title)
            .previewLayout(.sizeThatFits)
    }
}
