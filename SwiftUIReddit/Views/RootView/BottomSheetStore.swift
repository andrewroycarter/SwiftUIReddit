//
//  BottomSheetStore.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/10/22.
//

import Foundation
import SwiftUI

class BottomSheetStore: ObservableObject {
    
    @Published var bottomSheetContentView: AnyView = AnyView(EmptyView())
    @Published var isBottomSheetPresented = false
    
    func present<T: View>(@ViewBuilder _ content: () -> T) {
        withAnimation {
            bottomSheetContentView = AnyView(content())
            isBottomSheetPresented = true
        }
    }
    
}
