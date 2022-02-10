//
//  SortPostsSheet.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/10/22.
//

import SwiftUI

struct SortPostsSheet: View {
    
    @Binding var currentSortBy: Subreddit.Sort
    @EnvironmentObject var bottomSheetStore: BottomSheetStore

    var body: some View {
        VStack {
            ForEach(Subreddit.Sort.allCases) { sort in
                Button {
                    currentSortBy = sort
                    bottomSheetStore.dismiss()
                } label: {
                    HStack {
                        sort.icon
                        Text(sort.rawValue.capitalized)
                        Spacer()
                    }
                    .foregroundColor(currentSortBy == sort ? .primary : .secondary)
                }
            }
            .padding()
        }
        .background(.white)
        .cornerRadius(8.0)
    }
}

struct SortPostsSheet_Previews: PreviewProvider {
    static var previews: some View {
        SortPostsSheet(currentSortBy: .constant(.hot))
            .previewLayout(.sizeThatFits)
    }
}
