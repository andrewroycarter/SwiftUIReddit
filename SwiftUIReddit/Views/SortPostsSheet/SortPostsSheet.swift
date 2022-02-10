//
//  SortPostsSheet.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/10/22.
//

import SwiftUI

struct SortPostsSheet: View {
    var body: some View {
        VStack {
            ForEach(0..<5) { _ in
                HStack {
                    Image(systemName: "photo")
                    Text("test")
                    Spacer()
                }
                .padding()
            }
        }
        .background(.white)
        .cornerRadius(8.0)
    }
}

struct SortPostsSheet_Previews: PreviewProvider {
    static var previews: some View {
        SortPostsSheet()
    }
}
