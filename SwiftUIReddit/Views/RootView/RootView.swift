//
//  RootView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/10/22.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var bottomSheetStore = BottomSheetStore()
    
    var body: some View {
        ZStack {
            TabBarView().environmentObject(bottomSheetStore)
            BottomSheetView(isPresented: $bottomSheetStore.isBottomSheetPresented, content: bottomSheetStore.bottomSheetContentView)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
