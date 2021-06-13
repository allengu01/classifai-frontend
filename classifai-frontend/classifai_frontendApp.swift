//
//  classifai_frontendApp.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/11/21.
//

import SwiftUI

@main
struct classifai_frontendApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
