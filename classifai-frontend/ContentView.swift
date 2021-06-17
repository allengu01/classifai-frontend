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
    @State private var isShowingResults: Bool = false
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: Results(isShowingResults: $isShowingResults), isActive: $isShowingResults) {
                Home(isShowingResults: $isShowingResults)
            }
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
