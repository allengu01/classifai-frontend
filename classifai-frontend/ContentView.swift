//
//  ContentView.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/11/21.
//

import SwiftUI
import PartialSheet

struct ContentView: View {
    @StateObject private var modelData = ModelData()
    @StateObject private var sheetManager: PartialSheetManager = PartialSheetManager()

//    @State private var selection: ContentNavigationState? = .home
    
    var body: some View {
        NavigationView {
            Home()
        }
        .environmentObject(modelData)
        .environmentObject(sheetManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
            .environmentObject(PartialSheetManager())
    }
}
