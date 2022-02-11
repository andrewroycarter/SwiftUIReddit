//
//  RootView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/10/22.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var bottomSheetStore = BottomSheetStore()
    @StateObject var sideMenuStore = SideMenuStore()
    
    var body: some View {
        let dismissSideMenuTapGesture = TapGesture().onEnded {
            withAnimation {
                sideMenuStore.isShowingMenu = false
            }
        }
        
        ZStack {
            GeometryReader { geometry in
                SideMenuView()
                    .frame(width: geometry.size.width * 0.75, height: geometry.size.height)
                TabBarView()
                    .shadow(radius: 8.0)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: sideMenuStore.isShowingMenu ? geometry.size.width * 0.75 : 0.0)
                    .disabled(sideMenuStore.isShowingMenu)
                    .gesture(sideMenuStore.isShowingMenu ? dismissSideMenuTapGesture : nil)
                BottomSheetView(isPresented: $bottomSheetStore.isBottomSheetPresented,
                                content: bottomSheetStore.bottomSheetContentView)
            }
        }
        .environmentObject(bottomSheetStore)
        .environmentObject(sideMenuStore)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
