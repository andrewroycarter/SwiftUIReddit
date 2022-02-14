//
//  SideMenuViewUnauthed.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/14/22.
//

import SwiftUI

struct SideMenuViewUnauthed: View {
    
    var body: some View {
        VStack {
            SideMenuHeaderView()
            Divider()
            Spacer()
                .frame(height: 8.0)
            SideMenuAuthView()
            Spacer()
            Divider()
            SideMenuFooterView()
        }
    }
    
}

struct SideMenuViewUnauthed_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuViewUnauthed()
    }
}
