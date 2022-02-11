//
//  SideMenuView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import SwiftUI

struct SideMenuView: View {
    
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
            SideMenuHeaderView()
            Divider()
            Spacer()
                .frame(height: 8.0)
            SideMenuAuthView()
            Spacer()
            Divider()
            SideMenuFooterView()
        }.padding()
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
