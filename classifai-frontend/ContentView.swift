//
//  ContentView.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/11/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var modelData = ModelData()
//    @State private var selection: ContentNavigationState? = .home
    
    var body: some View {
        NavigationView {
            Home()
        }
        .environmentObject(modelData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
